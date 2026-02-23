# Aufbau Datensatz
  
  # 0. Sequenz der Arbeitsschritte ----
    
    set.seed(1005)
    
    # Notizen:
    #   1001 -> mean & sd gut [9x] + Ergebnis signifikant* (df_1)
    #   1003 -> mean & sd gut + Ergebnis nicht signifikant (df_3)
    #   1005 -> mean & sd gut [16x] + Ergebnis knapp nicht signifikant (df_5)
    #   1007 -> mean & sd gut + Ergebnis signifikant** (df_7)

    
  # 1. Werte für jede Gruppe ----
    
    # Befehle:
    #   round() = rundet die Ergebnisse [wenn nix steht auf ganze Zahlen]
    #   rnorm() = Generieren eines Datensatz mit {1}n, {2}mean, {3}sd
    
    g1 <- round(rnorm(10, 50, 10))
    g2 <- round(rnorm(10, 55, 10))
    g3 <- round(rnorm(10, 45, 10))
    
    # 1-faktorielle ANOVA:
    #   Hier wird eine randomisierte Normalverteulung [auf Stichprobenebene und
    #   nicht Populationsebene] für jede Gruppe erstellt. Denn bei einer
    #   1-faktoriellen ANOVA wird die Streuung der einzelnen Gruppen
    #   miteinander verglichen.
    
    # 1.1 Mittelwerte jeder Gruppe
      
      mean(g1)
      mean(g2)
      mean(g3)
      
      # Ziel = Werte sollten nicht stark abweichen/die Struktur torpedieren
      # Hinweis: Manipulation der Streuung durch Werteänderung möglich
      
    # 1.2 Standardabweichung jeder Gruppe
      
      sd(g1)
      sd(g2)
      sd(g3)
      
      # Ziel = Werte sollten höchstens um ~1.5 voneinander abweichen
      
    # 1.3 Histogramm jeder Gruppe
      
      hist(g1)
      hist(g2)
      hist(g3)
      
      # Ziel = Werte sollten eine Art Gauss-Kurve ergeben
      
  # 2. Bestimmung der Faktoren ----
    
    # 2.1 Personen
      
      Namen <- c("Muhammad", "Aya", "Lethabo", "Fatima", "Jakari", "Onalerona",
                 "Mateo", "Isabella", "Noah", "Emma", "Santiago", "Maria",
                 "Minato", "Mei", "Ram", "Rekha", "Somchai", "Nguyên", "Oliver",
                 "Sophia", "Luka", "Yelena", "Gabriel", "Mia", "Jack",
                 "Charlotte", "Manea", "Kiana", "Ariki", "Aroha")
      
    # 2.2 Nummerierung der Personen
      
      Vp_Nummer <- 1:30
      
    # 2.3 Gruppen
      
      Gruppen <- rep(c("A", "B", "C"), each = 10)
      
    # 2.4 Index 
      
      Index <- sprintf("%i,%i", rep(1:3, each = 10), rep(1:10, 3))
      
      # Hinweis: Gruppe dann Person
      
  # 3. Erstellen des df ----
    
    df_3 <- data.frame(Vp_Nummer, Namen, Gruppen, Index, c(g1, g2, g3))
    
      
      
      # Umbennenen der Spalten
      
      colnames(df_3) <- c("VP_Nummer", "Name", "Gruppe", "Index", "AV")
      
  # 4. Provisorische Analyse ----
    
    library(afex)
    library(performance)
    
    e <- aov_ez("VP_Nummer", "AV", df_7, between = "Gruppe")
    check_homogeneity(e)
    summary(e)
    
  # 5. Abspeichern des df
    
    write.csv(df_7, "df_7.csv", row.names = FALSE)
    