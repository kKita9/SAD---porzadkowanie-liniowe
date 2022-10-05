# ---------------- METODA HELLWIGA ----------------
# wczytanie danych
dane <- read.csv("dane/dane_NBA.csv", header = TRUE, sep = ";", row.names = 1)
dane

# okreslenie zmiennych w zbiorze
# AGE - nominanta ( wartosc optymalna = 25)
# W - stymulanta
# L - destymulanta
# MIn - stymulanta
# PTS - stymulanta
# FG. - stymulanta
# X3P - stymulanta
# FT - stymulanta

# zamiana typu danych
x <- as.numeric(dane$FT.)
x

# zamiana nominanyty na stymulante
age_N = 25 

for(i in 1:nrow(dane)){
  if(dane[i, "AGE"] == age_N){
    dane[i, "AGE"] = 1
  } else if(dane[i, "AGE"] < age_N){
    dane[i, "AGE"] = -1 / (dane[i, "AGE"] - age_N - 1)
  } else {
    dane[i, "AGE"] = 1 / (dane[i, "AGE"] - age_N + 1)
  }
}

# zamiana destymulanty na stymulante 
dane$L <- -1 * dane$L

# standaryzacja danych 
dane_st <- as.data.frame(scale(dane))
dane_st

# wyznaczenie wzorca 
wzorzec <- c(max(dane_st[, ""]),
             max(dane_st[, ""]),
             max(dane_st[, ""]),
             max(dane_st[, ""]),
             max(dane_st[, ""]),
             max(dane_st[, ""]),
             max(dane_st[, ""]),
             max(dane_st[, ""]),
             )


for(i in 1:nrow(dane)){
  print(typeof(dane[i, i]))
}
