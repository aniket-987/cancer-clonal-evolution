import pandas as pd
import numpy as np
from sklearn.mixture import BayesianGaussianMixture
import os

def run_deconvolution(input_csv):
    # Professional logic: Clustering Variant Allele Frequencies (VAF) 
    # to find distinct clonal populations.
    print(f"Analyzing subclonal architecture from {input_csv}...")

    try:
        df = pd.read_csv(input_csv)
        # We reshape the VAF column so the ML model can read it
        vaf_data = df['vaf'].values.reshape(-1, 1)
    except Exception as e:
        print(f"Error loading data: {e}")
        return
    
    # Bayesian Gaussian Mixture Model (BGMM) figures out how many 'clones' exist
    bgmm = BayesianGaussianMixture(n_components=5, weight_concentration_prior=0.01, random_state=42)
    bgmm.fit(vaf_data)
    clusters = bgmm.predict(vaf_data)
    
    output = pd.DataFrame({'VAF': vaf_data.flatten(), 'Clone_ID': clusters})
    output.to_csv("subclones.csv", index=False)
    print("\n--- Results ---")
    print(output)
    print("\nDeconvolution complete. Subclonal clusters identified in 'subclones.csv'.")

if __name__ == "__main__":
    # Look for the file inside the scripts folder
    target_file = "scripts/vaf_data.csv"
    run_deconvolution(target_file)