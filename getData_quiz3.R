#ques 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
setInternet2(TRUE)
download.file(fileUrl,destfile="./data/acs_6.csv")
list.files("./data")
acs <- read.csv("./data/acs_6.csv")
head(acs)

> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
> download.file(fileUrl,destfile="./data/acs_6.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD'
Content type 'text/csv' length 4246554 bytes (4.0 Mb)
opened URL
downloaded 4.0 Mb

> list.files("./data")
[1] "~$Natural_Gas.xlsx" "acs_2.csv"          "acs_6.csv"         
[4] "acs_idaho.csv"      "cameras.csv"        "housing.csv"       
[7] "Natural_Gas.xlsx"   "rest.xml"          
> acs <- read.csv("./data/acs_6.csv")
> head(acs)
  RT SERIALNO DIVISION PUMA REGION ST  ADJUST WGTP NP TYPE ACR AGS BDS BLD
1  H      186        8  700      4 16 1015675   89  4    1   1  NA   4   2
2  H      306        8  700      4 16 1015675  310  1    1  NA  NA   1   7
3  H      395        8  100      4 16 1015675  106  2    1   1  NA   3   2
4  H      506        8  700      4 16 1015675  240  4    1   1  NA   4   2
5  H      835        8  800      4 16 1015675  118  4    1   2   1   5   2
6  H      989        8  700      4 16 1015675  115  4    1   1  NA   3   2
  BUS CONP ELEP FS FULP GASP HFL INSP KIT MHP MRGI MRGP MRGT MRGX PLM RMS
1   2   NA  180  0    2    3   3  600   1  NA    1 1300    1    1   1   9
2  NA   NA   60  0    2    3   3   NA   1  NA   NA   NA   NA   NA   1   2

> agriculturalLogical <- acs[which(acs$ACR > 2 & acs$AGS > 5),]
> head(agriculturalLogical)
    RT SERIALNO DIVISION PUMA REGION ST  ADJUST WGTP NP TYPE ACR AGS BDS BLD
125  H    30346        8  400      4 16 1015675  120  4    1   3   6   3   2
238  H    53292        8  300      4 16 1015675   26  3    1   3   6   2   3
262  H    56299        8  800      4 16 1015675   97  2    1   3   6   2   2
470  H   101282        8  800      4 16 1015675   76  2    1   3   6   3   2
555  H   120351        8  800      4 16 1015675   51  5    1   3   6   5   2
568  H   122802        8  800      4 16 1015675   63  5    1   3   6   3   2
 
#ques 2

> install.packages("jpeg")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/jpeg_0.1-8.zip'
Content type 'application/zip' length 229591 bytes (224 Kb)
opened URL
downloaded 224 Kb

package ‘jpeg’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\John\AppData\Local\Temp\RtmpsZAJj4\downloaded_packages
> library(jpeg)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg?accessType=DOWNLOAD"
setInternet2(TRUE)
download.file(fileUrl,destfile="./data/jeff.jpg")
list.files("./data")

> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg?accessType=DOWNLOAD"
> setInternet2(TRUE)
> download.file(fileUrl,destfile="./data/jeff.jpg")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg?accessType=DOWNLOAD'
Content type 'image/jpeg' length 23849 bytes (23 Kb)
opened URL
downloaded 23 Kb

> list.files("./data")
[1] "~$Natural_Gas.xlsx" "acs_2.csv"          "acs_6.csv"         
[4] "acs_idaho.csv"      "cameras.csv"        "housing.csv"       
[7] "jeff.jpg"           "Natural_Gas.xlsx"   "rest.xml"     

# needed binary mode to read data


> download.file(fileUrl,destfile="./data/jeff.jpg",mode="wb")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg?accessType=DOWNLOAD'
Content type 'image/jpeg' length 23849 bytes (23 Kb)
opened URL
downloaded 23 Kb

> jpg_file <- readJPEG("./data/jeff.jpg",native=TRUE)
> 

> head(jpg_file)
[1] -11494710 -11494710 -11494710 -11494710 -11494710 -11494710

> quantile(jpg_file,probs=c(.3,.8))
      30%       80% 
-15259150 -10575416 
> 

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"
#setInternet2(TRUE)
download.file(fileUrl,destfile="./data/gdp.csv")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/edu.csv")
list.files("./data")

> gdp <- read.csv("./data/gdp.csv")
> edu <- read.csv("./data/edu.csv")

> head(gdp)
    X Gross.domestic.product.2012 X.1           X.2          X.3 X.4 X.5 X.6 X.7 X.8
1                                  NA                                 NA  NA  NA  NA
2                                  NA               (millions of      NA  NA  NA  NA
3                         Ranking  NA       Economy  US dollars)      NA  NA  NA  NA
4                                  NA                                 NA  NA  NA  NA
5 USA                           1  NA United States  16,244,600       NA  NA  NA  NA
6 CHN                           2  NA         China   8,227,103       NA  NA  NA  NA
> 

> head(edu)
  CountryCode                    Long.Name         Income.Group                     Region Lending.category Other.groups  Currency.Unit
1         ABW                        Aruba High income: nonOECD  Latin America & Caribbean                                Aruban florin
2         ADO      Principality of Andorra High income: nonOECD      Europe & Central Asia                                         Euro
3         AFG Islamic State of Afghanistan           Low income                 South Asia              IDA         HIPC Afghan afghani
4         AGO  People's Republic of Angola  Lower middle income         Sub-Saharan Africa              IDA              Angolan kwanza
5         ALB          Republic of Albania  Upper middle income      Europe & Central Asia             IBRD                Albanian lek
6         ARE         United Arab Emirates High income: nonOECD Middle East & North Africa                                U.A.E. dirham
 
> gdp <- read.csv("./data/gdp.csv",skip=4,stringsAsFactors=FALSE)
> str(gdp)
'data.frame':   326 obs. of  10 variables:
 $ X  : chr  "USA" "CHN" "JPN" "DEU" ...
 $ X.1: chr  "1" "2" "3" "4" ...
 $ X.2: logi  NA NA NA NA NA NA ...
 $ X.3: chr  "United States" "China" "Japan" "Germany" ...
 $ X.4: chr  " 16,244,600 " " 8,227,103 " " 5,959,718 " " 3,428,131 " ...
 $ X.5: chr  "" "" "" "" ...
 $ X.6: logi  NA NA NA NA NA NA ...
 $ X.7: logi  NA NA NA NA NA NA ...
 $ X.8: logi  NA NA NA NA NA NA ...
 $ X.9: logi  NA NA NA NA NA NA ...

> gdp2 <- gdp[gdp$X != "",]
> gdp3 <- cbind(1,gdp2)
> mergedData <- merge(x=gdp3,y=edu,by.x="X",by.y="CountryCode",all="TRUE")
> mergedData3 <- mergedData["1" == 1,c("1","X","X.1")]
> mergedData4 <- mergedData3[mergedData3$X.1 != "",]
> newrow <- as.numeric(mergedData4$X.1)
> m5 <- cbind(mergedData4,newrow)
> head(m5)
  1   X X.1 newrow
1 1 ABW 161    161
3 1 AFG 105    105
4 1 AGO  60     60
5 1 ALB 125    125
6 1 ARE  32     32
7 1 ARG  26     26

> m6 <- m5[is.na(m5$newrow)==FALSE,]

> tapply(m6$newrow,m6$Income.Group,FUN=mean)
                     High income: nonOECD    High income: OECD           Low income  Lower middle income 
                  NA             91.91304             32.96667            133.72973            107.70370 
 Upper middle income 
            92.13333 


> quantile(m6$newrow,probs=c(0.2,0.4,0.6,0.8,1.0))

  20%   40%   60%   80%  100% 
 38.8  76.6 114.4 152.2 190.0 


for ( i in 1:190) { print(m6$newrow[i]) ;
	if ( m6$newrow[i] <= 38.8 ) { m6$q[i] <- 1; print(1) }
	else if ( m6$newrow[i] <= 76.6 ) { m6$q[i] <- 2;print(2) }
	else if ( m6$newrow[i] <= 114.4 ) { m6$q[i] <- 3; print(3) }
	else if ( m6$newrow[i] <= 152.2 ) { m6$q[i] <- 4; print(4) }
	else if ( m6$newrow[i] > 152.2 ) { m6$q[i] <- 5;print(5) }

}

> table(m6$q,m6$Income.Group)
   
       High income: nonOECD High income: OECD Low income Lower middle income Upper middle income
  1  0                    4                18          0                   5                  11
  2  0                    5                10          1                  13                   9
  3  0                    8                 1          9                  12                   8
  4  0                    4                 1         16                   8                   8
  5  0                    2                 0         11                  16                   9
> 





