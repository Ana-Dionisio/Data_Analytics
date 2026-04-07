# 📘 Impact of Short-Term Rentals (HUTs) on Housing Prices in Barcelona  
### Master Thesis – Data Analysis, Econometrics & Counterfactual Modelling

This repository contains all materials developed for my thesis on the impact of short‑term rentals (HUTs) on the housing market in Barcelona.  
The project combines econometric modelling, spatial analysis, and counterfactual simulation to estimate how rental and selling prices would change under a scenario of **zero tourist apartments**.

---

## 📦 Installation

To install all dependencies:

```
pip install -r requirements.txt
```

---

## 📂 Repository Structure

```
├── data/                         # Raw data used in the analysis
│   ├── barcelonaciutat_barris.json
│   ├── hotels.csv
│   ├── housing_rental.csv
│   ├── housing_sales.csv
│   ├── hut_comunicacio_opendata.csv
│   ├── percapita_income.csv
│   ├── population_history.csv
│   └── administrative_boundaries/
│
├── notebooks/                    # Jupyter Notebook with full code
│   └── hut_impact_analysis.ipynb
│
├── report/                       # Final written report (PDF) + images
│   ├── hut_impact_report.pdf
│   └── IMAGES/
│       ├── hut_distribution.png
│       ├── kde_impacts.png
│       └── kmeans_cluster_map.png
│
├── slides/                       # Presentation slides (PPTX)
│   └── hut_impact_presentation.pptx
│
├── requirements.txt              # Dependencies
└── README.md                     # Project documentation
```

---

## 🚀 How to Run

1. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
2. Open the notebook:
   ```
   notebooks/hut_impact_analysis.ipynb
   ```
3. Run all cells to reproduce the analysis.

---

## 🗂️ Data Sources

All datasets used in this project come from official and publicly accessible sources related to the city of Barcelona. Below is an overview of each dataset and its origin:

### **1. HUT (Tourist Apartments) Data**  
**Source:** Ajuntament de Barcelona – Open Data BCN  
**File:** `hut_comunicacio_opendata.csv`  
Contains the registry of tourist apartments (HUTs), including location and license information.

### **2. Housing Prices (Rental & Sales)**  
**Source:** Ajuntament de Barcelona – Housing Market Statistics  
**Files:**  
- `housing_rental.csv`  
- `housing_sales.csv`  
Provide average rental and selling prices by neighborhood.

### **3. Hotels and Accommodation**  
**Source:** Open Data BCN – Tourism and Accommodation  
**File:** `hotels.csv`  
Includes hotel locations and capacity, used as a control variable for tourism pressure.

### **4. Income per Capita**  
**Source:** Ajuntament de Barcelona – Socioeconomic Indicators  
**File:** `percapita_income.csv`  
Contains average income per capita by neighborhood.

### **5. Population and Demographics**  
**Source:** Ajuntament de Barcelona – Demographic Statistics  
**File:** `population_history.csv`  
Provides population counts and density information.

### **6. Administrative Boundaries**  
**Source:** Ajuntament de Barcelona – Cartography and GIS  
**Files:**  
- `barcelonaciutat_barris.json`  
- `administrative_boundaries/`  
Used for spatial joins, mapping, and geospatial analysis.

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

---

### **2. Correlation Analysis**

A correlation matrix and heatmap were computed to assess multicollinearity.  
Some predictors show moderate to strong correlations, which helps explain why certain coefficients are not statistically significant.

---

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

## ⚠️ Limitations & Future Work

### **Limitations**

- **Data availability and granularity**  
  Some socioeconomic variables are only available at the neighborhood level, limiting the precision of spatial modelling.

- **Potential omitted variables**  
  Building characteristics, renovation status, and micro‑location amenities were not included due to data constraints.

- **Temporal mismatch across datasets**  
  Different update cycles may introduce inconsistencies when combining sources.

- **Causality limitations**  
  OLS identifies associations, not causal effects, and results should be interpreted accordingly.

- **Simplified counterfactual scenario**  
  The “HUT density = 0” scenario assumes immediate and homogeneous market adjustment, which may not reflect real-world dynamics.

---

### **Future Work**

- Apply **causal inference methods** (DiD, Synthetic Control, IV).  
- Build a **panel dataset** to model dynamic effects over time.  
- Integrate **building‑level attributes** to reduce omitted variable bias.  
- Simulate **partial regulation scenarios** (license caps, zoning restrictions).  
- Extend the analysis to **other European cities** for comparison.

---

## 📌 Files Included

- **hut_impact_analysis.ipynb** – full code for data cleaning, modelling, correlation analysis, and counterfactual simulation  
- **hut_impact_report.pdf** – complete written thesis  
- **hut_impact_presentation.pptx** – presentation slides used in the defense  

---

## 🛠️ Technologies Used

- Python (pandas, numpy, seaborn, matplotlib, statsmodels, geopandas)  
- Jupyter Notebook  
- QGIS (optional, for spatial visualization)  
- Word (report)  
- PowerPoint (presentation)

---

## 📬 Contact

If you have questions or would like to discuss the methodology, feel free to reach out.

---