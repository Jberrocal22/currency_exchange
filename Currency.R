# Carga de paquetes/librerías
library(rvest)
library(xml2)
library(stringr)
library(dplyr)
library(sqldf)

# BD Historica 12 meses por año desde el 2019 USD to Local Currency
Hist_Curr <-            c("https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2023.html", 
                          "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2023.html",
                          
                          "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2023.html", 
                          "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2023.html",
                          "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2019.html",
                          "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2020.html",
                          "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2021.html",
                          "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2022.html",
                          "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2023.html"
)

# Función creada para cargar datos NULL al momento de hacer Webscrapping
html_text_na <- function(x, ...) {
  
  txt <- try(html_text(x, ...))
  if (inherits(txt, "try-error") |
      (length(txt)==0)) { return(NA) }
  return(txt)
  
}

# Programación de combinación de nodos de exchangerates.org.uk
pager <- function(page) {
  doc <- read_html(url(page))
  data.frame(
    YYYY =doc %>% html_nodes("#content > div > h1") %>% html_text_na,
    Rate =doc %>% html_nodes("b em") %>% html_text_na,
    Currency =doc %>% html_nodes("#content > div > div:nth-child(4) > div.large-7.medium-7.small-12.columns.nolpad > h2") %>% html_text_na
  ) 
}

options(stringsAsFactors=F)

# Programación de LOOP y asignación de variable con los datos
HC <- do.call(rbind, lapply(Hist_Curr, pager))
HC <- as.data.frame(HC)

HC$Seq <- rep(c(1, 2, 3), times = length(1))
HC$Local_Currency <- substr(HC$Currency, 1, 3)
HC$Convertion_Currency <- substr(HC$Currency, 5, 7)

trim <- function (x) gsub("^\\s+|\\s+$", "", x)
HC$YYYY <- trim(HC$YYYY)
HC$Year <- str_sub(HC$YYYY, - 4, - 1)
HC$Year <- as.integer(HC$Year)

df <- HC[HC$Seq == '3',]
df$Month <- rep(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), times = length(1))
df <- as.data.frame(df)
# df$Curr_Code <- as.character(df$Curr_Code)
df$Curr_Code <- case_when(substr(df$Convertion_Currency, 1, 3)=='COP' ~ '04',
                          substr(df$Convertion_Currency, 1, 3)=='TTD' ~ '68',
                          substr(df$Convertion_Currency, 1, 3)=='GTQ' ~ '10',
                          substr(df$Convertion_Currency, 1, 3)=='USD' ~ '01',
                          substr(df$Convertion_Currency, 1, 3)=='CRC' ~ '16',
                          substr(df$Convertion_Currency, 1, 3)=='MXN' ~ '30',
                          substr(df$Convertion_Currency, 1, 3)=='HNL' ~ '02',
                          substr(df$Convertion_Currency, 1, 3)=='KYD' ~ '33',
                          substr(df$Convertion_Currency, 1, 3)=='AWG' ~ '34',
                          substr(df$Convertion_Currency, 1, 3)=='XCD' ~ '61',
                          substr(df$Convertion_Currency, 1, 3)=='JMD' ~ '71',
                          substr(df$Convertion_Currency, 1, 3)=='BZD' ~ '70',
                          substr(df$Convertion_Currency, 1, 3)=='ANG' ~ '86',
                          substr(df$Convertion_Currency, 1, 3)=='BBD' ~ '37',
                          TRUE ~ '00')
df <- df %>% select('Local_Currency','Convertion_Currency','Rate','Year','Month','Curr_Code')

gc()

#  BD Año en curso desde USD to Local Currency & Local to USD Currency
CYC <-                  c( "https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2024.html",
                           
                           "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2024.html"
                           
)

# Función creada para cargar datos NULL al momento de hacer Webscrapping
html_text_na <- function(x, ...) {
  
  txt <- try(html_text(x, ...))
  if (inherits(txt, "try-error") |
      (length(txt)==0)) { return(NA) }
  return(txt)
  
}

