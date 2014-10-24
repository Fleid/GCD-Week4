#Getting and Cleaning Data - Week 4

## Editing Text Variables

Playing with the formating

```
# upper, lower
toupper()
tolower()

# split
strsplit()

# replace
sub() #only the first occurence
gsub() #all occurences

# replace values
grep()
grepl()
```

Other useful string functions via **stringr**

```
library(stringr)

#count characters
nchar()

#substring
substr()

#concatenate
paste()
paste0()

#trim
str_trim()


```


## RegEx
General stuff about regex:

* ```^x``` any line that starts with x
* ```$x``` any line that ends with x
* ```[Bb][Uu][Ss][Hh]```any line that has **bush** in any cap size
* ```[0-9]``` any line that has at least 1 number
* ```[a-zA-Z]``` any line that has at least 1 char in any cap size
* ```[^xX]``` will reject any line that contains x or X
* ```9.11``` any line like 9x11, 9311, 9-11...
* ```x|X|a``` x OR X OR a
* ```[Gg]ood|[Bb]ad```
* Use ```()```to constrain on expressions : ```^(x|A)``` any line that starts by x or A
* Use ```?```for optional constrains : ```[Gg]eorge ([Ww])? [Bb]ush```
* Use ```\``` as the escape character : ```[Gg]eorge ([Ww]\.)? [Bb]ush```
* ```+``` means at least one of the item : ```[0-9]+```for at least one digit
* ```*``` means any number of the item including none : ```(.*)[0-9]+``` for any number of characters followed by at least one digit. ```*``` is greedy and won't stop at space, but you can change that with ```*?``
* ```{1,5}``` to specify a number of repetition allowed, here from 1 to 5

You can define areas with ```()``` and call them back with ```\1```, ```\2```...


## Working with Dates
Getdate()

```
date() # in character type
Sys.date() # in Date type
```

Formating date with expressions: 

* %d : day of the month
* %a : abbreviated weekday
* %A : unabbreviated weekday
* %m : month (00-12)
* %b : abbreviated month
* %B : unabbreviated month
* %y : 2 digit year
* %Y : 4 digit year

```
format(Sys.date(),"%a %b %d")

as.Date("1jan1960", "%d%b%Y")
```

Great library to work with dates : **Lubridate**, works well with Time Savings and Time Zones

```
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013)

ymd_hms("2011-08-03 10:15:03", tz="Pacific/Auckland")

?Sys.timezone
```

## Data Resources
See [slides](https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/04_05_dataResources.pdf)