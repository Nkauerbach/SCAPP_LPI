# Data Dictionary - SCAPP-LPI Project

## 📋 Overview

This data dictionary provides detailed information about the datasets, metrics, and methodologies used in the Supply Chain Analytics & Performance Project focusing on the Logistics Performance Index (LPI).

---

## 🌐 Primary Data Source: World Bank Logistics Performance Index (LPI)

### Data Source Details
- **Publisher**: World Bank Group
- **Official URL**: [https://lpi.worldbank.org/](https://lpi.worldbank.org/)
- **Data Type**: Survey-based index
- **Survey Methodology**: Questionnaire completed by logistics professionals worldwide
- **Survey Frequency**: Biennial (every 2 years)
- **Latest Update**: 2023

### Survey Years Available
| Year | Countries Surveyed | Notes |
|------|-------------------|-------|
| 2007 | 150 | First LPI survey |
| 2010 | 155 | |
| 2012 | 155 | |
| 2014 | 160 | |
| 2016 | 160 | |
| 2018 | 167 | |
| 2023 | 139 | COVID-19 impact on survey participation |

---

## 📊 LPI Score Components & Methodology

### Overall LPI Score (Scale: 1-5)
The LPI is calculated as the weighted average of six key dimensions:

#### 1. Customs (Weight: ~16.7%)
- **Definition**: Efficiency of customs and border management clearance
- **Measurement**: Speed, simplicity, and predictability of formalities
- **Scale**: 1 (very low) to 5 (very high)

#### 2. Infrastructure (Weight: ~16.7%)
- **Definition**: Quality of trade and transport-related infrastructure
- **Includes**: Ports, airports, roads, railways, warehouses, telecommunications
- **Scale**: 1 (very low) to 5 (very high)

#### 3. International Shipments (Weight: ~16.7%)
- **Definition**: Ease of arranging competitively priced shipments
- **Measurement**: Cost-effectiveness and efficiency of shipping services
- **Scale**: 1 (very difficult) to 5 (very easy)

#### 4. Logistics Quality and Competence (Weight: ~16.7%)
- **Definition**: Competence and quality of logistics services
- **Includes**: Transport operators, customs brokers, forwarders
- **Scale**: 1 (very low) to 5 (very high)

#### 5. Tracking and Tracing (Weight: ~16.7%)
- **Definition**: Ability to track and trace consignments
- **Measurement**: Information systems and transparency
- **Scale**: 1 (very low) to 5 (very high)

#### 6. Timeliness (Weight: ~16.7%)
- **Definition**: Timeliness of shipments reaching destination within scheduled time
- **Measurement**: Frequency of on-time delivery
- **Scale**: 1 (nearly never) to 5 (nearly always)

### LPI Calculation Formula
```
LPI Score = (Customs + Infrastructure + Int_Shipments + Logistics_Quality + Tracking + Timeliness) / 6
```

---

## 📈 CAGR (Compound Annual Growth Rate) Methodology

### Definition
CAGR represents the mean annual growth rate over a specified time period, assuming annual compounding.

### Formula
```
CAGR = (Ending Value / Beginning Value)^(1/Number of Years) - 1
```

### Application in This Project
- **Time Period**: 2007-2023 (16 years)
- **Beginning Value**: LPI Score in 2007 (or earliest available year)
- **Ending Value**: LPI Score in 2023 (or latest available year)
- **Result**: Expressed as decimal (e.g., 0.025 = 2.5% annual growth)

### CAGR Categories (Quintiles)
| Quintile | Rank | CAGR Range | Performance Level |
|----------|------|------------|-------------------|
| 1 | Top 20% | Highest CAGR values | Excellent |
| 2 | 60-80% | Above median | Good |
| 3 | 40-60% | Around median | Average |
| 4 | 20-40% | Below median | Below Average |
| 5 | Bottom 20% | Lowest CAGR values | Poor |

---

## 🗂️ Dataset Field Definitions

### Primary LPI Dataset Fields

| Field Name | Data Type | Description | Range/Format |
|------------|-----------|-------------|--------------|
| `Country` | Text | Country name (English) | Full country names |
| `Country_Code` | Text | ISO 3-letter country code | XXX format |
| `Year` | Integer | Survey year | 2007, 2010, 2012, 2014, 2016, 2018, 2023 |
| `LPI_Score` | Decimal | Overall LPI score | 1.00 - 5.00 |
| `LPI_Rank` | Integer | Global ranking | 1 - 167 (varies by year) |
| `Customs` | Decimal | Customs efficiency score | 1.00 - 5.00 |
| `Infrastructure` | Decimal | Infrastructure quality score | 1.00 - 5.00 |
| `Int_Shipments` | Decimal | International shipments score | 1.00 - 5.00 |
| `Logistics_Quality` | Decimal | Logistics services quality score | 1.00 - 5.00 |
| `Tracking` | Decimal | Tracking and tracing score | 1.00 - 5.00 |
| `Timeliness` | Decimal | Delivery timeliness score | 1.00 - 5.00 |

### Calculated Fields

| Field Name | Data Type | Description | Calculation |
|------------|-----------|-------------|-------------|
| `CAGR` | Decimal | Compound Annual Growth Rate | (LPI_2023/LPI_2007)^(1/16) - 1 |
| `Quintile` | Integer | Performance quintile (1-5) | NTILE(5) OVER (ORDER BY CAGR DESC) |
| `Quintile_Category` | Text | Descriptive quintile label | Based on quintile rank |
| `Growth_Direction` | Text | Growth trend indicator | Positive/Negative/Zero |

---

## 🌍 Country Inclusion/Exclusion Criteria

### Inclusion Criteria
- Countries with LPI data for at least 2 survey years
- Minimum data points for CAGR calculation: 2007 and 2023 (or sufficient interpolated data)
- Countries recognized by the World Bank classification system

### Exclusion Criteria
- Countries with insufficient data points (< 2 survey years)
- Territories or regions not classified as sovereign nations
- Countries with significant data quality issues or inconsistencies

### Geographic Coverage
- **Total Countries in Analysis**: 139 (2023 survey)
- **Regional Distribution**:
  - Europe & Central Asia: ~40 countries
  - Sub-Saharan Africa: ~35 countries
  - East Asia & Pacific: ~25 countries
  - Latin America & Caribbean: ~25 countries
  - Middle East & North Africa: ~15 countries
  - South Asia: ~8 countries

---

## 🔄 Data Update Schedule & Versioning

### Update Frequency
- **LPI Survey**: Every 2 years (biennial)
- **Next Expected Survey**: 2025
- **Population Data**: Annual updates from World Bank

### Data Quality Assurance
- **Outlier Detection**: CAGR values > ±15% flagged for review
- **Missing Data**: Handled via cubic spline interpolation
- **Consistency Checks**: Cross-validation between survey years
- **Duplicate Detection**: Automated validation for country uniqueness

### Version Control
- **Current Version**: 1.0 (2024)
- **Data Cutoff**: 2023 LPI Survey
- **Last Updated**: December 2024

---

## 📊 Secondary Data Sources

### World Bank Population Data
- **Source**: World Bank Open Data
- **URL**: [https://data.worldbank.org/](https://data.worldbank.org/)
- **Indicator**: Population, total (SP.POP.TOTL)
- **Time Series**: 2007-2023
- **Purpose**: Population growth correlation analysis

### Planned Future Data Integration
- **UN Comtrade**: Trade statistics by HS codes
- **WITS**: World Integrated Trade Solution data
- **Focus**: Pet industry trade analysis (Pet Food, Toys, Technology)

---

## ❗ Data Limitations & Considerations

### Survey Limitations
- **Self-reported data**: Based on perceptions of logistics professionals
- **Survey bias**: May reflect respondent experiences rather than objective measures
- **Country participation**: Varies by survey year due to capacity or political factors

### Temporal Considerations
- **COVID-19 Impact**: 2023 survey may reflect pandemic-related logistics disruptions
- **Economic cycles**: LPI scores may be influenced by broader economic conditions
- **Infrastructure development**: Major infrastructure projects may not be immediately reflected

### Statistical Considerations
- **Sample size**: Varies by country and survey year
- **Interpolation**: Some data points estimated using cubic spline methodology
- **CAGR assumptions**: Assumes consistent growth patterns, which may not reflect reality

---

## 📞 Data Support & Contact

For questions about data methodology, calculations, or access:

**Project Contact**: Nathan Auerbach  
**Email**: nkauerba@ncsu.edu  
**LinkedIn**: [Nathan Auerbach](https://www.linkedin.com/in/nkauerbach05)

**Original Data Source Contact**: World Bank LPI Team  
**Website**: [https://lpi.worldbank.org/about](https://lpi.worldbank.org/about)

---

*Last Updated: December 2024*  
*Version: 1.0*