# Programación de combinación de nodos para obtener los periodos de año en curso
pager <- function(page) {
  doc <- read_html(url(page))
  data.frame(
    Period=doc %>% html_nodes("#hd-maintable > h3") %>% html_text_na() %>% head(-1)
  ) 
}

options(stringsAsFactors=F)

# Programación de LOOP y asignación de variable con los meses
CYC <- do.call(rbind, lapply(CYC, pager))
#CYC$Seq <- seq(1, 4, by = pi)
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
CYC$Mes <- trim(CYC$Period)
CYC$Year <- str_sub(CYC$Period, - 4, - 1)

CYC <- as.data.frame(CYC)

# Año Actual Rates
CYM <-                  c( "https://www.exchangerates.org.uk/USD-KYD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-COP-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-XCD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-CRC-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-MXN-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-TTD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-HNL-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-GTQ-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-AWG-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-JMD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-ANG-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-BBD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/USD-BZD-spot-exchange-rates-history-2024.html",
                           
                           "https://www.exchangerates.org.uk/KYD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/COP-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/XCD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/CRC-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/MXN-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/TTD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/HNL-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/GTQ-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/AWG-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/JMD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/ANG-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/BBD-USD-spot-exchange-rates-history-2024.html",
                           "https://www.exchangerates.org.uk/BZD-USD-spot-exchange-rates-history-2024.html" 
                           
)

# Función creada para cargar datos NULL al momento de hacer Webscrapping
html_text_na <- function(x, ...) {
  
  txt <- try(html_text(x, ...))
  if (inherits(txt, "try-error") |
      (length(txt)==0)) { return(NA) }
  return(txt)
  
}

# Programación de combinación de nodos incluyendo Año, Rates y tipo de Moneda año en cursp
pager <- function(page) {
  doc <- read_html(url(page))
  data.frame(
    YYYY =doc %>% html_nodes("#content > div > h1") %>% html_text_na,
    Rate =doc %>% html_nodes("b em") %>% html_text_na,
    Currency =doc %>% html_nodes("#content > div > div:nth-child(4) > div.large-7.medium-7.small-12.columns.nolpad > h2") %>% html_text_na
  ) 
}

options(stringsAsFactors=F)

# Programación de LOOP y asignación de variable con los datos
CYM <- do.call(rbind, lapply(CYM, pager))
CYM$Seq <- rep(c(1, 2, 3), times = length(1))
CYM <- CYM[CYM$Seq == '3',]
CYM <- as.data.frame(CYM)

# Unificación de datos año en curso tanto meses en curso, como YYYY, Rates y tipo de moneda
df2 <- cbind(CYM,CYC)

#Transformación de la información
df2$Local_Currency <- substr(CYM$Currency, 1, 3)
df2$Convertion_Currency <- substr(CYM$Currency, 5, 7)
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
df2$YYYY <- trim(df2$YYYY)
df2 <- df2[df2$Seq == '3',]
df2$Month <- case_when(substr(df2$Mes, 1, 3)=='Jan' ~ 1,
                       substr(df2$Mes, 1, 3)=='Feb' ~ 2,
                       substr(df2$Mes, 1, 3)=='Mar' ~ 3,
                       substr(df2$Mes, 1, 3)=='Apr' ~ 4,
                       substr(df2$Mes, 1, 3)=='May' ~ 5,
                       substr(df2$Mes, 1, 3)=='Jun' ~ 6,
                       substr(df2$Mes, 1, 3)=='Jul' ~ 7,
                       substr(df2$Mes, 1, 3)=='Aug' ~ 8,
                       substr(df2$Mes, 1, 3)=='Sep' ~ 9,
                       substr(df2$Mes, 1, 3)=='Oct' ~ 10,
                       substr(df2$Mes, 1, 3)=='Nov' ~ 11,
                       substr(df2$Mes, 1, 3)=='Dec' ~ 12,
                       TRUE ~ 0)

