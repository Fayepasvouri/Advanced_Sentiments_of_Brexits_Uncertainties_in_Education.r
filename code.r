> View(data_geo_dissertation)
> df <- data_geo_dissertation[sample(nrow(data_geo_dissertation)),]
> review <- data_geo_dissertation$Q17
> word.df <- as.vector(review)
> sent.value <- get_sentiment(word.df)
> head(sent.value)
[1] 0.0 0.0 0.0 0.0 0.6 0.0
> category_sentii <- ifelse(sent.value > 0, "1", ifelse(sent.value < 0, "0", "0"))
> head(category_sentii)
[1] "0" "0" "0" "0" "1" "0"
> dataframe_final <- data.frame(data_geo_dissertation$`Participant ID`,data_geo_dissertation$Q17, category_sentii)
> df1 <- dataframe_final[complete.cases(dataframe_final),]
> str(df1)
'data.frame':	101 obs. of  3 variables:
 $ data_geo_dissertation..Participant.ID.: chr  "4069210" "4163826" "4163862" "4163920" ...
 $ data_geo_dissertation.Q17             : chr  "Netherlands" "Netherlands, Cyprus" "Netherlands or Germany" "Netherlands: cheaper, friendlier, high quality education and quality of life" ...
 $ category_sentii                       : chr  "0" "0" "0" "0" ...
> View(df1)
> library(ggplot2)
> ggplot(df1, aes(x = data_geo_dissertation$Q17)) + geom_bar(fill = "light blue")
Error: Aesthetics must be either length 1 or the same as the data (101): x
Run `rlang::last_error()` to see where the error occurred.
> library(ggplot2)
> ggplot(df1, aes(x = data_geo_dissertation.Q17)) + geom_bar(fill = "light blue")
> library(ggplot2)
> ggplot(df1, aes(x = df1$category_sentii)) + geom_bar(fill = "light blue")
Warning message:
Use of `df1$category_sentii` is discouraged. Use `category_sentii` instead. 
> library(ggplot2)
> ggplot(df1, aes(x = category_sentii)) + geom_bar(fill = "light blue")
> prop.table(table(df1$category_sentii))

        0         1 
0.5643564 0.4356436 

 ggplot(df1, aes(x=category_sentii, fill = data_geo_dissertation)) + 
+     theme_bw() +
+     geom_bar() +
+     labs(y = "Participants",
+          title = "Brexit written responses")

> library(caTools)
> set.seed(123)
> split = sample.split(df1$category_sentii, SplitRatio = 0.8)
> training_set = subset(df1, split == TRUE)
> test_set = subset(df1, split == FALSE)
> str(training_set)
'data.frame':	81 obs. of  3 variables:
 $ data_geo_dissertation..Participant.ID.: chr  "4069210" "4163826" "4163862" "4164010" ...
 $ data_geo_dissertation.Q17             : chr  "Netherlands" "Netherlands, Cyprus" "Netherlands or Germany" "Thanks" ...
 $ category_sentii                       : chr  "0" "0" "0" "1" ...
> View(training_set)

> library(ggplot2) # Data visualization
> library(readr) # CSV file I/O, e.g. the read_csv function
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> library(tidytext)
Error in library(tidytext) : there is no package called ‘tidytext’
> library(tm)
> library("SnowballC")
> library("wordcloud")
> library("RColorBrewer")
> library("qdap")
Error in library("qdap") : there is no package called ‘qdap’
> install.packages("tidytext")

