library(readr)
library(tidyverse)

EC_custom_blast <- read_delim("2022/results/summaries/EC_custom_blast.txt", 
                              delim = "\t", escape_double = FALSE, 
                              col_names = FALSE, trim_ws = TRUE)

colnames(EC_custom_blast) <- c("qseqid", "stitle", "sseqid", "pident", "length", "slen", "sstart", "send", "qstart", "qend", "qlen", "mismatch", "gapopen", "evalue", "bitscore", "name")

EC_custom_blast %>% mutate(coverage = as.numeric(scales::percent(length/slen, accuracy = 0.1, suffix = ""))) %>% filter(stitle == "intI1_HQ730118.1") %>% group_by(name) %>% tally(sort = TRUE) 

EC_custom_blast %>% mutate(coverage = as.numeric(scales::percent(length/slen, accuracy = 0.1, suffix = ""))) %>% select(name, stitle, pident, coverage) %>% filter(stitle == "intI1_HQ730118.1")
