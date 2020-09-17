library(tidyverse)

recall_df <- read_csv('data/repeated_measured_a.csv')

recall_df_long <- pivot_longer(recall_df,
                               cols = -Subject,
                               names_to = 'condition',
                               values_to = 'score')

pivot_wider(recall_df_long,
            names_from = 'condition',
            values_from = 'score')

recall_b_df <- read_csv('data/repeated_measured_b.csv')


pivot_longer(recall_b_df,
             cols = -Subject,
             names_to = 'condition',
             values_to = 'score') %>% 
  print(n = Inf)


recall_b_df_long <- pivot_longer(recall_b_df,
                                 cols = -Subject,
                                 names_to = 'condition',
                                 values_to = 'score') 

separate(recall_b_df_long, col = condition, into = c("cue", "emotion"), sep = '_')

pivot_longer(recall_b_df,
             cols = -Subject,
             names_to = 'condition',
             values_to = 'score') %>%
  separate(col = condition,
           into = c("cue", "emotion"),
           sep = '_')

pivot_longer(recall_b_df,
             cols = -Subject,
             names_to = c("cue", 'emotion'),
             names_pattern = "(.*)_(.*)",
             values_to = 'score')

pivot_longer(recall_b_df,
             cols = -Subject,
             names_to = c("cue", 'emotion'),
             names_sep = '_',
             values_to = 'score')

pivot_longer(recall_b_df,
             cols = -Subject,
             names_to = c("cue", 'emotion'),
             names_sep = '[_\\-,\\;]',
             values_to = 'score')

pivot_longer(recall_b_df,
             cols = -Subject,
             names_to = c("cue", 'emotion'),
             names_pattern = "(Free|Cued)_(Neg|Neu|Pos)",
             values_to = 'score')