package ‘gtools’ successfully unpacked and MD5 sums checked
package ‘openNLPdata’ successfully unpacked and MD5 sums checked
package ‘rJava’ successfully unpacked and MD5 sums checked
package ‘xlsxjars’ successfully unpacked and MD5 sums checked
package ‘qdapDictionaries’ successfully unpacked and MD5 sums checked
package ‘qdapRegex’ successfully unpacked and MD5 sums checked
package ‘qdapTools’ successfully unpacked and MD5 sums checked
package ‘chron’ successfully unpacked and MD5 sums checked
package ‘gdata’ successfully unpacked and MD5 sums checked
package ‘gender’ successfully unpacked and MD5 sums checked
package ‘gridExtra’ successfully unpacked and MD5 sums checked
package ‘igraph’ successfully unpacked and MD5 sums checked
package ‘openNLP’ successfully unpacked and MD5 sums checked
package ‘RCurl’ successfully unpacked and MD5 sums checked
package ‘reshape2’ successfully unpacked and MD5 sums checked
package ‘stringdist’ successfully unpacked and MD5 sums checked
package ‘venneuler’ successfully unpacked and MD5 sums checked
package ‘xlsx’ successfully unpacked and MD5 sums checked
package ‘XML’ successfully unpacked and MD5 sums checked
package ‘qdap’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\Faye\AppData\Local\Temp\RtmpWc6DEr\downloaded_packages
> dim(data_geo_dissertation)
[1] 203  19
> str(data_geo_dissertation)
tibble [203 x 19] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ Participant ID: chr [1:203] "4069210" "4163826" "4163862" "4163920" ...
 $ Q1            : chr [1:203] "Dutch" "Greek" "Greek" "Greek" ...
 $ Q2            : chr [1:203] "male" "male" "female" "female" ...
 $ Q3            : chr [1:203] "26-34" "26-34" "26-34" "18-25" ...
 $ Q4            : num [1:203] 15000 22000 37000 300 100000 100000 35000 240000 70000 50000 ...
 $ Q5            : chr [1:203] "Single" "Single" "None of the above" "Single" ...
 $ Q6            : chr [1:203] "No" "No" "No" "No" ...
 $ Q7            : chr [1:203] "Yes" "Yes" "No" "Yes" ...
 $ Q8            : chr [1:203] "No" "No" "Yes" "Yes" ...
 $ Q9            : chr [1:203] "No" "No" "Do not know yet" "Yes" ...
 $ Q10           : chr [1:203] "No" "Yes" "Yes" "Yes" ...
 $ Q11           : chr [1:203] "No" "Do not know yet" "No" "No" ...
 $ Q12           : chr [1:203] "Non-recognition of the degree" "Non-recognition of the degree" "No work permit" "No work permit" ...
 $ Q13           : chr [1:203] "Yes" "Yes" "Yes" "Yes" ...
 $ Q14           : chr [1:203] "No" "Yes" "Yes" "No" ...
 $ Q15           : chr [1:203] "Yes" "Yes" "Do not know yet" "Do not know yet" ...
 $ Q16           : chr [1:203] "No" "Yes" "No" "No" ...
 $ Q17           : chr [1:203] "Netherlands" "Netherlands, Cyprus" "Netherlands or Germany" "Netherlands: cheaper, friendlier, high quality education and quality of life" ...
 $ X19           : chr [1:203] NA NA NA NA ...
 - attr(*, "problems")= tibble [102 x 5] (S3: tbl_df/tbl/data.frame)
  ..$ row     : int [1:102] 102 103 104 105 106 107 108 109 110 111 ...
  ..$ col     : chr [1:102] NA NA NA NA ...
  ..$ expected: chr [1:102] "19 columns" "19 columns" "19 columns" "19 columns" ...
  ..$ actual  : chr [1:102] "2 columns" "2 columns" "2 columns" "2 columns" ...
  ..$ file    : chr [1:102] "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" ...
 - attr(*, "spec")=
  .. cols(
  ..   `Participant ID` = col_character(),
  ..   Q1 = col_character(),
  ..   Q2 = col_character(),
  ..   Q3 = col_character(),
  ..   Q4 = col_number(),
  ..   Q5 = col_character(),
  ..   Q6 = col_character(),
  ..   Q7 = col_character(),
  ..   Q8 = col_character(),
  ..   Q9 = col_character(),
  ..   Q10 = col_character(),
  ..   Q11 = col_character(),
  ..   Q12 = col_character(),
  ..   Q13 = col_character(),
  ..   Q14 = col_character(),
  ..   Q15 = col_character(),
  ..   Q16 = col_character(),
  ..   Q17 = col_character(),
  ..   X19 = col_character()
  .. )
