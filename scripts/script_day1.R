library(tidyverse)

blp_df <- read_csv("data/blp-trials-short.txt")

select(blp_df, participant, lex, resp, rt)

select(blp_df, spell:prev.rt)

select(blp_df, 2:5)

select(blp_df, participant, 4:6)

select(blp_df, starts_with('p'))

select(blp_df, ends_with('t'))

select(blp_df, contains('rt'))

select(blp_df, matches('^rt|rt$'))

select(blp_df, -participant)

select(blp_df, -ends_with('t'))

select(blp_df, -(2:5))

select(blp_df, rt, everything())

select_if(blp_df, is.numeric)

select_if(blp_df, is.character)


has_low_mean <- function(x){
  is.numeric(x) && (mean(x, na.rm = T) < 700)
}

select_if(blp_df, function(x){ is.numeric(x) && (mean(x, na.rm = T) < 700)})

select_if(blp_df, ~is.numeric(.) && (mean(., na.rm = T) < 700))


select(blp_df, participant, reaction_time = rt)

# renaming

rename(blp_df, reaction_time = rt, subject = participant)

rename_all(blp_df, ~str_replace_all(., '\\.' , '_'))

rename_all(blp_df, ~str_replace_all(., 'rt' , 'reactiontime'))

rename_at(blp_df, 
          vars(matches('^rt|rt$')),
          ~str_replace_all(., 'rt' , 'reactiontime'))

rename_at(blp_df, 
          vars(rt, spell, resp),
          ~str_replace_all(., 'rt' , 'reactiontime'))

rename_at(blp_df, 
          vars(rt, spell, resp),
          ~str_replace_all(., 'rt' , 'reactiontime'))

rename_if(blp_df, is.character, str_to_upper)

slice(blp_df, c(2, 17, 37))

blp_df[c(2, 17, 37), ]

slice(blp_df, 10:20)

slice(blp_df, seq(10, 500, by = 50))

slice(blp_df, -seq(10, 500, by = 50))

slice(blp_df, 5:10)

slice(blp_df, -(5:10))

slice(blp_df, -(1:3))

slice(blp_df, (n()-3):n())

slice(blp_df, n())

filter(blp_df, lex == 'W')

filter(blp_df, lex == 'W', resp == 'W')

filter(blp_df, lex == 'W', resp == 'W', rt < 500)

filter(blp_df, lex == 'W' & resp == 'W' & rt < 500)

filter(blp_df, lex == 'W' | resp == 'W')

filter(blp_df, rt %in% 500:600)

filter(blp_df,
       lex == 'W',
       str_length(spell) < 5 & (resp != lex | rt.raw > 900))

filter_all(blp_df, any_vars(is.na(.)))


filter_all(blp_df, all_vars(!is.na(.)))

na.omit(blp_df)

filter_at(blp_df,
          vars(rt:rt.raw),
          all_vars(. > 1000))

filter_at(blp_df,
          vars(rt:rt.raw),
          all_vars(. > median(., na.rm = T)))

filter_if(blp_df, 
          is.numeric,
          all_vars(. > median(., na.rm = T)))

mutate(blp_df, accurate = lex == resp)

mutate(blp_df, 
       accurate = lex == resp,
       string_length = str_length(spell))
       
mutate(blp_df, 
       accurate = lex == resp,
       `string length` = str_length(spell))

mutate_all(blp_df, as.character)

blp_df$participant <- as.factor(blp_df$participant)
blp_df$lex <- as.character(blp_df$lex)

for (v in names_){
  blp_df[[v]] <- as.factor(blp_df[[v]])
}

mutate_all(blp_df, as.factor)

mutate_at(blp_df, vars(rt:rt.raw), ~as.vector(scale(.)))

mutate_if(blp_df, is.numeric, ~as.vector(scale(.)))

mutate(blp_df,
       is_fast = ifelse(rt.raw < 700, 'fast', 'slow')
)

mutate(blp_df,
       lex = recode(lex, 'W' = 'word', 'N' = 'nonword')
)

