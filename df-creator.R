# df-creator

# 1. Zufallsgenerator
  
  set.seed(1000)
  
# 2. Randomisierte Normalverteilung
  
  # WICHTIG -> auf Stichprobenebene & nicht ???
  
  # = Anzahl, Mittelwert, Standardabweichung
  rnorm(1, 50, 10)
  
# 3. Zusammenstellung des Datensatz
  
  # 3.1 Wie?
  
  # Ziehen = sample(Objekte, Anzahl, Zurücklegen, Wahrscheinlichkeit)
  sample(c(A), 20, replace = TRUE, prob = 0.4)
  
  # 3.2 Was?
  
  # Zusammenhang zwischen Gewissenhaftigkeit und Intelligenz
  # => 1 Punkt Gewissenhaftigkeit resultirert in 0.2 Intelligenz
  
  df <- data.frame(VP = 1:100, Gewissenhaftigkeit = NA, Intelligenz = NA)
  df$Gewissenhaftigkeit <- round(rnorm(100, 50, 10), 0)
  df$Intelligenz <- round(rnorm(100, 100, 15) + 0.2 
                          * scale(df$Gewissenhaftigkeit, scale = FALSE), 0)
  summary(df)
  
  summary(lm(Intelligenz ~ Gewissenhaftigkeit, df))
  
# 4. Abspeichern des Datensatz
  
  write.csv(df, "datensatz_test.csv", row.names = FALSE)