> data_geo_dissertation$Q17<-as.character(data_geo_dissertation$Q17)
> str(data_geo_dissertation)
tibble [203 x 19] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ Participant ID: chr [1:203] "4069210" "4163826" "4163862" "4163920" ...
 $ Q1            : chr [1:203] "Dutch" "Greek" "Greek" "Greek" ...
 $ Q2            : chr [1:203] "male" "male" "female" "female" ...
 $ Q3            : chr [1:203] "26-34" "26-34" "26-34" "18-25" ...
 $ Q4            : num [1:203] 15000 22000 37000 300 100000 100000 35000 240000 70000 50000 ...
 $ Q5            : chr [1:203] "Single" "Single" "None of the above" "Single" ...
 $ Q6            : chr [1:203] "No" "No" "No" "No" ...
 $ Q7            : chr [1:203] "Yes" "Yes" "No" "Yes" ...
 $ Q8            : chr [1:203] "No" "No" "Yes" "Yes" ...
 $ Q9            : chr [1:203] "No" "No" "Do not know yet" "Yes" ...
 $ Q10           : chr [1:203] "No" "Yes" "Yes" "Yes" ...
 $ Q11           : chr [1:203] "No" "Do not know yet" "No" "No" ...
 $ Q12           : chr [1:203] "Non-recognition of the degree" "Non-recognition of the degree" "No work permit" "No work permit" ...
 $ Q13           : chr [1:203] "Yes" "Yes" "Yes" "Yes" ...
 $ Q14           : chr [1:203] "No" "Yes" "Yes" "No" ...
 $ Q15           : chr [1:203] "Yes" "Yes" "Do not know yet" "Do not know yet" ...
 $ Q16           : chr [1:203] "No" "Yes" "No" "No" ...
 $ Q17           : chr [1:203] "Netherlands" "Netherlands, Cyprus" "Netherlands or Germany" "Netherlands: cheaper, friendlier, high quality education and quality of life" ...
 $ X19           : chr [1:203] NA NA NA NA ...
 - attr(*, "problems")= tibble [102 x 5] (S3: tbl_df/tbl/data.frame)
  ..$ row     : int [1:102] 102 103 104 105 106 107 108 109 110 111 ...
  ..$ col     : chr [1:102] NA NA NA NA ...
  ..$ expected: chr [1:102] "19 columns" "19 columns" "19 columns" "19 columns" ...
  ..$ actual  : chr [1:102] "2 columns" "2 columns" "2 columns" "2 columns" ...
  ..$ file    : chr [1:102] "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" "'C:/Users/Faye/Desktop/Master/data_geo_dissertation.csv'" ...
 - attr(*, "spec")=
  .. cols(
  ..   `Participant ID` = col_character(),
  ..   Q1 = col_character(),
  ..   Q2 = col_character(),
  ..   Q3 = col_character(),
  ..   Q4 = col_number(),
  ..   Q5 = col_character(),
  ..   Q6 = col_character(),
  ..   Q7 = col_character(),
  ..   Q8 = col_character(),
  ..   Q9 = col_character(),
  ..   Q10 = col_character(),
  ..   Q11 = col_character(),
  ..   Q12 = col_character(),
  ..   Q13 = col_character(),
  ..   Q14 = col_character(),
  ..   Q15 = col_character(),
  ..   Q16 = col_character(),
  ..   Q17 = col_character(),
  ..   X19 = col_character()
  .. )
> abc_words<-data_geo_dissertation%>%
+     unnest_tokens(word, data_geo_dissertation)
Error in unnest_tokens(., word, data_geo_dissertation) : 
  could not find function "unnest_tokens"
> library(ggplot2) # Data visualization
> library(readr) # CSV file I/O, e.g. the read_csv function
> library(dplyr)
> library(tidytext)
> library(tm)
> library("SnowballC")
> library("wordcloud")
> library("RColorBrewer")
> library("qdap")
Loading required package: qdapDictionaries
Loading required package: qdapRegex

> abc_words<-data_geo_dissertation%>%
+    unnest_tokens(word, data_geo_dissertation)
Error in check_input(x) : 
  Input must be a character vector of any length or a list of character
  vectors, each of which has a length of 1.
> abc_words<-data_geo_dissertation%>%
+     +     unnest_tokens(word, data_geo_dissertation$Q17)
Error in unnest_tokens(word, data_geo_dissertation$Q17) : 
  object 'word' not found
> head(stop_words)
# A tibble: 6 x 2
  word      lexicon
  <chr>     <chr>  
1 a         SMART  
2 as       SMART  
3 able      SMART  
4 about     SMART  
5 above     SMART  
6 according SMART  

> abc_words<-data_geo_dissertation%>%
     unnest_tokens(word,data_geo_dissertation$Q17)
Error in check_input(x) : 
  Input must be a character vector of any length or a list of character
  vectors, each of which has a length of 1.