mutate(blp_df,
       rt_cat = case_when(
         rt.raw < 500 ~ 'fast',
         rt.raw < 300 ~ 'superfast',
         TRUE ~ 'medium'
       )
) 

arrange(blp_df, participant)

arrange(blp_df, participant, rt.raw)

arrange(blp_df, rt.raw, participant)

arrange(blp_df, spell)

arrange(blp_df, desc(rt.raw))


summarize(blp_df,
          avg = mean(rt.raw, na.rm = T),
          median = median(rt.raw, na.rm = T),
          stdev = sd(rt.raw, na.rm = T)
)

options(pillar.sigfig = 5)
summarize(blp_df,
          avg_rt = mean(rt, na.rm = T),
          median_rt_raw = median(rt.raw, na.rm = T),
          stdev_rt = sd(rt, na.rm = T)
)

summarise_all(blp_df, n_distinct)

summarize_at(blp_df,
             vars(rt:rt.raw),
             list(~median(., na.rm = T),
                  ~sd(., na.rm = T),
                  ~mean(., na.rm = T)
             )
             
)

summarize_if(blp_df,
             is.numeric,
             ~mean(., na.rm = T))

summarize_if(blp_df,
             is.numeric,
             list(~median(., na.rm = T),
                  ~sd(., na.rm = T),
                  ~mean(., na.rm = T)
             )
)

# split - apply - combine

print(group_by(blp_df, participant), n = Inf)


summarize(group_by(blp_df, lex),
          avg = mean(rt.raw, na.rm = T),
          median = median(rt.raw, na.rm = T),
          stdev = sd(rt.raw, na.rm = T)
)

summarize(group_by(blp_df, participant, lex),
          avg = mean(rt.raw, na.rm = T),
          median = median(rt.raw, na.rm = T),
          stdev = sd(rt.raw, na.rm = T)
)


x <- runif(100)

s <- sum(x)
ss <- sqrt(s)
lss <- log(ss)

# x, f, 
# f(x)
# x %>% f 


group_by(blp_df, participant, lex) %>% 
  summarize(avg = mean(rt.raw, na.rm = T),
            median = median(rt.raw, na.rm = T),
            stdev = sd(rt.raw, na.rm = T)
  )

# wrangle
blp_df_tidy <- blp_df %>% 
  mutate(accuracy = lex == resp,
         string_length = str_length(spell)
  ) %>% 
  select(string_length, accuracy, starts_with('rt')) %>% 
  select(-rt) 
  

# descriptives
blp_df_tidy %>% 
  group_by(string_length) %>% 
  summarize(avg_rt = mean(rt.raw, na.rm = T),
            avg_accuracy = mean(accuracy, na.rm = T)
  )

# visualize
blp_df_tidy %>% 
  ggplot(....)


blp_df_1 <- mutate(blp_df, accuracy = lex == resp,
                   string_length = str_length(spell)
)



Df_1 <- tibble(x = c(1, 2, 3),
               y = c(2, 7, 1),
               z = c(0, 2, 7))

Df_2 <- tibble(y = c(5, 7),
               z = c(6, 7),
               x = c(1, 2))

Df_3 <- tibble(a = c(5, 6, 1),
               b = c('a', 'b', 'c'),
               c = c(T, T, F))

bind_rows(Df_1, Df_2)

bind_cols(Df_1, Df_3)



# inner join

inner_join(blp_df, stimuli)



Df_a <- tibble(x = c(1, 2, 3), 
               y = c('a', 'b', 'c'))

Df_b <- tibble(x = c(2, 3, 4), 
               z = c('d', 'e', 'f'))


inner_join(Df_a, Df_b)

left_join(Df_a, Df_b)

right_join(Df_a, mutate_all(Df_b, as.character))

full_join(Df_a, Df_b)


Df_4 <- tibble(x = c(1, 2, 3),
               y = c(2, 7, 1),
               z = c(0, 2, 7))

Df_5 <- tibble(a = c(1, 1, 7),
               b = c(2, 3, 7),
               c = c('a', 'b', 'c'))


inner_join(Df_4, Df_5, by = c("x" = "a", "y" = "b"))

inner_join(Df_4, Df_5, by = c("x" = "a"))


