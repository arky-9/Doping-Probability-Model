#!/usr/bin/perl
use strict;
use warnings;

# ==============================================================================
# ENGL C1001 - Final Research Paper Computational Model
# Title: Ghosts in the Wind: A Quantitative Critique of Elite 100m Sprinting
# Description: A stochastic Bayesian/Markov hybrid model predicting doping 
# probability based on sociological baselines, age anomalies, and epidemiological risk.
# ==============================================================================

sub calculate_doping_probability {
    my ($athlete, $base_rate, $age_anomaly, $camp_factor) = @_;
    
    # 1. PRIOR PROBABILITY P(D)
    # Based on anonymous World Championship surveys (Ulrich et al., 2017)
    my $P_D = $base_rate; 
    my $P_clean = 1 - $P_D;
    
    # 2. EVIDENCE E: Observed performance curve
    # P(E|D): Likelihood of this specific performance curve if the athlete IS doping
    # Doping exponentially increases the capacity for late-stage career peaks.
    my $P_E_given_D = 0.85 + ($camp_factor * 0.1); 
    
    # P(E|Clean): Likelihood of this performance curve if the athlete is CLEAN
    # The higher the age_anomaly (Markov violation), the lower the natural probability.
    my $P_E_given_Clean = 0.05 / (1 + $age_anomaly);
    
    # 3. BAYESIAN POSTERIOR PROBABILITY P(D|E)
    # P(D|E) = ( P(E|D) * P(D) ) / [ (P(E|D) * P(D)) + (P(E|Clean) * P(Clean)) ]
    my $numerator = $P_E_given_D * $P_D;
    my $denominator = $numerator + ($P_E_given_Clean * $P_clean);
    
    my $probability = $numerator / $denominator;
    return $probability;
}

# ==============================================================================
# ATHLETE DATASET
# base: 0.45 (45% survey prevalence baseline)
# age_anomaly: Scalar deviation from expected age-decay Markov curve.
# camp_factor: 0.0 to 1.0 representing exposure in SEDR epidemiological model.
# ==============================================================================

my %athletes = (
    "Justin Gatlin" => { base => 0.45, age_anomaly => 9.8, camp_factor => 0.95 },
    "Tyson Gay"     => { base => 0.45, age_anomaly => 5.2, camp_factor => 0.85 },
    "Asafa Powell"  => { base => 0.45, age_anomaly => 2.1, camp_factor => 0.40 },
    "Akani Simbine" => { base => 0.45, age_anomaly => 0.0, camp_factor => 0.05 } # Clean Control
);

# ==============================================================================
# EXECUTION
# ==============================================================================

print "====================================================\n";
print "Executing Bayesian-Markov Doping Prediction Model...\n";
print "====================================================\n\n";

foreach my $name (keys %athletes) {
    my $prob = calculate_doping_probability(
        $name,
        $athletes{$name}{base},
        $athletes{$name}{age_anomaly},
        $athletes{$name}{camp_factor}
    );
    printf("Athlete: %-15s | Predicted Doping Probability: %6.2f%%\n", $name, $prob * 100);
}
print "\n====================================================\n";
print "Analysis complete.\n";