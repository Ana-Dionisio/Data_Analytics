# Impact of Short-Term Rentals (HUTs) on Housing Prices in Barcelona  
### Master Thesis – Data Analysis, Econometrics & Counterfactual Modelling

This repository contains all materials developed for my thesis on the impact of short‑term rentals (HUTs) on the housing market in Barcelona.  
The project combines econometric modelling, spatial analysis, and counterfactual simulation to estimate how rental and selling prices would change under a scenario of **zero tourist apartments**.

---

## 📂 Repository Structure
── notebooks/                # Jupyter Notebook with full code │   └── Sprint13_C.ipynb ├
── report/                   # Final written report (PDF) ├
── slides/                   # Presentation slides (PDF or PPTX) └
── README.md                 # Project documentation


---

## 🎯 Project Objectives

- Analyse the relationship between **HUT density** and **housing prices** (rental and selling).
- Estimate elasticities using **log‑log OLS models**.
- Compare Barcelona with international cases (Amsterdam, Palma de Mallorca).
- Build a **counterfactual scenario** where all HUTs are removed.
- Evaluate how prices would react under this hypothetical policy.

---

## 📊 Methodology Overview

### **1. Econometric Modelling (OLS)**  
Two log‑log regressions were estimated:

- `log_selling_price ~ log_hut_density + controls`
- `log_rental_price ~ log_hut_density + controls`

Controls include:

- income per capita  
- foreign population density  
- hotel density  
- population density  

Because the model is log‑log, all coefficients are interpreted as **elasticities**.

### **2. Correlation Analysis**  
A correlation matrix and heatmap were computed to assess multicollinearity.  
Some predictors show moderate to strong correlations, which helps explain why certain coefficients are not statistically significant.

### **3. Counterfactual Simulation**  
Using the estimated elasticities, two scenarios were generated:

- **Baseline**: current HUT density  
- **Counterfactual**: HUT density = 0  

The difference between predicted prices in both scenarios represents the estimated impact of eliminating tourist apartments.

---

## 🗺️ Key Findings

- **Selling prices** show a small positive elasticity with HUT density, but the effect is not statistically significant.  
- **Rental prices** show a negative elasticity with HUT density, close to significance.  
- **Income per capita** is the strongest predictor in both models.  
- In the counterfactual scenario:
  - **Rental prices increase** due to higher residential demand in central areas.
  - **Selling prices decrease slightly** because properties lose the high‑profitability premium associated with tourist licenses.

---

## 📌 Files Included

- **Sprint13_C.ipynb** – full code for data cleaning, modelling, correlation analysis, and counterfactual simulation  
- **Final_Project_Report.pdf** – complete written thesis  
- **Sprint13.pdf** – presentation slides used in the defense  

---

## 🛠️ Technologies Used

- Python (pandas, numpy, seaborn, matplotlib, statsmodels)
- Jupyter Notebook  
- QGIS (optional, for spatial visualization)
- Word (report)
- PowerPoint (presentation)

---

## 📬 Contact

If you have questions or would like to discuss the methodology, feel free to reach out.
