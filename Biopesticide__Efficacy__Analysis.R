# 1. Create a structured Plant Protection dataset (Fungicide vs. Botanical Extract efficacy)
set.seed(123)
plant_data <- data.frame(
  Treatment = rep(c("Control (Water)", "Neem Extract (Azadirachtin)", "Chemical Fungicide"), each = 20),
  Disease_Severity_Percent = c(
    rnorm(20, mean = 68, sd = 8),   # High disease in untreated control
    rnorm(20, mean = 22, sd = 5),   # Low disease with botanical extract
    rnorm(20, mean = 18, sd = 4)    # Low disease with chemical control
  )
)

# 2. Run One-Way ANOVA & Tukey HSD statistical test
anova_res <- aov(Disease_Severity_Percent ~ Treatment, data = plant_data)
print(summary(anova_res))
print(TukeyHSD(anova_res))

# 3. Save summary table and publication-ready Boxplot
write.csv(plant_data, "Biopesticide_Efficacy_Data.csv", row.names = FALSE)

png("Biopesticide_Efficacy_Boxplot.png", width = 800, height = 600, res = 120)
boxplot(Disease_Severity_Percent ~ Treatment, data = plant_data,
        col = c("#e74c3c", "#2ecc71", "#3498db"),
        main = "Efficacy of Botanical Extract vs. Chemical Fungicide in Leaf Spot Control",
        ylab = "Foliar Disease Severity (%)", xlab = "")
dev.off()

print("Done! Both CSV and PNG saved in Documents.") 