> abc_words<-df1%>%
 unnest_tokens(word,category_sentii)
> View(abc_words)
> abc_sentiment<-abc_words%>%
+     anti_join(stop_words,by="word")
> 
> 
> View(abc_words)
> View(abc_sentiment)
> abc_sentiment%>%count(word,sort=T)%>%top_n(20)
Selecting by n
  word  n
1    0 57
2    1 44
> 
> 
> abc<-abc_sentiment%>%
    unnest_tokens(word,abc_sentiment$data_geo_dissertation.Q17)
Error in check_input(x) : 
  Input must be a character vector of any length or a list of character
  vectors, each of which has a length of 1.
> 
> 
> library(tibble)
> library(dplyr,warn.conflicts = FALSE)
> library(tidytext)
> 
> text <- data.frame(text= data_geo_dissertation$Q17, stringsAsFactors = FALSE)
> text_df <- tibble(line = 1:2, text = text)

> 
> 
> abc_words<-df1%>%
+     unnest_tokens(word,data_geo_dissertation.Q17)
> 
> 
> View(abc_words)
> 
> 
> abc_sentiment<-abc_words%>%
+     anti_join(stop_words,by="word")
> 
> 
> View(abc_sentiment)
> abc_sentiment%>%count(word,sort=T)%>%top_n(20)
Selecting by n
            word  n
1    netherlands 32
2        germany 16
3           fees 10
4          study 10
5         system 10
6      education  9
7        country  8
8        denmark  8
9         france  8
10         spain  7
11        sweden  7
12       belgium  6
13     countries  6
14       quality  6
15   educational  5
16       finland  5
17           low  5
18 opportunities  5
19    affordable  4
20         italy  4
21       tuition  4
22            uk  4
23  universities  4
> 
> 
> ggplot(abc_sentiment%>%count(word,sort=T)%>%top_n(20),aes(reorder(word,n),n))+
+     geom_bar(stat = "identity")+
+     geom_text(aes(label = n),color="#0f190f", hjust = -0.05, size = 2)+
+     theme_bw()+
+     coord_flip()+
+     xlab("Number of Occurences")+
+     ylab("Words used")+
+     ggtitle("Number of Occurences of each word")+
+     theme(axis.text.x = element_blank(),
+           axis.ticks.x = element_blank())
Selecting by n
> 
> 
> abc_bing<-abc_sentiment_stopwords%>%
+     inner_join(get_sentiments("bing"),by="word")%>%
+     ungroup()
Error in eval(lhs, parent, parent) : 
  object 'abc_sentiment_stopwords' not found
> stopwords<-data.frame(word=c(stop_words$word,"netherlands"))
> View(stopwords)
> stopwords$word<-as.character(stopwords$word)
> abc_sentiment_stopwords<-abc_words%>%
+     anti_join(stopwords,by="word")
> View(abc_sentiment_stopwords)
> abc_bing<-abc_sentiment_stopwords%>%
+     inner_join(get_sentiments("bing"),by="word")%>%
+     ungroup()
> View(abc_bing)
> abc_bing%>%
+     count(word,sentiment)%>%
+     group_by(sentiment)%>%
+     top_n(10,n)%>%
+     ungroup()%>%
+     ggplot(aes(x=reorder(word,n),y=n,fill=sentiment))+
+     geom_col(show.legend = FALSE)+
+     coord_flip()+
+     facet_wrap(~sentiment,scales="free")+
+     labs(x="number of occurences",y="Words",title="Top 10 positive and negative sentiment words used by respondents regarding Brexit's uncertainties and future University selection")+
+     theme(plot.title = element_text(size = 8, face = "bold"))
> abc_nrc<-abc_sentiment_stopwords%>%
+     inner_join(get_sentiments("nrc"),by="word")%>%
+     ungroup()

> library(textdata)
> abc_nrc<-abc_sentiment_stopwords%>%
+     inner_join(get_sentiments("nrc"),by="word")%>%
+     ungroup()
> 
> 
> table(abc_nrc$sentiment)

anticipation          joy     negative     positive      sadness        trust 
           4            6            7           42            2           26 
