# SCAPP-LPI: Supply Chain Analytics & Performance Project - Logistics Performance Index

**Author**: Nathan Auerbach | nkauerba@ncsu.edu | [LinkedIn](https://www.linkedin.com/in/nkauerbach05)

## Project Overview

This project analyzes the World Bank's Logistics Performance Index (LPI) data from 2007-2023, focusing on supply chain performance trends and country-specific growth patterns. The analysis combines multiple data modeling approaches including Power BI dashboards, Excel analytics, Python forecasting, and SQL data processing.

## Key Features

### Interactive Power BI Drillthrough Dashboard
- **Country-specific analysis**: International LPI and Total Population CAGR statistics
- **Visualization components**:
  - *Radar Chart* for country benchmarking against global averages
  - *Bar Chart* with global average reference line
  - *Population trend line charts* with time series analysis
  - *Interactive cards* with key performance indicators
  - *Interactive bubble map* for all surveyed countries (139 countries)
- **Data integration**: Multiple configured Excel sheets imported into Power BI data model

### Excel, Python, and SQLite Data Models
- **Excel Analytics**:
  - Executive summary file with *Multiple Regression* analysis output
  - *XLOOKUP* and *VLOOKUP* functions with imported Total Population dataset
  - Multiple scatter plots with deep dive analysis (*Singapore case study*)
- **Python Forecasting**:
  - *Cubic Spline interpolation* model for predicting missing LPI scores
  - Population data forecasting for years without complete data
- **SQL Analysis**:
  - *CAGR* (Compound Annual Growth Rate) calculations
  - *Quintile categorization* for country growth performance
  - Data validation and quality checks

## Technical Specifications

### Data Sources
- **Primary**: [World Bank Logistics Performance Index (LPI)](https://lpi.worldbank.org/)
  - Coverage: 2007, 2010, 2012, 2014, 2016, 2018, 2023
  - Countries: 139 surveyed nations
- **Secondary**: World Bank Total Population data
  - Time series: 2007-2023 annual data

### Software Requirements
- **Power BI Desktop** (*latest version recommended*)
- **Microsoft Excel** (*2019 or later for XLOOKUP support*)
- **Python 3.8+** with libraries:
  - `pandas` for data manipulation
  - `scipy` for interpolation functions
  - `numpy` for numerical computations
- **SQLite** or **SQLiteStudio** for database operations

### File Structure
```
SCAPP-LPI/
├── README.md                          # This file
├── DATA_DICTIONARY.md                 # Data definitions and methodology
├── Worldbank_LPI_drillllly.pbix      # Power BI dashboard file
├── LPI_Worldbank.xlsx                # Source data and Excel analytics
├── SCAPP_LPI_project.sqbpro          # SQLiteStudio project file
├── improved_lpi_analysis.sql         # Enhanced SQL queries
├── SCAPP-LPI.pptx                    # Project presentation
├── LPI_Interpolation (1).pdf         # Methodology documentation
└── BUG_FIXES_AND_IMPROVEMENTS.md    # Technical improvements log
```

## Setup Instructions

### 1. Data Setup
1. Download the project files to your local directory
2. Ensure the Excel file `LPI_Worldbank.xlsx` is in the same directory as the Power BI file
3. If using SQL analysis, import the data into SQLite using the provided scripts

### 2. Power BI Dashboard
1. Open `Worldbank_LPI_drillllly.pbix` in Power BI Desktop
2. Refresh data connections if prompted
3. Navigate between pages using the page tabs at the bottom

### 3. SQL Analysis
1. Open SQLiteStudio or your preferred SQLite client
2. Load the `SCAPP_LPI_project.sqbpro` project file
3. Execute queries from `improved_lpi_analysis.sql` for enhanced analysis

### 4. Python Forecasting (*if available*)
1. Install required Python libraries: `pip install pandas scipy numpy`
2. Run the interpolation scripts to generate forecasted values

## Key Metrics & Analysis

### CAGR Analysis (2007-2023)
- **Formula**: *CAGR = (Ending Value / Beginning Value)^(1/years) - 1*
- **Application**: Applied to both LPI scores and population data
- **Quintile Classification**: Countries ranked into 5 performance categories

### LPI Components
1. **Customs**: *Efficiency of customs and border management*
2. **Infrastructure**: *Quality of trade and transport infrastructure*
3. **International shipments**: *Ease of arranging competitively priced shipments*
4. **Logistics quality**: *Competence and quality of logistics services*
5. **Tracking & tracing**: *Ability to track and trace consignments*
6. **Timeliness**: *Timeliness of shipments in reaching destinations*

## Future Development Plans

### Phase 1: Data Expansion
- Integrate [WITS UN Comtrade](https://wits.worldbank.org/) industry-specific trade data
- Add *HS Code-based* product categorization
- Include pet industry import/export analysis (*Pet Food, Pet Toys, Pet Technology*)

### Phase 2: Dashboard Enhancement
- Update Power BI dashboard with additional data sources
- Create *interactive tooltip pages* for stakeholder presentations
- Add *real-time data refresh* capabilities

### Phase 3: Advanced Analytics
- *Machine learning models* for LPI score prediction
- *Correlation analysis* between LPI improvements and trade volumes
- *Supply chain resilience* indicators

## Data Quality & Validation

The project includes comprehensive data validation:
- **Duplicate detection**: *Automated checks for country data duplicates*
- **Outlier identification**: *CAGR values outside ±15% are flagged for review*
- **Missing data handling**: *NULL value management and interpolation strategies*
- **Consistency checks**: *Cross-validation between different data sources*

## Contributing

For questions, suggestions, or collaboration opportunities, please contact:
- **Email**: nkauerba@ncsu.edu
- **LinkedIn**: [Nathan Auerbach](https://www.linkedin.com/in/nkauerbach05)

## License

This project is for *academic and research purposes*. Data sources are credited to their respective organizations (*World Bank, UN Comtrade*).

---

*Last Updated: 2024*  
*Version: 1.0*