df2$Curr_Code <- case_when(substr(df2$Convertion_Currency, 1, 3)=='COP' ~ '04',
                           substr(df2$Convertion_Currency, 1, 3)=='TTD' ~ '68',
                           substr(df2$Convertion_Currency, 1, 3)=='GTQ' ~ '10',
                           substr(df2$Convertion_Currency, 1, 3)=='USD' ~ '01',
                           substr(df2$Convertion_Currency, 1, 3)=='CRC' ~ '16',
                           substr(df2$Convertion_Currency, 1, 3)=='MXN' ~ '30',
                           substr(df2$Convertion_Currency, 1, 3)=='HNL' ~ '02',
                           substr(df2$Convertion_Currency, 1, 3)=='KYD' ~ '33',
                           substr(df2$Convertion_Currency, 1, 3)=='AWG' ~ '34',
                           substr(df2$Convertion_Currency, 1, 3)=='XCD' ~ '61',
                           substr(df2$Convertion_Currency, 1, 3)=='JMD' ~ '71',
                           substr(df2$Convertion_Currency, 1, 3)=='BZD' ~ '70',
                           substr(df2$Convertion_Currency, 1, 3)=='ANG' ~ '86',
                           substr(df2$Convertion_Currency, 1, 3)=='BBD' ~ '37',
                           TRUE ~ '00')
df2$Curr_Code <- as.character(df2$Curr_Code)


df2 <- as.data.frame(df2)
df2 <- df2 %>% select('Local_Currency','Convertion_Currency','Rate','Year','Month','Curr_Code')

#Garbage collector
gc()

# Inclusión de BD historica plus año en curso en un dataframe llamado Currency
Currency <- rbind(df,df2)
Currency <- sqldf("SELECT 
                  A.Convertion_Currency AS Currency,
                  A.Curr_Code AS Currency_No,
                  CASE
                  WHEN A.Convertion_Currency = 'ANG' THEN 'NL Antillian Guilder'
                  WHEN A.Convertion_Currency = 'AWG' THEN 'Aruban Florin'
                  WHEN A.Convertion_Currency = 'BBD' THEN 'Barbados Dollar'
                  WHEN A.Convertion_Currency = 'BZD' THEN 'Belize Dollar'
                  WHEN A.Convertion_Currency = 'COP' THEN 'Colombian Peso'
                  WHEN A.Convertion_Currency = 'CRC' THEN 'Costa Rican Colon'
                  WHEN A.Convertion_Currency = 'GTQ' THEN 'Guatemalan Quetzal'
                  WHEN A.Convertion_Currency = 'HNL' THEN 'Honduran Lempira'
                  WHEN A.Convertion_Currency = 'JMD' THEN 'Jamaican Dollar'
                  WHEN A.Convertion_Currency = 'KYD' THEN 'Cayman Islands Dollar'
                  WHEN A.Convertion_Currency = 'MXN' THEN 'Mexican Pesos'
                  WHEN A.Convertion_Currency = 'TTD' THEN 'Trinidad and Tobago Dollar'
                  WHEN A.Convertion_Currency = 'XCD' THEN 'Eastern Caribbean Dollar'
                  ELSE 'TBD' END AS Currency_Desc,
                  A.Rate AS USD_to_Local,
                  B.Rate AS Local_to_USD,
                  A.Year,
                  A.Month
                  FROM Currency A
                  LEFT JOIN
                  (SELECT 
                  T.*
                  FROM Currency T
                  WHERE
                  T.Convertion_Currency = 'USD') B
                  ON
                  A.Convertion_Currency = B.Local_Currency
                  AND A.Year = B.Year
                  AND A.Month = B.Month
                  WHERE
                  A.Local_Currency = 'USD'
                  ORDER BY 
                  A.Convertion_Currency, 
                  A.Year, 
                  A.Month
                  ")

#Creación de File dentro de Github Actions para descargar la información como Artifact
write.csv2(Currency, "Output/Currency.csv",row.names=FALSE)