> 
> 
> abc_nrc%>%
+     filter(sentiment %in% c("joy","anger","positive","negative","sadness"))%>%
+     group_by(sentiment)%>%
+     count(word,sentiment)%>%
+     top_n(10,n)%>%
+     ungroup()%>%
+  
+     
+     ggplot(aes(x=reorder(word,n),y=n,fill=sentiment))+
+     geom_col(show.legend=F)+
+     coord_flip()+
+     facet_wrap(~sentiment,scales="free")+
+     labs(x="number of occurences",y="Words",title="Top 10 words for each emotion used from the respondents regarding Brexit")+
+     theme(plot.title = element_text(size = 8, face = "bold"))
> abc_afinn%>%
+     group_by(sentiment)%>%
+     count(word,sentiment)%>%
+     top_n(10,n)%>%
+     ungroup()%>%
+     ggplot(aes(x=reorder(word,n),y=n,fill=sentiment))+
+     geom_col(show.legend=F)+
+     facet_wrap(~sentiment,scales="free")+
+     coord_flip()+
+     labs(x="number of occurences",y="Words",title="Top 10 words for each sentiment used by respondents in Brexit")+
+     theme(plot.title = element_text(size = 8, face = "bold"))

> library(wordcloud)
> 
> abc_sentiment_stopwords %>%
+     anti_join(stop_words) %>%
+     count(word) %>%
+     with(wordcloud(word, n, max.words = 100))
Joining, by = "word"

> hmtTable <- abc_sentiment %>% 
+     unnest_tokens(word, word)
> View(hmtTable)
> data(stop_words)
> hmtTable <- hmtTable %>%
+     anti_join(stop_words)
Joining, by = "word"
> View(contrast)
> View(categorisation)
> hmtTable <- hmtTable %>%
+     count(word, sort = TRUE) 
> hmtTable 
               word  n
1       netherlands 32
2           germany 16
3              fees 10
4             study 10
5            system 10
6         education  9
7           country  8
8           denmark  8
9            france  8
10            spain  7
11           sweden  7
12          belgium  6
13        countries  6
14          quality  6
15      educational  5
16          finland  5
17              low  5
18    opportunities  5
19       affordable  4
20            italy  4
21          tuition  4
22               uk  4
23     universities  4
24           brexit  3
25            cheap  3
26              due  3
27          english  3
28             free  3
29          ireland  3
30            level  3
31           prefer  3
32         programs  3
33      recognition  3
34     scandinavian  3
35         speaking  3
36          studies  3
37          cheaper  2
38       conditions  2
39          culture  2
40           cyprus  2
41       experience  2
42           greece  2
43           income  2
44              job  2
45             life  2
46           living  2
47           norway  2
48           offers  2
49           people  2
50           strong  2
51          support  2
52           abroad  1
53         academic  1
54           affect  1
55       allowances  1
56          amazing  1
57           answer  1
58        barcelona  1
59            based  1
60        beautiful  1
61         bulgaria  1
62         business  1
63           career  1
64         children  1
65           choice  1
66          college  1
67        comparing  1
68             cost  1
69            costs  1
70           covers  1
71           danish  1
72           decide  1
73           degree  1
74          degrees  1
75           denmar  1
76         diplomas  1
77            dutch  1
78              e.g  1
79           easily  1
80    effectiveness  1
81        employers  1
82      engineering  1
83      environment  1
84               eu  1
85         european  1
86        expensive  1
87         feedback  1
88        financial  1
89         finlanda  1
90       friendlier  1
91          friends  1
92            goood  1
93           highly  1
94          holland  1
95             home  1
96      importantly  1
97     institutions  1
98             lack  1
99         language  1
100             lot  1
101            lots  1
102            love  1
103      manageable  1
104          master  1
105         masters  1
106            mind  1
107   multicultural  1
108      netherands  1
109      netherland  1
110            nice  1
111           offer  1
112         offered  1
113          period  1
114       potential  1
115           price  1
116          proper  1
117       proximity  1
118         reasons  1
119      recognised  1
120      reputation  1
121    requirements  1
122        research  1
123       respected  1
124     scholarship  1
125          school  1
126          select  1
127            send  1
128        services  1
129       solutions  1
130           speak  1
131         special  1
132 specialisations  1
133        standard  1
134       standards  1
135            stay  1
136         staying  1
137         studied  1
138        styudies  1
139         subject  1
140       technical  1
141           terms  1
142       threshold  1
143     traditional  1
144            unis  1
145          united  1
146       universal  1
147      university  1
148            visa  1
149         weather  1
150         western  1
151            wise  1
> wordcloud2(hmtTable, size=0.7)
