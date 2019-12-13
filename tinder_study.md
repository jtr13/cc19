
# Tinder self-reflection

Benjamin Livingston



![](resources/tinder_study/tinder.png)


## Introduction

When I told my friends I was doing this, they laughed.

After I showed this to my friends, they laughed again.

I laughed, too.

Our Tinder data is a disturbingly accurate window into our romantic selves. It traces so many of our dating tendencies, from pickiness, to obsession, to desperation, to pushiness. I gained tremendous insight into my romantic habits from this exercise, and I hope you will enjoy it as much as I did.

*Most importantly*, I've constructed this in a way that will allow you to easily do this analysis for yourself, too.

### For The Taken / Non-Millennial Folk

You're probably going to look at every statistic and graph here and wonder, "what the heck is all this?"

[Tinder](https://tinder.com) is a dating app that launched in 2012, available from any web browser or smartphone. You create a profile, select your preferred gender, age, and locational proximity for a potential partner, and Tinder provides you a sequence of other users that fit your criteria.

Every time a user's profile pops up, you can either "swipe left" and pass on them, or "swipe right" and like them. If (and only if) you and the other user both swipe right on each other, you are deemed a "match", and you gain ability to talk to one another. 

![*(via Innovation Is Everywhere)*](resources/tinder_study/tinder_example.jpg)

User habits vary: some users swipe right on everyone they see, while some users are very picky. There is very little explicit feedback from the app, so the user is forced to form their own conclusions from their personal data, which Tinder allows you to download.

### Replicating This Analysis For Yourself

**I've made it possible for you to create all these statistics and graphs for yourself at the click of a button.**

Your Tinder data can be downloaded [**at this link**](https://www.help.tinder.com/hc/en-us/articles/115005626726-How-do-I-request-a-copy-of-my-personal-data-).

[**In this GitHub repository**](https://github.com/bwliv/Tinder), you will find a file called [**grabyourtinder.R**](https://github.com/bwliv/Tinder/blob/master/grabyourtinder.R). 

If you download your Tinder data as instructed, you will receive a zipped file. In that file, there is a JSON labeled "data.JSON". This is your Tinder data - namely, all your messages and daily statistics.

The code I wrote for this project allows any user to extract all of their daily usage statistics from this JSON without the need for additional software.

If you extract and copy data.JSON to your R working directory and run the code in grabyourtinder.R, you will be able to create all these graphs and statistics for yourself, and generate a .csv of your Tinder data.

**Try this!!!!** I did all the legwork for you. I'd love to hear what you come up with. If you don't like what you see, you can throw your laptop out the window and the evidence will disappear forever.

*A note for non-R users*: If you haven't learned R, this is the perfect time to. It's free, extremely easy to use, fun to play with, and very powerful. 

Two recommended free resources if you'd like to try it out:

* Hadley Wickham's [*R For Data Science*](https://r4ds.had.co.nz/)
* Roger D. Peng's [*R Programming For Data Science*](https://leanpub.com/rprogramming)

### Protecting The Innocent (and Not-So-Innocent)

Since my Tinder data JSON file also contains my message data, it will unfortunately not be made available with this project. As you will see soon, there are a *lot* of messages in there, and thus a plethora of personally identifiable information (for myself and others) that can't be posted on the internet. Hope you understand.

In lieu of this, I have included a .csv file with my daily usage statistics in the [GitHub repository](https://github.com/bwliv/Tinder), which was extracted from the JSON using my script.

### A Fun Twist

I will be plotting my Tinder usage over time, and I'm going to add an extra feature to spice it up.

This data covers 2014-2015 until the present (we will explain why the start of this range is indefinite later). In Fall 2016, I moved from Pittsburgh to Philadelphia, and then in Summer 2019, I moved from Philadelphia to New York. 

We will mark those moves in our graphs, and see if we discover any geographic trends as we conduct our analysis.

## Analysis

### Our Fun New Tinder Statistics: "*Amourmetrics*"

* **Opens** - the number of times I opened the Tinder app
* **Messages** - messages exchanged on the app (split by sent vs. received where stated, combined otherwise)
* **Likes** - the number of times I swiped right (a.k.a. "liked" a user)
* **Passes** - the number of times I swiped left (a.k.a. "passed" on a user)
* **Swipes** - the total number of times I swiped, equal to likes + passes

### All-Time Statistics & A Demographical Discovery 

Let's start by examining my messaging habits.


```r
print(paste0('Total messages sent: ',sum(bentinder$messages_sent)))
```

```
## [1] "Total messages sent: 23047"
```

```r
print(paste0('Total messages received: ',sum(bentinder$messages_received)))
```

```
## [1] "Total messages received: 19156"
```

```r
print(paste0('Total messages: ',sum(bentinder$messages_sent)+sum(bentinder$messages_received)))
```

```
## [1] "Total messages: 42203"
```

I'm a talkative person, so this isn't particularly surprising. What's most interesting about this talk-versus-listen trend is how it has varied over time, which we'll get to in a bit.

Of course, your reaction may be a more primal "FORTY TWO THOUSAND MESSAGES?!?!". If that's the case, wait until you see my all-time totals across all Tinder statistics.


```r
messages = bentinder %>% select(date,messages_sent,messages_received) %>% mutate(message_differential = messages_received - messages_sent)

bentinder = bentinder %>% mutate(messages = messages_sent + messages_received) %>% select(-c(messages_sent,messages_received))

bentinder = bentinder %>% mutate(swipes=likes+passes)
sapply(bentinder[-1],sum)
```

```
##    opens    likes   passes  matches messages   swipes 
##    25081    75404   214505     8777    42203   289909
```

**289,909 swipes!** 289,909! This is all mind-blowing... but *289,909*??

This could make you laugh, cry, drop your jaw, or just rub your temples and shake your head. But there's a deeper meaning to this number that I'd like to explore - because considering that I only date men, it's completely incomprehensible.

Think about this for a moment. According to a [2006 study](https://escholarship.org/uc/item/8h08t0zf) by UCLA's Gary J. Gates (the most recent readily-available, exhaustive empirical estimate of metropolitan area LGBT populations), the 2005 LGBT populations of the metropolitan areas I've lived in were approximately as follows:

* Pittsburgh: 50,994
* Philadelphia: 179,459
* New York: 568,903

Furthermore, **the LGBT population of Pennsylvania as a whole was 323,454**.

While these numbers have likely grown in the last decade-and-a-half, they [don't seem](https://en.wikipedia.org/wiki/LGBT_demographics_of_the_United_States#By_city) to have skyrocketed significantly based on more recent city LGBT population estimates, nor does it make intuitive sense that the number of gay men would have grown astronomically in the last 15 years. 

Surely, more people are *openly* LGBT in 2019 than in 2005, but we are making an important distinction between LGBT and *openly* LGBT (or *identifying as* LGBT) here. In other words, telling a survey-taker that you are LGBT and being LGBT (and seeking same-sex partners on Tinder) can be two *very* different things.

A quick calculation finds that **273,682 of these swipes happened before I moved to New York. The combined LGBT adult populations of the Pittsburgh and Philadelphia areas is estimated at 230,453, and the entire state only has an estimated 323,454 LGBT adults.**

If we make a loose assumption that about half of the LGBT residents are male, that would leave about **115,000 gay men in the Philadelphia and Pittsburgh areas and about 162,000 gay men in Pennsylvania** at large.

**I swiped 273,000 times while I lived in Pennsylvania.** That means I swiped more than *twice* the number of available people in my cities and *over 1.5 times* the number of gay men in my state. 

Considering I typically set Tinder to only show me people close to my age (almost exclusively within five years), this doesn't make any sense. 

**This makes me wonder if these LGBT population estimates are even close to accurate.** I swiped a *lot* while out of town (or while using Tinder's [Passport](https://www.help.tinder.com/hc/en-us/articles/115004490423-Passport) feature) and with visitors from other places, and while I can't definitively state *exactly* how much of my swiping was done with people from other metropolitan areas, it probably isn't enough to explain this trend. Even if only 50,000 of my swipes were done with people residing in my metropolitan area (which would be less than 20% of my overall swipes), these numbers still don't add up.

Tinder [typically doesn't suggest the same person twice](https://www.help.tinder.com/hc/en-us/articles/115003496683-I-m-seeing-profiles-I-ve-already-swiped-on-), so we can probably rule that out as a major factor. 

It seems very likely I saw at least 200,000 unique people, and we will make a low-end estimate that 50,000 of them lived in the Philadelphia and Pittsburgh areas. **It seems extremely unlikely that that 50,000 of the estimated 115,000 LGBT adult males in those areas are Tinder users close to my age.**

These numbers suggest there are (and have probably long been) **many** more gay men in these cities than the aforementioned research stated in 2006, and [other self identification-based research has stated](https://news.gallup.com/poll/234863/estimate-lgbt-population-rises.aspx) since. The linked Gallup article states that "Estimate of LGBT Population Rises to 4.5%". My data casts serious doubt on the validity of these estimates.

In no way am I claiming definitive proof that these figures are wrong, but even a cursory glance at my numbers makes them seem like poor estimates.

There are *many* potential mitigating factors here that prevent any sort of sound empirical proof of this assertion. However, the most parsimonious, plausible explanation is that the true number of gay men in America (or at the very least, in Pennsylvania) hasn't been anywhere close to properly enumerated in studies that rely on self-identification. 

Of course... perhaps all this analysis is simply a ploy on my part to deflect from the fact that I have swiped *two hundred and eighty-nine thousand* times on Tinder. I can't wrap my head around that number any more than you can.

Let's continue this dive into insanity by examining my all-time daily maximums.


```r
sapply(bentinder[-1],max)
```

```
##    opens    likes   passes  matches messages   swipes 
##      172     1632     3548       91      509     5144
```

I don't need any advanced statistical data analysis to tell you that opening Tinder 172 times in one day and swiping 5144 times in a day is... well I'll let you pick a word for it.

I'm curious though... what was happening on those days? Let's check the records and find out.


```r
bentinder %>% filter(opens==172|likes==1632|passes==3548|matches==91|messages==509|swipes==5144) %>% mutate(day = wday(date,label = T))
```

```
##         date opens likes passes matches messages swipes day
## 1 2016-04-10   135  1632   3512      91      289   5144 Sun
## 2 2016-04-12    91  1231   3548      65      241   4779 Tue
## 3 2016-04-13   117   528   1897      72      509   2425 Wed
## 4 2017-02-04   172  1357   3324      81      425   4681 Sat
```

It's strange: there was *nothing* remarkable about these days. A quick study of my Google Maps timeline shows that I didn't go anywhere remotely interesting on any of these days, other than work. 

I had expected that my record usage would come with travel, but it seems that it just came with boredom. 

A quick look back at the photos I took on those days confirms the sheer mundanity of my record-setting Tinder marathons.

![April 10, 2016](resources/tinder_study/20160410_185359.jpg)
![April 13, 2016](resources/tinder_study/20160413_201214.jpg)
![February 4, 2017](resources/tinder_study/20170204_090225.jpg)

I swiped 12,250 times on the days I took those photos.

I will never stop laughing at this.

### "It's Like Batting Average, But For Tinder"

Next, we will debut my favorite new statistic from this analysis: the **swipe right percentage**


```r
print('Swipe right percentage:')
```

```
## [1] "Swipe right percentage:"
```

```r
100 * (sum(bentinder$likes) / (sum(bentinder$likes) + sum(bentinder$passes)))
```

```
## [1] 26.00954
```

I swipe right on (a.k.a. "like") only 26% of users. At first, I thought this felt low, and that I was being too picky. Then, I wondered if this might actually be high, since I have no baseline to judge it against.

So, let's answer another simple question: what percentage of users I swiped right on (or "liked") swiped right on me ("liked" me back)?


```r
print('Match percentage:')
```

```
## [1] "Match percentage:"
```

```r
100 * sum(bentinder$matches) / sum(bentinder$likes)
```

```
## [1] 11.63997
```

This number is *much* lower - only 11.6%! I like 26% of users, but only 11.6% of those users like me back. However, it's important to note that 11.6% of users like me *among users that I liked*. For the general population, it's likely a higher percentage, perhaps equal to or greater than 26%.

Unfortunately, Tinder does not provide data on how other users swiped you, and we cannot derive this value using probability theory without further information.

Still, it's fascinating to know that of the people I like, only about 1 in 11 like me back. Perhaps I am too picky!

For good measure, let's calculate the percentage of swipes that have yielded a match.


```r
print('Swipes per match:')
```

```
## [1] "Swipes per match:"
```

```r
100 * sum(bentinder$matches) / sum(bentinder$swipes)
```

```
## [1] 3.027502
```

To be fair, this isn't quite as bad as I thought. I can deal with swiping 33 times (which takes a minute or two) to get a match. Had this number been 100, I would have felt very differently.

We will incorporate these variables into the rest of our analysis as follows. 

First, we add a **swipe right rate**, which is equal to the number of times I swipe right divided by my total number of swipes. 

Second, we add a **match rate**, a log-adjusted variable that gets higher as more users return my swipes right in kind, and lower as more of the users I liked pass on me. 

Additional details for math people: *To be more specific, we will take the ratio of matches to swipes right, parse any zeros in the numerator or the denominator to 1 (necessary for generating real-valued logarithms), and then take the natural logarithm of this value. This statistic itself won't be particularly interpretable, but the comparative overall trends will be.*
 
### Where & When Did My Swiping Habits Change?

We will start our graphing by examining my match rate and swipe right rate over time.


```r
bentinder = bentinder %>% mutate(swipe_right_rate = (likes / (likes+passes))) %>% mutate(match_rate = log( ifelse(matches==0,1,matches) / ifelse(likes==0,1,likes)))
           
rates = bentinder %>% select(date,swipe_right_rate,match_rate) 

match_rate_plot = ggplot(rates) +
  geom_point(size=0.2,alpha=0.5,aes(date,match_rate)) +
  geom_smooth(aes(date,match_rate),color=tinder_pink,size=2,se=FALSE) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=-0.5,label='Pittsburgh',color='blue',hjust=1) +
  annotate('text',x=ymd('2018-02-26'),y=-0.5,label='Philadelphia',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=-0.5,label='NYC',color='blue',hjust=-.4) +
  tinder_theme() +
  coord_cartesian(ylim = c(-2,-.4)) +
  ggtitle('Match Rate Over Time') +
  ylab('')

swipe_rate_plot = ggplot(rates) +
  geom_point(aes(date,swipe_right_rate),size=0.2,alpha=0.5) +
  geom_smooth(aes(date,swipe_right_rate),color=tinder_pink,size=2,se=FALSE) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=.345,label='Pittsburgh',color='blue',hjust=1) +
  annotate('text',x=ymd('2018-02-26'),y=.345,label='Philadelphia',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=.345,label='NYC',color='blue',hjust=-.4) +
  tinder_theme() +
  coord_cartesian(ylim = c(.2,0.35)) +
  ggtitle('Swipe Right Rate Over Time') +
  ylab('') 

grid.arrange(match_rate_plot,swipe_rate_plot,nrow=2)
```

<img src="tinder_study_files/figure-html/unnamed-chunk-10-1.png" width="672" style="display: block; margin: auto;" />

**Match rate** fluctuates very wildly over time, and there clearly isn't any sort of annual or monthly trend. It's cyclical, but not in any obviously traceable manner. 

My best guess here is that the quality of my profile photos (and perhaps general dating prowess) varied significantly over the last five years, and these peaks and valleys trace the periods when I became more or less attractive to other users. The jumps on the curve *are* significant, corresponding to users liking me back anywhere from about 20% to 50% of the time. 

Perhaps this is evidence that the perceived "hot streaks" or "cold streaks" in one's dating life are a very real thing. 

**Swipe right rate** stays much more consistent. There are fewer peaks and valleys, and there's less overall variation. 

However, there is a very noticeable dip in Philadelphia. As a native Philadelphian, the implications of this frighten me. We have [routinely](https://www.reuters.com/article/us-philadelphia-unattractive/looking-for-attractive-people-dont-go-to-philly-idUSN1933313720071019) been derided as having some of the least attractive residents in the nation. I passionately reject that implication. I *refuse* to accept this as a proud native of the Delaware Valley.

That being the case, I'm going to write this off as being a product of disproportionate sample sizes and leave it at that.

The uptick in New York is abundantly clear across the board, though. I used Tinder very little in Summer 2019 while preparing for graduate school, which causes many of the usage rate dips we'll see in 2019 - but there is a *huge* jump to all-time highs across the board when I move to New York. If you're an LGBT millennial using Tinder, it's difficult to beat New York.

### A Problem With Dates

If you study these tables, you'll notice the same issue I did - missing data for messages and app opens.


```r
bentinder[1:20,-c(8,9)]
```

```
##          date opens likes passes matches messages swipes
## 1  2014-11-12     0    24     40       1        0     64
## 2  2014-11-13     0     8     23       0        0     31
## 3  2014-11-14     0     3     18       0        0     21
## 4  2014-11-16     0    12     50       1        0     62
## 5  2014-11-17     0     6     28       1        0     34
## 6  2014-11-18     0     9     38       1        0     47
## 7  2014-11-19     0     9     21       0        0     30
## 8  2014-11-20     0     8     13       0        0     21
## 9  2014-12-01     0     8     34       0        0     42
## 10 2014-12-02     0     9     41       0        0     50
## 11 2014-12-05     0    33     64       1        0     97
## 12 2014-12-06     0    19     26       1        0     45
## 13 2014-12-07     0    14     31       0        0     45
## 14 2014-12-08     0    12     22       0        0     34
## 15 2014-12-09     0    22     40       0        0     62
## 16 2014-12-10     0     1      6       0        0      7
## 17 2014-12-16     0     2      2       0        0      4
## 18 2014-12-17     0     0      0       1        0      0
## 19 2014-12-18     0     0      0       2        0      0
## 20 2014-12-19     0     0      0       1        0      0
```

```r
print('----------skipping rows 21 to 169----------')
```

```
## [1] "----------skipping rows 21 to 169----------"
```

```r
bentinder[170:190,-c(8,9)]
```

```
##           date opens likes passes matches messages swipes
## 170 2015-09-07     5    11     18       1        0     29
## 171 2015-09-08     4    36     96       3        0    132
## 172 2015-09-09     8     7     11       2        0     18
## 173 2015-09-10     2     4      7       0        0     11
## 174 2015-09-11     3    22     60       3        0     82
## 175 2015-09-14     2    24     56       0        0     80
## 176 2015-09-15     1    10     16       1        0     26
## 177 2015-09-17     0     0      0       1        0      0
## 178 2015-09-18     2     0      0       0        0      0
## 179 2015-09-19     1    32     87       2        0    119
## 180 2015-09-20     1     0      0       1        1      0
## 181 2015-09-21     2     0      2       1        0      2
## 182 2015-09-22     1     1      3       0        0      4
## 183 2015-09-25     1    41    105       3        0    146
## 184 2015-09-26     0     0      0       2        0      0
## 185 2015-09-27     0     0      0       1        0      0
## 186 2015-09-28     0     0      0       1        0      0
## 187 2015-09-29     9    35     94       3       23    129
## 188 2015-09-30    11    15     25       3        8     40
## 189 2015-10-01     2     1      4       0        3      5
## 190 2015-10-04     0     0      0       0        1      0
```

```r
bentinder = bentinder %>% select(-c(likes,passes,swipe_right_rate,match_rate))
bentinder = bentinder[-c(1:186),]
messages = messages[-c(1:186),]
```

We clearly cannot compile any useful averages or trends using those categories if we're factoring in data collected before Sep 29, 2015. Therefore, we will restrict our data set to all dates since Sep 29, 2015 moving forward, and all inferences will be made using data from that date on.

### Overall Trends

Now that we've redefined our data set and removed our missing values, let's examine the relationships between our remaining variables.


```r
ggduo(bentinder[2:5], types=list(continuous = wrap("smooth_loess", alpha = 0.4,size=0.2))) + tinder_theme()
```

<img src="tinder_study_files/figure-html/unnamed-chunk-12-1.png" width="672" style="display: block; margin: auto;" />

It's abundantly obvious how much outliers affect this data. Nearly all the points are clustered in the lower left-hand corner of every graph. We can see general long-term trends, but it's hard to make any sort of deeper inference.

There are *a lot* of *very* extreme outlier days here, as we can see by studying the boxplots of my usage statistics.


```r
tidyben = bentinder %>% gather(key = 'var',value = 'value',-date)

ggplot(tidyben,aes(y=value)) +
  coord_flip() +
  geom_boxplot() +
  facet_wrap(~var,scales = 'free',nrow=5) +
  tinder_theme() +
  xlab("") +
  ylab("") +
  ggtitle('Daily Tinder Stats') +
  theme(axis.text.y = element_blank(),axis.ticks.y = element_blank())
```

<img src="tinder_study_files/figure-html/unnamed-chunk-13-1.png" width="672" style="display: block; margin: auto;" />

A handful of extreme high-usage dates skew our data, and will make it difficult to view trends in graphs. Thus, henceforth, we will "zoom in" on graphs, displaying a smaller range on the y-axis and hiding outliers in order to better visualize overall trends.

### Playing Hard To Get

Let's start zeroing in on trends by "zooming in" on my **message differential** over time - the daily difference between the number of messages I get and the number of messages I receive.


```r
ggplot(messages) +
  geom_point(aes(date,message_differential),size=0.2,alpha=0.5) +
  geom_smooth(aes(date,message_differential),color=tinder_pink,size=2,se=FALSE) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=6,label='Pittsburgh',color='blue',hjust=0.2) +
  annotate('text',x=ymd('2018-02-26'),y=6,label='Philadelphia',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=6,label='NYC',color='blue',hjust=-.44) +
  tinder_theme() +
  ylab('Messages Sent/Received In Day') +
  xlab('Date') +
  ggtitle('Message Differential Over Time') +
  coord_cartesian(ylim=c(-7,7))
```

<img src="tinder_study_files/figure-html/unnamed-chunk-14-1.png" width="672" style="display: block; margin: auto;" />

The left side of this graph probably doesn't mean much, since my message differential was closer to zero when I barely used Tinder early on. What's interesting here is I was talking more than the people I matched with in 2017, but over time that trend eroded.

Either I'm talking less, people are talking to me more, or both. 

Let's view messages sent and messages received separately and study the trend a little closer.


```r
tidy_messages = messages %>% select(-message_differential) %>% gather(key = 'key',value = 'value',-date)

ggplot(tidy_messages) +
  geom_smooth(aes(date,value,color=key),size=2,se=FALSE) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=29,label='Pittsburgh',color='blue',hjust=.3) +
  annotate('text',x=ymd('2018-02-26'),y=29,label='Philadelphia',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=30,label='NYC',color='blue',hjust=-.2) +
  tinder_theme() +
  ylab('Msg Received & Msg Sent In Day') +
  xlab('Date') +
  ggtitle('Message Rates Over Time')
```

<img src="tinder_study_files/figure-html/unnamed-chunk-15-1.png" width="672" style="display: block; margin: auto;" />

There are a number of possible conclusions you might draw from this graph, and it's hard to make a definitive statement about it - but my takeaway from this graph was this:

I talked *way* too much in 2017, and over time I learned to send fewer messages and let people come to me. As I did this, the lengths of my conversations eventually reached all-time highs (after the usage dip in Phiadelphia that we'll discuss in a second). Sure enough, as we'll see soon, my messages peak in mid-2019 more precipitously than any other usage stat (although we will discuss other potential explanations for this).

Learning to push less - colloquially known as playing "hard to get" - appeared to work much better, and now I get more messages than ever and more messages than I send.

Again, this graph is open to interpretation. For instance, it's also possible that my profile simply got better over the last couple years, and other users became more interested in me and started messaging me more. Whatever the case, clearly what I am doing now is working better for me than it was in 2017.

### Playing The Game


```r
ggplot(tidyben,aes(x=date,y=value)) +
  geom_point(size=0.5,alpha=0.3) +
  geom_smooth(color=tinder_pink,se=FALSE) +
  facet_wrap(~var,scales = 'free') +
  tinder_theme() + 
  ggtitle('Daily Tinder Stats Over Time')
```

<img src="tinder_study_files/figure-html/unnamed-chunk-16-1.png" width="672" style="display: block; margin: auto;" />

```r
mat = ggplot(bentinder) +
  geom_point(aes(x=date,y=matches),size=0.5,alpha=0.4) +
  geom_smooth(aes(x=date,y=matches),color=tinder_pink,se=FALSE,size=2) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=13,label='PIT',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2018-02-26'),y=13,label='PHL',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=13,label='NY',color='blue',hjust=-.15) +
  tinder_theme() +
  coord_cartesian(ylim=c(0,15)) +
  ylab('Matches') +
  xlab('Date') + 
  ggtitle('Matches Over Time')

mes = ggplot(bentinder) +
  geom_point(aes(x=date,y=messages),size=0.5,alpha=0.4) +
  geom_smooth(aes(x=date,y=messages),color=tinder_pink,se=FALSE,size=2) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=55,label='PIT',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2018-02-26'),y=55,label='PHL',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=30,label='NY',color='blue',hjust=-.15) +
  tinder_theme() +
  coord_cartesian(ylim=c(0,60)) +
  ylab('Messages') +
  xlab('Date') + 
  ggtitle('Messages Over Time')

opns = ggplot(bentinder) +
  geom_point(aes(x=date,y=opens),size=0.5,alpha=0.4) +
  geom_smooth(aes(x=date,y=opens),color=tinder_pink,se=FALSE,size=2) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=32,label='PIT',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2018-02-26'),y=32,label='PHL',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=32,label='NY',color='blue',hjust=-.15) +
  tinder_theme() +
  coord_cartesian(ylim=c(0,35)) +
  ylab('App Opens') +
  xlab('Date') + 
  ggtitle('Tinder Opens Over Time')

swps = ggplot(bentinder) +
  geom_point(aes(x=date,y=swipes),size=0.5,alpha=0.4) +
  geom_smooth(aes(x=date,y=swipes),color=tinder_pink,se=FALSE,size=2) +
  geom_vline(xintercept=date('2016-09-24'),color='blue',size=1) + 
  geom_vline(xintercept=date('2019-08-01'),color='blue',size=1) +
  annotate('text',x=ymd('2016-01-01'),y=380,label='PIT',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2018-02-26'),y=380,label='PHL',color='blue',hjust=0.5) +
  annotate('text',x=ymd('2019-08-01'),y=380,label='NY',color='blue',hjust=-.15) +
  tinder_theme() +
  coord_cartesian(ylim=c(0,400)) +
  ylab('Swipes') +
  xlab('Date') + 
  ggtitle('Swipes Over Time')

grid.arrange(mat,mes,opns,swps)
```

<img src="tinder_study_files/figure-html/unnamed-chunk-16-2.png" width="672" style="display: block; margin: auto;" />

Even though my swipe right rate went down in Philadelphia, my usage went up (at least at first). This is probably due to Philadelphia having a much larger population than Pittsburgh, but it could also be a product of having a new dating pool after moving. That always causes a flurry of new Tinder activity.

The massive dips during the second half of my time in Philadelphia undoubtedly correlates with my preparations for graduate school, which started in early 2018. Then there's a surge upon arriving in New York and having a month off to swipe, and a significantly larger dating pool.

Notice that when I move to New York, all the usage stats peak, but there is an *especially* precipitous rise in the length of my conversations. 

Sure, I had more time on my hands (which feeds growth in all these measures), but the relatively large surge in messages suggests I was making more meaningful, conversation-worthy connections than I had in the other cities. This could have something to do with New York, or maybe (as mentioned earlier) an improvement in my messaging style.

### "Swipe Night, Part 2"

Overall, there is some variation over time with my usage stats, but how much of this is cyclical? We don't see any evidence of seasonality, but perhaps there's variation based on the day of the week? 

Let's investigate. There isn't much to see when we compare months (cursory graphing confirmed this), but there's a clear pattern based on the day of the week.



```r
by_day = bentinder %>% group_by(wday(date,label=TRUE)) %>% summarize(messages=mean(messages),matches=mean(matches),opens=mean(opens),swipes=mean(swipes)) 
colnames(by_day)[1] = 'day'
mutate(by_day,day = substr(day,1,2))
```

```
## # A tibble: 7 x 5
##   day   messages matches opens swipes
##   <chr>    <dbl>   <dbl> <dbl>  <dbl>
## 1 Su        39.7    8.43  21.8   256.
## 2 Mo        34.5    6.89  20.6   190.
## 3 Tu        30.3    5.67  17.4   183.
## 4 We        29.0    5.15  16.8   159.
## 5 Th        26.5    5.80  17.2   199.
## 6 Fr        27.7    6.22  16.8   243.
## 7 Sa        45.0    8.90  25.1   344.
```

```r
by_days = by_day %>% gather(key='var',value='value',-day)

ggplot(by_days) +
  geom_col(aes(x=fct_relevel(day,'Sat'),y=value),fill=tinder_pink,color='black') +
  tinder_theme() +
  facet_wrap(~var,scales='free') +
  ggtitle('Tinder Stats By Day of Week') +
  xlab("") +
  ylab("")
```

<img src="tinder_study_files/figure-html/unnamed-chunk-17-1.png" width="672" style="display: block; margin: auto;" />

```r
rates_by_day = rates %>% group_by(wday(date,label=TRUE)) %>% summarize(swipe_right_rate=mean(swipe_right_rate,na.rm=T),match_rate=mean(match_rate,na.rm=T))
colnames(rates_by_day)[1] = 'day'
mutate(rates_by_day,day = substr(day,1,2))
```

```
## # A tibble: 7 x 3
##   day   swipe_right_rate match_rate
##   <chr>            <dbl>      <dbl>
## 1 Su               0.303      -1.16
## 2 Mo               0.287      -1.12
## 3 Tu               0.279      -1.18
## 4 We               0.302      -1.10
## 5 Th               0.278      -1.19
## 6 Fr               0.276      -1.26
## 7 Sa               0.273      -1.40
```

```r
rates_by_days = rates_by_day %>% gather(key='var',value='value',-day)

ggplot(rates_by_days) +
  geom_col(aes(x=fct_relevel(day,'Sat'),y=value),fill=tinder_pink,color='black') +
  tinder_theme() +
  facet_wrap(~var,scales='free') +
  ggtitle('Tinder Stats By Day of Week') +
  xlab("") +
  ylab("")
```

<img src="tinder_study_files/figure-html/unnamed-chunk-17-2.png" width="672" style="display: block; margin: auto;" />

Tinder recently labeled Sunday its ["Swipe Night"](https://www.help.tinder.com/hc/en-us/articles/360034563391-What-is-Swipe-Night-), but for me, that title goes to Saturday. I use the app most then, and the fruits of my labor (matches, messages, and opens that are presumably related to the messages I'm receiving) slowly cascade over the course of the week. 

I wouldn't make too much of my match rate dipping on Saturdays. It can take a day or five for a user you liked to open the app, see your profile, and like you back. These graphs suggest that with my increased swiping on Saturdays, my immediate conversion rate goes down, probably for this exact reason.

We've captured an important feature of Tinder here: it is seldom immediate. Instantaneous responses are rare on Tinder. It's an app that involves a lot of waiting. You need to wait for a user you liked to like you back, wait for one of you to see the match and send a message, wait for that message to be returned, and so on. This can take a while. It can take days for a match to happen, and then days for a conversation to ramp up.

As my Saturday numbers suggest, this often doesn't happen the same night. So perhaps Tinder is better at looking for a date sometime this week than looking for a date later tonight.

### For My Fellow Data Nerds, Or People Who Just Like Graphs

Here's a parallel coordinate plot that allows you to play with the outliers in my usage categories, and see how my luck varied on my high-usage days. Perhaps you'll notice a trend that I missed.


```r
nodates = select(bentinder,-date)


parcoords(nodates,
          rownames = F,
          brushMode = "1D-axes",
          alpha = .4,
          reorderable = T,
          queue = T,
          color = tinder_pink)
```

<!--html_preserve--><div class="parcoords html-widget" height="480" id="htmlwidget-e61b4ed06f4369109ff4" style="width:672px;height:480px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="672"></div>
<script type="application/json" data-for="htmlwidget-e61b4ed06f4369109ff4">{"x":{"data":{"names":["187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350","351","352","353","354","355","356","357","358","359","360","361","362","363","364","365","366","367","368","369","370","371","372","373","374","375","376","377","378","379","380","381","382","383","384","385","386","387","388","389","390","391","392","393","394","395","396","397","398","399","400","401","402","403","404","405","406","407","408","409","410","411","412","413","414","415","416","417","418","419","420","421","422","423","424","425","426","427","428","429","430","431","432","433","434","435","436","437","438","439","440","441","442","443","444","445","446","447","448","449","450","451","452","453","454","455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","485","486","487","488","489","490","491","492","493","494","495","496","497","498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","535","536","537","538","539","540","541","542","543","544","545","546","547","548","549","550","551","552","553","554","555","556","557","558","559","560","561","562","563","564","565","566","567","568","569","570","571","572","573","574","575","576","577","578","579","580","581","582","583","584","585","586","587","588","589","590","591","592","593","594","595","596","597","598","599","600","601","602","603","604","605","606","607","608","609","610","611","612","613","614","615","616","617","618","619","620","621","622","623","624","625","626","627","628","629","630","631","632","633","634","635","636","637","638","639","640","641","642","643","644","645","646","647","648","649","650","651","652","653","654","655","656","657","658","659","660","661","662","663","664","665","666","667","668","669","670","671","672","673","674","675","676","677","678","679","680","681","682","683","684","685","686","687","688","689","690","691","692","693","694","695","696","697","698","699","700","701","702","703","704","705","706","707","708","709","710","711","712","713","714","715","716","717","718","719","720","721","722","723","724","725","726","727","728","729","730","731","732","733","734","735","736","737","738","739","740","741","742","743","744","745","746","747","748","749","750","751","752","753","754","755","756","757","758","759","760","761","762","763","764","765","766","767","768","769","770","771","772","773","774","775","776","777","778","779","780","781","782","783","784","785","786","787","788","789","790","791","792","793","794","795","796","797","798","799","800","801","802","803","804","805","806","807","808","809","810","811","812","813","814","815","816","817","818","819","820","821","822","823","824","825","826","827","828","829","830","831","832","833","834","835","836","837","838","839","840","841","842","843","844","845","846","847","848","849","850","851","852","853","854","855","856","857","858","859","860","861","862","863","864","865","866","867","868","869","870","871","872","873","874","875","876","877","878","879","880","881","882","883","884","885","886","887","888","889","890","891","892","893","894","895","896","897","898","899","900","901","902","903","904","905","906","907","908","909","910","911","912","913","914","915","916","917","918","919","920","921","922","923","924","925","926","927","928","929","930","931","932","933","934","935","936","937","938","939","940","941","942","943","944","945","946","947","948","949","950","951","952","953","954","955","956","957","958","959","960","961","962","963","964","965","966","967","968","969","970","971","972","973","974","975","976","977","978","979","980","981","982","983","984","985","986","987","988","989","990","991","992","993","994","995","996","997","998","999","1000","1001","1002","1003","1004","1005","1006","1007","1008","1009","1010","1011","1012","1013","1014","1015","1016","1017","1018","1019","1020","1021","1022","1023","1024","1025","1026","1027","1028","1029","1030","1031","1032","1033","1034","1035","1036","1037","1038","1039","1040","1041","1042","1043","1044","1045","1046","1047","1048","1049","1050","1051","1052","1053","1054","1055","1056","1057","1058","1059","1060","1061","1062","1063","1064","1065","1066","1067","1068","1069","1070","1071","1072","1073","1074","1075","1076","1077","1078","1079","1080","1081","1082","1083","1084","1085","1086","1087","1088","1089","1090","1091","1092","1093","1094","1095","1096","1097","1098","1099","1100","1101","1102","1103","1104","1105","1106","1107","1108","1109","1110","1111","1112","1113","1114","1115","1116","1117","1118","1119","1120","1121","1122","1123","1124","1125","1126","1127","1128","1129","1130","1131","1132","1133","1134","1135","1136","1137","1138","1139","1140","1141","1142","1143","1144","1145","1146","1147","1148","1149","1150","1151","1152","1153","1154","1155","1156","1157","1158","1159","1160","1161","1162","1163","1164","1165","1166","1167","1168","1169","1170","1171","1172","1173","1174","1175","1176","1177","1178","1179","1180","1181","1182","1183","1184","1185","1186","1187","1188","1189","1190","1191","1192","1193","1194","1195","1196","1197","1198","1199","1200","1201","1202","1203","1204","1205","1206","1207","1208","1209","1210","1211","1212","1213","1214","1215","1216","1217","1218","1219","1220","1221","1222","1223","1224","1225","1226","1227","1228","1229","1230","1231","1232","1233","1234","1235","1236","1237","1238","1239","1240","1241","1242","1243","1244","1245","1246","1247","1248","1249","1250","1251","1252","1253","1254","1255","1256","1257","1258","1259","1260","1261","1262","1263","1264","1265","1266","1267","1268","1269","1270","1271","1272","1273","1274","1275","1276","1277","1278","1279","1280","1281","1282","1283","1284","1285","1286","1287","1288","1289","1290","1291","1292","1293","1294","1295","1296","1297","1298","1299","1300","1301","1302","1303","1304","1305","1306","1307","1308","1309","1310","1311","1312","1313","1314","1315","1316","1317","1318","1319","1320","1321","1322","1323","1324","1325","1326","1327","1328","1329","1330","1331","1332","1333","1334","1335","1336","1337","1338","1339","1340","1341","1342","1343","1344","1345","1346","1347","1348","1349","1350","1351","1352","1353","1354","1355","1356","1357","1358","1359","1360","1361","1362","1363","1364","1365","1366","1367","1368","1369","1370","1371","1372","1373","1374","1375","1376","1377","1378","1379","1380","1381","1382","1383","1384","1385","1386","1387","1388","1389","1390","1391","1392","1393","1394","1395","1396","1397","1398","1399","1400","1401","1402","1403","1404","1405","1406","1407","1408","1409","1410","1411","1412","1413","1414","1415","1416","1417","1418","1419","1420","1421","1422","1423","1424","1425","1426","1427","1428","1429","1430","1431","1432","1433","1434","1435","1436","1437","1438","1439","1440","1441","1442","1443","1444","1445","1446","1447","1448","1449","1450","1451","1452","1453","1454","1455","1456","1457"],"opens":[9,11,2,0,0,50,11,4,1,1,1,4,3,5,3,6,5,3,5,3,0,12,3,4,1,15,14,20,19,3,7,1,7,2,1,4,11,7,3,2,2,0,0,8,10,5,2,0,0,6,8,0,2,8,5,12,2,0,1,1,44,0,3,25,73,101,5,18,8,9,8,1,5,7,1,1,7,7,34,27,0,2,22,9,2,1,1,1,1,7,0,4,2,1,0,0,1,7,10,6,28,7,2,20,9,1,6,3,0,2,2,0,2,5,12,2,8,3,1,3,1,6,4,2,6,0,5,40,5,5,0,3,64,9,6,5,17,6,11,92,24,0,17,135,18,91,117,29,10,74,74,62,67,44,2,1,0,21,9,9,91,103,16,23,69,117,7,5,4,2,5,37,71,16,22,42,7,64,8,7,1,5,13,12,3,4,13,2,2,21,0,54,89,81,57,54,75,27,9,29,18,14,0,1,163,49,30,95,140,107,6,19,2,1,2,5,3,5,29,57,0,127,60,42,44,14,147,24,83,109,7,21,95,42,1,6,19,4,7,2,2,4,2,10,6,14,1,2,0,2,8,0,4,0,5,0,7,9,0,0,2,8,5,0,0,2,0,1,3,12,2,3,23,45,59,57,141,9,64,27,8,0,0,0,0,3,12,2,9,2,11,36,7,11,65,106,27,0,7,0,17,0,0,0,0,0,3,50,130,0,56,22,3,0,8,4,8,0,1,6,2,0,0,1,15,18,0,22,91,39,30,17,13,4,28,3,2,7,11,14,38,0,137,29,0,32,4,35,0,6,17,0,7,23,2,8,79,5,2,0,0,24,2,0,0,0,4,4,7,9,28,41,7,10,34,4,19,12,4,7,17,0,10,4,15,15,33,3,9,9,4,9,18,4,18,14,0,0,3,27,17,4,0,18,23,11,5,9,1,5,30,0,0,16,33,10,172,24,8,22,52,17,0,59,53,13,48,25,38,90,45,35,33,43,14,57,14,90,75,63,14,5,17,6,0,47,10,11,15,20,24,42,53,19,62,60,65,53,37,69,9,15,32,10,23,12,38,17,16,15,25,29,14,17,7,53,27,29,1,13,7,23,17,9,23,12,8,28,38,25,0,18,1,70,39,14,19,13,1,0,0,132,0,22,46,70,1,0,30,8,29,60,28,50,28,54,74,50,15,49,40,44,22,67,33,21,15,8,22,31,10,27,75,106,79,41,69,31,44,108,56,48,28,51,20,23,44,61,12,31,66,46,26,5,22,2,5,35,69,43,35,8,17,40,20,21,46,9,11,1,0,0,2,16,17,42,5,71,54,24,32,18,3,5,4,18,21,40,24,0,0,3,0,0,0,0,0,7,26,51,89,56,64,9,0,21,16,10,5,3,2,8,0,68,35,23,7,38,28,61,46,0,23,31,18,34,19,44,42,13,16,18,2,36,61,19,59,41,17,88,15,23,13,0,13,165,69,56,91,8,25,9,9,21,10,39,12,27,0,4,0,40,25,0,10,19,4,8,60,0,8,13,4,25,9,31,94,28,11,2,23,4,12,5,53,18,22,5,0,23,78,11,128,24,22,97,10,84,64,0,0,2,5,0,99,24,8,48,21,114,109,80,18,147,61,11,10,38,19,20,12,31,23,25,0,32,30,33,19,25,21,29,8,0,4,0,23,14,18,19,20,65,41,17,13,96,103,106,113,34,32,15,4,12,26,3,19,15,6,2,6,12,0,4,57,29,5,0,0,0,0,8,7,6,0,117,88,14,0,25,21,14,35,17,59,0,2,5,44,50,33,24,0,10,12,1,66,24,6,0,0,0,4,13,49,43,88,28,3,9,13,10,3,3,5,1,3,15,31,14,4,15,18,2,29,21,4,0,14,10,0,0,2,0,1,12,0,0,0,0,0,1,0,1,0,0,1,9,0,1,1,1,66,15,5,0,2,10,0,0,0,0,3,10,28,33,2,2,26,4,0,9,13,8,2,6,6,3,20,57,50,10,2,17,115,16,0,21,20,112,25,13,19,27,25,53,128,51,19,17,24,4,2,15,11,27,5,8,6,27,14,4,6,10,5,0,4,73,58,87,52,138,51,46,5,14,17,9,2,26,35,2,0,34,76,85,10,28,13,3,6,23,38,19,2,2,14,3,9,17,8,8,15,25,5,4,19,3,10,19,6,10,20,24,23,2,10,2,22,31,29,5,4,0,5,0,15,14,4,5,1,2,21,19,14,0,0,23,16,29,0,16,0,10,2,32,18,42,7,2,6,0,29,9,6,15,0,5,46,6,1,7,0,2,3,10,0,0,14,0,1,3,55,1,5,3,8,1,0,0,93,15,17,13,2,2,0,6,0,0,2,0,6,13,23,0,1,2,22,0,9,0,0,14,34,33,19,2,61,95,39,20,7,5,2,11,4,19,6,7,0,4,25,4,1,12,1,13,4,1,10,11,4,15,0,4,24,1,0,7,0,18,0,16,0,1,5,3,6,5,20,20,25,27,23,11,5,29,33,3,12,4,14,0,3,4,4,2,1,0,3,20,24,73,14,25,13,3,18,6,9,2,5,5,1,1,6,0,3,2,2,73,4,8,2,1,2,1,36,6,0,2,0,7,12,0,2,0,5,0,1,0,1,1,9,2,0,8,4,4,4,3,4,1,1,2,11,2,0,1,2,0,2,1,1,0,2,0,2,5,8,0,0,2,1,1,2,3,4,19,43,34,3,60,45,3,18,14,20,41,47,62,51,11,17,16,7,17,3,15,7,22,14,17,9,5,36,68,20,8,11,16,21,0,4,11,1,7,18,3,2,13,1,1,3,4,3,0,2,4,4,0,1,7,15,13,16,12,6,2,1,35,7,5,0,6,16,13,3,7,0],"matches":[3,3,0,0,0,5,0,2,0,0,3,1,1,1,3,1,0,1,1,1,0,2,0,0,0,7,11,10,7,0,2,0,4,0,0,1,4,0,4,0,2,1,1,7,4,0,0,1,1,0,4,0,0,2,0,3,1,1,0,7,2,1,0,7,21,19,2,0,0,0,1,0,1,1,1,3,1,0,1,1,0,0,1,0,2,2,0,1,1,3,0,0,4,0,1,0,0,7,2,5,1,1,0,4,0,0,4,1,1,4,1,0,0,7,2,0,3,1,1,0,0,2,2,0,3,0,5,5,5,11,1,0,4,0,2,0,2,1,3,52,35,7,6,91,44,65,72,27,4,55,24,21,23,16,5,3,0,1,2,19,30,60,40,14,22,26,13,3,5,5,2,37,22,9,6,11,9,10,3,6,3,1,1,1,1,3,0,0,0,9,8,22,23,32,16,13,20,15,5,5,7,7,3,4,40,32,3,20,11,6,3,1,5,3,1,1,6,3,10,23,3,9,7,2,6,4,24,11,18,5,2,4,29,20,8,8,2,1,1,0,3,2,1,0,3,0,0,1,2,0,2,2,0,1,2,2,0,3,0,2,1,4,2,1,0,2,1,1,12,0,0,3,26,21,9,19,25,18,23,29,0,7,4,3,2,0,6,1,1,0,3,22,9,8,21,14,8,1,7,1,3,4,0,2,0,0,4,11,7,2,4,4,3,0,2,2,5,1,4,3,1,4,0,2,0,5,2,22,10,11,2,2,1,2,4,1,4,6,1,4,2,1,26,6,1,6,2,7,2,4,4,1,0,4,1,2,18,16,2,3,2,2,5,2,1,2,0,4,2,0,39,39,3,2,1,3,8,1,3,5,7,4,5,3,6,2,8,4,3,2,1,4,4,2,4,0,1,1,5,3,4,4,3,15,10,3,4,0,1,2,6,1,1,6,64,31,81,39,13,8,18,12,3,11,23,17,17,10,12,7,4,2,4,2,0,2,2,51,12,27,12,2,5,2,1,10,1,3,1,21,10,9,77,9,44,3,31,19,3,11,12,35,16,17,31,44,28,5,12,8,8,10,14,14,6,15,8,3,2,10,8,15,8,0,9,9,6,18,23,7,1,11,4,16,2,5,6,3,4,2,1,25,4,7,9,21,19,4,9,17,9,12,10,8,8,15,5,8,2,8,8,15,8,23,5,8,6,7,17,10,18,8,6,5,3,6,10,4,6,18,21,13,12,14,9,9,5,12,1,7,16,14,10,5,6,4,5,27,14,8,11,6,15,18,4,13,22,12,6,5,1,4,9,4,15,5,4,5,19,9,8,5,11,5,7,8,24,13,3,3,1,0,0,1,0,1,1,1,3,33,20,10,10,2,0,3,9,3,3,3,4,8,6,29,12,17,5,13,10,12,17,6,12,10,5,10,5,17,26,8,6,5,2,13,17,7,9,17,4,12,11,10,20,8,4,12,12,15,14,10,12,13,3,9,7,14,13,16,3,4,5,6,12,5,8,3,2,4,17,2,7,9,5,5,14,9,18,7,1,4,1,3,9,10,13,8,4,6,4,5,46,10,13,11,14,26,10,20,23,11,6,1,6,3,20,5,6,13,5,28,19,47,16,9,12,7,5,9,5,6,3,10,8,6,2,8,7,5,4,1,5,4,9,7,4,2,10,7,5,4,6,8,3,6,3,9,5,16,7,2,3,5,1,2,6,4,1,1,7,0,1,16,0,0,10,7,0,2,1,1,1,0,0,0,1,19,13,7,4,12,5,9,11,15,11,3,5,6,17,14,10,5,3,6,8,1,8,16,8,4,3,4,2,5,17,7,7,8,6,4,6,12,9,3,2,1,1,1,13,6,2,2,0,0,2,9,2,2,3,3,1,1,1,0,2,7,3,4,0,1,1,1,1,2,0,1,2,20,0,0,0,11,13,1,0,0,0,0,1,0,1,1,6,9,0,5,1,1,7,3,1,3,0,4,1,0,1,1,2,12,23,10,8,9,8,3,1,2,6,4,4,2,1,7,2,7,35,17,12,3,8,7,6,10,4,4,3,4,3,3,2,1,2,5,1,1,1,27,15,16,11,26,11,8,6,16,12,0,1,5,10,1,2,11,11,6,3,9,2,2,2,6,2,4,1,2,3,4,6,11,5,3,2,2,2,2,4,3,3,1,3,3,2,2,1,2,4,0,18,12,1,1,0,1,0,1,10,2,0,3,0,1,2,2,1,1,1,3,0,1,1,0,0,2,1,6,9,3,4,0,3,1,4,2,3,4,1,4,12,4,2,3,2,1,5,14,1,2,7,1,0,15,19,3,7,2,12,3,1,2,8,2,2,4,1,2,1,6,2,0,0,0,11,9,17,3,1,0,2,1,0,0,0,3,4,4,4,3,13,33,9,11,8,1,0,4,0,2,1,1,1,2,5,2,0,0,1,2,1,0,5,11,2,4,3,1,5,1,0,4,1,2,0,4,0,0,9,21,1,2,11,10,8,5,8,7,0,5,13,2,7,2,15,0,2,0,2,1,1,1,1,2,2,5,3,7,5,3,3,1,1,1,3,2,0,0,1,1,3,4,2,5,2,3,2,1,2,2,6,6,0,1,1,1,1,1,0,1,1,1,1,1,2,0,14,5,2,4,6,1,3,1,2,0,1,1,5,1,0,0,2,1,0,1,0,1,0,1,0,11,9,0,0,1,1,0,0,9,8,22,14,18,17,19,24,10,16,19,12,11,27,17,17,7,5,7,6,17,7,12,3,5,2,0,10,3,15,19,22,4,5,9,5,7,5,3,4,4,20,11,4,3,3,2,0,7,4,2,6,0,4,4,8,18,14,8,7,1,2,1,5,5,5,5,1,2,8,5,1,2,0],"messages":[23,8,3,1,1,43,1,0,0,0,2,0,0,2,3,6,2,0,0,0,1,1,2,1,0,20,31,17,15,0,0,1,11,2,0,12,27,1,1,3,0,0,0,3,17,6,0,0,0,0,3,2,5,4,0,1,0,0,0,7,42,1,0,27,147,317,10,45,7,11,2,3,2,0,0,2,2,1,36,16,3,0,97,4,2,3,0,0,0,15,1,1,4,2,0,1,0,4,0,0,26,3,0,1,0,0,1,1,0,1,4,1,6,8,16,0,1,3,2,0,0,9,5,6,0,1,5,54,0,3,0,8,93,2,4,4,3,4,0,115,35,5,20,289,47,241,509,106,32,265,231,208,112,49,12,3,3,66,11,26,272,156,21,110,163,154,17,6,17,2,4,131,201,34,22,41,15,109,12,10,3,4,1,13,1,1,17,0,1,14,1,90,93,248,149,102,182,55,16,27,27,26,0,3,374,108,40,149,284,114,10,27,4,5,2,3,1,2,66,135,4,314,86,42,47,14,268,39,139,192,15,20,73,18,3,5,30,1,3,0,0,2,3,10,3,32,0,1,0,0,0,1,1,0,2,3,4,5,1,0,2,13,3,0,1,2,0,2,6,19,0,0,18,77,89,157,255,16,148,40,3,2,3,0,0,12,29,5,15,0,27,78,20,66,263,206,51,3,16,1,40,69,2,0,1,0,0,68,172,3,124,28,1,1,9,3,4,1,4,46,2,0,1,1,17,6,5,25,137,101,69,39,7,2,41,4,2,7,2,13,96,0,142,54,2,56,2,55,2,2,14,0,1,42,1,14,224,6,1,0,0,55,1,1,0,1,3,8,1,7,30,106,19,18,42,2,4,4,6,6,8,2,10,4,5,10,24,0,31,7,3,5,4,5,24,20,0,0,5,71,17,5,2,43,47,17,2,0,1,0,25,0,0,14,9,6,425,57,11,30,103,24,3,87,73,13,100,5,83,160,73,58,37,129,16,55,12,270,65,21,73,11,38,6,0,43,8,18,15,3,21,0,244,132,201,156,139,87,42,126,17,10,177,37,35,9,69,99,26,36,38,48,21,13,3,137,41,52,0,15,2,26,13,0,33,15,6,20,63,34,4,9,1,50,51,21,19,0,2,0,0,86,2,20,54,36,8,1,5,2,40,65,28,33,20,78,120,51,11,40,34,8,1,95,66,10,19,10,3,26,6,79,67,121,62,12,64,23,49,165,65,7,20,69,16,3,64,87,11,17,41,36,18,2,49,0,3,94,173,56,85,6,16,104,20,15,42,2,3,2,0,0,4,1,13,110,4,80,104,23,108,44,23,7,1,15,27,98,36,1,7,4,2,6,1,1,1,0,8,160,176,48,55,4,3,6,11,12,11,2,0,11,4,35,81,30,9,34,59,110,77,8,54,35,41,28,4,54,36,31,41,32,3,24,71,47,59,112,21,179,22,2,3,2,62,354,145,76,195,6,12,2,2,0,1,3,15,15,0,1,0,123,63,6,3,68,11,7,100,2,6,20,4,39,15,8,101,37,12,6,21,2,4,3,80,30,34,12,1,7,176,10,198,21,7,128,5,46,83,2,2,1,1,1,119,24,2,48,22,123,92,58,22,168,64,17,2,61,10,37,3,59,27,40,2,27,20,29,23,10,20,8,14,2,1,1,30,10,70,51,27,55,62,7,19,142,258,296,214,44,49,18,1,8,25,6,12,4,3,1,7,15,1,1,24,30,1,0,0,1,1,0,12,11,1,452,190,18,2,54,36,5,61,58,133,3,7,26,76,28,40,30,2,5,7,9,87,38,7,1,3,0,0,26,120,42,23,28,8,9,58,7,23,39,2,1,5,30,90,109,18,59,40,0,102,31,1,0,29,6,3,0,0,1,0,5,3,0,1,0,0,1,0,0,3,0,1,10,1,2,0,18,79,26,7,1,3,5,0,2,0,0,0,21,42,63,5,1,51,8,2,15,32,7,8,7,5,0,12,101,101,23,5,42,230,15,1,55,19,285,62,28,15,22,60,35,82,171,32,24,35,9,6,23,25,65,3,0,13,11,1,4,4,22,22,1,0,93,59,102,165,169,62,87,2,3,18,11,0,22,12,3,0,51,282,96,11,57,14,1,15,20,38,47,11,1,8,5,19,33,7,9,12,35,0,1,10,4,17,9,9,16,14,28,31,4,4,4,37,21,24,4,1,0,3,0,8,20,3,1,0,1,11,1,11,0,0,19,7,60,5,4,1,4,0,14,11,18,3,1,0,0,18,2,0,24,0,1,125,11,4,1,0,6,14,21,3,0,32,0,0,2,47,10,75,14,30,5,0,0,113,210,22,6,3,0,0,4,0,0,2,1,34,17,47,3,1,1,41,2,13,1,1,56,34,39,35,4,86,283,53,8,31,12,5,24,14,9,7,1,0,2,56,3,1,5,0,2,1,0,6,8,1,11,1,0,46,13,3,50,2,24,2,81,4,0,0,8,67,20,24,4,18,14,24,28,1,43,130,32,20,5,26,1,0,18,1,0,0,0,1,23,21,129,16,29,23,1,10,5,3,1,0,1,1,0,0,0,32,1,3,146,5,10,1,1,6,1,90,6,1,0,2,15,15,1,1,0,0,0,1,0,0,0,18,2,3,1,6,1,1,0,1,3,0,4,41,8,1,0,1,0,1,1,0,0,0,0,0,29,45,1,1,3,1,0,0,34,70,64,92,325,25,155,399,14,122,45,86,159,197,193,278,23,43,37,42,8,18,55,42,33,32,36,99,4,355,122,82,46,39,179,71,3,3,51,2,6,32,116,3,101,3,3,2,8,6,4,5,4,0,1,5,24,11,40,13,20,4,6,28,57,16,18,1,9,51,111,15,3,27],"swipes":[129,40,5,0,0,160,5,0,1,0,38,147,13,0,66,27,22,85,26,0,0,0,0,0,0,153,703,127,64,43,6,0,59,0,0,141,29,0,66,0,197,0,0,176,34,0,14,0,0,0,152,0,64,0,33,23,0,0,0,185,32,1,0,582,418,590,0,61,0,0,8,0,41,11,58,9,41,6,17,37,0,9,123,4,55,44,7,5,1,25,0,0,133,6,0,0,8,284,34,37,58,49,5,58,4,1,143,7,0,28,16,0,5,156,42,28,16,16,56,59,0,89,0,0,80,0,105,46,53,267,0,119,229,26,40,42,84,19,37,4654,927,35,893,5144,812,4779,2425,12,0,1698,186,965,1123,34,0,0,0,24,8,534,2407,2479,32,268,639,694,146,24,26,47,0,575,530,28,105,316,3,176,41,80,0,17,16,11,0,20,12,0,0,635,0,791,2078,1269,636,69,1900,147,9,448,110,59,0,270,3841,215,56,779,514,282,0,446,0,0,0,3,1,79,762,21,0,642,51,16,364,12,1716,5,595,348,32,280,2340,208,81,35,36,21,48,0,24,54,23,52,20,27,0,0,0,4,93,12,8,0,59,14,62,3,0,0,0,123,2,0,0,0,0,0,269,32,0,188,1201,766,52,472,624,79,232,281,30,0,0,0,0,6,26,1,12,0,32,250,162,314,703,115,109,0,53,0,4,0,0,0,0,2,7,299,101,0,126,12,36,0,63,7,68,0,19,69,3,0,0,0,54,62,10,1104,292,150,10,22,113,0,156,18,9,197,0,126,74,0,636,128,0,153,32,292,0,260,211,0,9,116,12,86,783,0,1,0,0,153,6,0,4,0,12,92,56,125,1057,819,7,22,201,19,164,70,58,89,181,4,82,6,77,32,75,66,18,161,0,104,90,68,23,47,0,0,218,30,76,30,0,322,36,61,59,31,25,12,164,0,0,120,2113,1128,4681,55,90,286,897,60,0,359,1413,214,286,370,235,412,33,30,72,10,2,75,17,521,205,490,76,19,76,0,0,199,38,73,82,1227,957,305,2422,6,1235,74,810,653,61,286,10,1164,122,301,1244,652,658,10,500,138,551,73,342,685,159,396,179,39,50,1712,1060,232,428,31,645,276,445,301,576,239,0,371,39,917,44,293,206,256,36,0,0,1065,0,446,377,2012,1,0,582,291,240,444,780,863,211,537,310,10,19,851,323,504,332,462,265,239,192,242,326,1037,232,369,301,701,342,494,309,339,228,449,692,1268,391,558,378,355,265,331,62,489,533,280,308,263,47,117,185,1013,422,114,453,67,541,210,30,735,576,140,408,9,0,0,108,884,357,190,143,547,604,156,383,147,258,287,16,733,351,171,321,0,0,8,0,0,0,0,0,18,2268,492,860,397,364,48,0,77,1076,326,46,122,0,176,0,1660,323,56,3,785,60,686,313,0,634,168,191,340,199,628,475,9,341,254,0,477,319,410,424,195,8,539,15,582,151,0,577,256,250,319,283,26,522,179,23,332,426,448,147,370,0,324,0,565,10,0,87,48,29,318,652,0,189,91,107,285,564,442,242,26,44,1,26,25,652,548,161,311,285,17,0,218,1657,7,101,136,507,1260,18,1105,1093,0,0,0,114,0,1685,42,0,506,138,1116,466,3538,45,493,466,143,114,549,73,49,350,124,306,95,0,459,271,232,108,258,320,438,90,0,182,0,773,10,358,360,328,419,55,275,361,247,178,504,187,255,140,1223,2,90,875,21,3,3,30,0,18,279,0,85,2452,158,0,0,0,0,0,47,13,0,0,2531,552,366,0,170,236,160,2045,371,96,0,4,21,1128,497,30,45,0,122,58,0,605,1053,24,0,0,0,0,172,1590,49,485,213,8,95,826,252,24,17,17,0,37,36,584,39,5,391,173,32,58,238,0,0,184,60,0,0,0,0,0,283,0,0,0,0,0,0,0,8,0,0,0,336,0,0,21,88,614,86,109,0,23,22,0,0,0,0,344,209,11,344,1,14,137,20,0,127,14,89,0,92,54,0,101,956,1438,267,26,336,213,1,0,38,322,628,155,132,147,115,128,546,3822,433,30,279,590,61,396,428,39,37,14,45,63,59,31,24,60,28,2,0,10,1215,273,169,91,590,181,120,11,380,87,13,0,514,224,8,0,413,399,215,1,164,45,2,33,177,133,70,0,49,108,47,63,137,28,125,87,51,111,61,188,70,55,77,66,66,87,42,98,21,98,0,355,247,57,27,51,0,56,0,150,50,21,52,41,19,100,169,50,0,0,128,50,21,0,102,0,139,58,273,80,202,212,150,234,0,206,53,70,107,0,86,319,46,0,201,0,63,19,163,0,0,198,0,0,22,598,0,150,18,312,0,0,0,399,8,18,2,0,18,0,77,0,14,0,0,519,178,334,0,8,0,264,0,0,0,0,348,173,441,64,0,1231,430,149,275,224,137,0,185,142,190,66,109,0,277,152,51,131,65,98,116,70,0,458,925,166,113,0,48,447,1,0,94,0,199,21,106,0,0,34,118,9,44,1023,417,142,89,313,65,1,56,264,0,181,5,343,0,2,133,75,0,7,0,19,235,147,160,65,261,130,32,149,22,16,31,242,54,34,0,216,0,3,14,7,216,0,124,47,0,5,0,398,95,0,32,0,119,123,0,0,0,10,0,17,0,19,20,351,121,0,119,238,53,171,3,87,115,0,13,221,0,0,0,0,0,0,0,0,0,0,0,0,127,84,0,0,18,0,0,1,371,75,711,418,1156,8,1062,675,21,189,1387,133,317,1496,665,310,109,148,182,7,554,29,110,35,154,14,181,80,5,254,982,416,2,112,160,99,0,0,114,10,150,636,50,0,37,0,0,1,135,8,0,120,16,96,0,471,394,416,232,35,15,2,4,157,38,40,2,0,47,187,35,3,149,0]},"options":{"rownames":false,"color":"#FE3C72","brushMode":"1D-axes","brushPredicate":"AND","reorderable":true,"margin":{"top":50,"bottom":50,"left":100,"right":50},"alpha":0.4,"mode":"queue","bundlingStrength":0.5,"smoothness":0},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## Conclusion

### Dubious Demographics

The most profound takeaway here is that these numbers cast serious doubt upon many empirical estimates of LGBT populations. We can say with reasonable confidence that my swiping numbers are implausible if estimates of Pennsylvania's LGBT population are to be believed.

### Love Is Bored

My Tinder usage peaked when I was doing very little, and it hits its weekly high-water mark on Saturdays. The busier I got in 2019, the more my usage plummeted. Having more time for Tinder clearly leads to more Tinder usage, and having less time for Tinder clearly leads to less Tinder usage.

This seems intuitive, but it suggests that romantic obsessions may have as much to do with having nothing to do as they do with actual romance. 

### Does Location Matter? Well, Maybe.

I expected larger differences between localities, but it was difficult to make precise geographic inferences. There were too many other life changes in this period to make any sweeping statements. 

The drop in swipe right rate upon moving to Philadelphia does stand out (much to my dismay), but certainly not as much as the peaks across the board in New York. Granted, I had a lot of time to swipe when I arrived in New York since I had a month off before school, but it seems that both the quantity *and* quality of my connections surged. 

When you're gay, living in a big city is great for cultural reasons - but we don't talk enough about how much overall population matters. Clearly, New York was an incredible place to swipe. Location can mean everything when you're gay.

I'll be curious to see how these New York numbers evolve over time, and if the sheer population of the city allows me to sustain them better than I did in Philadelphia. 

### The Cinderella Effect

My match rate fluctuated very wildly over time, which implies that users' interest in me varied over time. We can think of this a couple ways - either my *representation* of myself changed in my profile, or *I myself* changed and become more or less attractive to other users. 

Either way, we can interpret this as a sign that we aren't static, and a person can always get better (or worse) at dating - especially online.

### "Playing Hard To Get" May A Be Real Thing

The less I dominated my conversations, the longer they got. We can't prove causality here, but my message differential charts make it appear that a more relaxed, succinct approach to conversation benefitted me.

This brings me to my next question...

### Can We Solve Dating Using Machine Learning?

It would be fascinating to see how my success rates - namely message differential and match rate - are affected by how I use the app. 

Not using the app isn't a recipe for dating success, but overdoing it and obsessively swiping and messaging isn't a good strategy, either. So where's the middle ground?

If we build a model using this data, we may be able to answer these questions, and find an ideal way to use Tinder to maximize success. That's beyond the scope of this study, but it's something I'd like to explore down the line.

## Final Thoughts

I probably use Tinder too much. I think we've established that.

Still though, the fruits of my time invested are abundantly evident. I've made 8,777 connections, 8,500 of which I probably never would have made otherwise, and some of which became very meaningful to me.

We are seldom fortunate enough to have a true quantification of the number of people we've interacted with over the years - so as hilariously excessive as all this seems, it's pretty cool to have such a definitive empirical trace of my 20's.

I've learned a lot about myself through this analysis, and I strongly encourage you to run [my script](https://github.com/bwliv/Tinder/blob/master/grabyourtinder.R) and do the same for yourself with your own data. I'd love to hear what you find.

Until then, [swipe on, my friends](https://youtu.be/pwNPTT7nDS0).
