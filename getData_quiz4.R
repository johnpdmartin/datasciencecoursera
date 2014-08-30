#ques 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
setInternet2(TRUE)
download.file(fileUrl,destfile="./data/acs_6.csv")
list.files("./data")
acs <- read.csv("./data/acs_6.csv")
head(acs)


> strsplit(names(acs),"wgtp")[123]
[[1]]
[1] ""   "15"

#ques 2

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"
#setInternet2(TRUE)
download.file(fileUrl,destfile="./data/gdp.csv")
list.files("./data")
gdp <- read.csv("./data/gdp.csv")
head(gdp)

gdp <- read.csv("./data/gdp.csv",skip=3,stringsAsFactors = FALSE,col.names=c("countrycode","gdp_rank","V3","countryname","gdpvalue","V6","V7","V8","V9","V10"))

> gdp2 <- gdp[gdp$gdp_rank > 0 & gdp$countrycode != "",]
> length(gdp2$gdp_rank)
[1] 190

> gdp3 <- gsub(",","",gdp2$gdpvalue)
> head(gdp3)
[1] " 16244600 " " 8227103 "  " 5959718 "  " 3428131 "  " 2612878 "  " 2471784 " 

> mean(gdp3)
[1] NA
Warning message:
In mean.default(gdp3) : argument is not numeric or logical: returning NA
> gdp4 <- as.numeric(gdp3)
> mean(gdp4)
[1] 377652.4


fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv?accessType=DOWNLOAD"
#setInternet2(TRUE)
download.file(fileUrl2,destfile="./data/edu_2.csv")
list.files("./data")
edu2 <- read.csv("./data/edu_2.csv")
head(edu2)

gdp_edu <- merge(x=gdp2,y=edu2,by.x="countrycode",by.y="CountryCode")
head(gdp_edu)
> length(gdp_edu$gdp_rank)
[1] 189


> gdp_edu[grepl("Fiscal year end: June 30",gdp_edu$Special.Notes),]
    countrycode gdp_rank V3      countryname    gdpvalue V6 V7 V8 V9 V10                       Long.Name         Income.Group                     Region
9           AUS       12 NA        Australia  1,532,408     NA NA NA  NA       Commonwealth of Australia    High income: OECD        East Asia & Pacific
16          BGD       59 NA       Bangladesh    116,355     NA NA NA  NA People's Republic of Bangladesh           Low income                 South Asia
29          BWA      117 NA         Botswana     14,504     NA NA NA  NA            Republic of Botswana  Upper middle income         Sub-Saharan Africa
51          EGY       38 NA Egypt, Arab Rep.    262,832     NA NA NA  NA          Arab Republic of Egypt  Lower middle income Middle East & North Africa
65          GMB      175 NA      Gambia, The        917     NA NA NA  NA          Republic of The Gambia           Low income         Sub-Saharan Africa
89          KEN       87 NA            Kenya     40,697     NA NA NA  NA               Republic of Kenya           Low income         Sub-Saharan Africa
96          KWT       56 NA           Kuwait    160,913     NA NA NA  NA                 State of Kuwait High income: nonOECD Middle East & North Africa
133         PAK       44 NA         Pakistan    225,143     NA NA NA  NA    Islamic Republic of Pakistan  Lower middle income                 South Asia
140         PRI       61 NA      Puerto Rico    101,496     NA NA NA  NA                     Puerto Rico High income: nonOECD  Latin America & Caribbean
152         SLE      157 NA     Sierra Leone      3,796     NA NA NA  NA        Republic of Sierra Leone           Low income         Sub-Saharan Africa
159         SWE       21 NA           Sweden    523,806     NA NA NA  NA               Kingdom of Sweden    High income: OECD      Europe & Central Asia
175         UGA      106 NA           Uganda     19,881     NA NA NA  NA              Republic of Uganda           Low income         Sub-Saharan Africa
189         ZWE      134 NA         Zimbabwe      9,802     NA NA NA  NA            Republic of Zimbabwe           Low income         Sub-Saharan Africa
    Lending.category Other.groups        Currency.Unit Latest.population.census Latest.household.survey
9                                    Australian dollar                     2006                        
16               IDA                  Bangladeshi taka                     2001               DHS, 2007
29              IBRD                     Botswana pula                     2001              MICS, 2000
51              IBRD                    Egyptian pound                     2006               DHS, 2008
65               IDA         HIPC       Gambian dalasi                     2003           MICS, 2005/06
89               IDA                   Kenyan shilling                     1999    DHS, 2003, SPA, 2004
96                                       Kuwaiti dinar                     2005               FHS, 1996
133            Blend                   Pakistani rupee                     1998            DHS, 2006/07
140                                        U.S. dollar                     2000            RHS, 1995/96
152              IDA         HIPC Sierra Leonean leone                     2004                DHS 2008
159                                      Swedish krona           Register based                        
175              IDA         HIPC     Ugandan shilling                     2002    DHS, 2006, SPA, 2007
189            Blend                   Zimbabwe dollar                     2002            DHS, 2005/06
                                                                 Special.Notes National.accounts.base.year National.accounts.reference.year
9   Fiscal year end: June 30; reporting period for national accounts data: FY.                                                         2007
16  Fiscal year end: June 30; reporting period for national accounts data: FY.                   1995/1996                               NA
29  Fiscal year end: June 30; reporting period for national accounts data: FY.                   1993/1994                               NA
51  Fiscal year end: June 30; reporting period for national accounts data: FY.                   1991/1992                               NA
65  Fiscal year end: June 30; reporting period for national accounts data: CY.                        1987                               NA
89  Fiscal year end: June 30; reporting period for national accounts data: CY.                        2001                               NA
96  Fiscal year end: June 30; reporting period for national accounts data: CY.                        1995                               NA
133 Fiscal year end: June 30; reporting period for national accounts data: FY.                   1999/2000                               NA
140 Fiscal year end: June 30; reporting period for national accounts data: FY.                        1954                               NA
152 Fiscal year end: June 30; reporting period for national accounts data: CY.                        1990                               NA
159 Fiscal year end: June 30; reporting period for national accounts data: CY.                                                         2000
175 Fiscal year end: June 30; reporting period for national accounts data: FY.                   2001/2002                               NA
189 Fiscal year end: June 30; reporting period for national accounts data: CY.                        1990                               NA
    System.of.National.Accounts SNA.price.valuation Alternative.conversion.factor PPP.survey.year Balance.of.Payments.Manual.in.use External.debt.Reporting.status
9                          1993                 VAB                                          2005                              BPM5                               
16                         1993                 VAB                                          2005                              BPM5                    Preliminary
29                         1993                 VAB                                          2005                              BPM5                    Preliminary
51                           NA                 VAB                                          2005                              BPM5                         Actual
65                           NA                 VAB                                          2005                              BPM5                       Estimate
89                         1993                 VAB                                          2005                              BPM5                         Actual
96                           NA                 VAP                                          2005                              BPM5                               
133                        1993                 VAB                                          2005                              BPM5                         Actual
140                          NA                 VAP                                            NA                                                                 
152                        1993                 VAB                                          2005                              BPM5                    Preliminary
159                          NA                 VAB                                          2005                              BPM5                               
175                          NA                 VAB                                          2005                              BPM5                         Actual
189                          NA                 VAB                    1991, 1998            2005                              BPM5                         Actual
    System.of.trade Government.Accounting.concept IMF.data.dissemination.standard Source.of.most.recent.Income.and.expenditure.data Vital.registration.complete
9           General                  Consolidated                            SDDS                                       ES/BS, 1994                         Yes
16          General                  Consolidated                            GDDS                                         IHS, 2005                            
29          General                     Budgetary                            GDDS                                    ES/BS, 1993/94                            
51          Special                     Budgetary                            SDDS                                    ES/BS, 2004-05                         Yes
65          General                  Consolidated                            GDDS                                         IHS, 2003                            
89          General                     Budgetary                            GDDS                                      IHS, 2005-06                            
96          Special                  Consolidated                            GDDS                                                                           Yes
133         General                  Consolidated                            GDDS                                     LSMS, 2004/05                            
140         General                                                                                                                                         Yes
152         Special                     Budgetary                            GDDS                                         IHS, 2003                            
159         General                  Consolidated                            SDDS                                          IS, 2000                         Yes
175         General                     Budgetary                            GDDS                                          PS, 2005                            
189         General                  Consolidated                            GDDS                                                                              
    Latest.agricultural.census Latest.industrial.data Latest.trade.data Latest.water.withdrawal.data X2.alpha.code WB.2.code       Table.Name   Short.Name
9                         2001                   2004              2008                         2000            AU        AU        Australia    Australia
16                        2005                   1997              2007                         2000            BD        BD       Bangladesh   Bangladesh
29                        1993                   2005              2008                         2000            BW        BW         Botswana     Botswana
51                   1999-2000                   2001              2008                         2000            EG        EG Egypt, Arab Rep.        Egypt
65                   2001-2002                     NA              2008                         2000            GM        GM      Gambia, The   The Gambia
89                   1977-1979                   2005              2008                         2003            KE        KE            Kenya        Kenya
96                        1970                     NA              2007                         2002            KW        KW           Kuwait       Kuwait
133                       2000                     NA              2008                         2000            PK        PK         Pakistan     Pakistan
140                  1997/2002                     NA                NA                           NA            PR        PR      Puerto Rico  Puerto Rico
152                  1984-1985                     NA              2002                         2000            SL        SL     Sierra Leone Sierra Leone
159                  1999-2000                   2004              2008                         2000            SE        SE           Sweden       Sweden
175                       1991                   2001              2008                           NA            UG        UG           Uganda       Uganda
189                       1960                   1995              2008                         2002            ZW        ZW         Zimbabwe     Zimbabwe
>


install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

> install.packages("quantmod")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependencies ‘Defaults’, ‘xts’, ‘zoo’, ‘TTR’

trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/Defaults_1.1-1.zip'
Content type 'application/zip' length 128358 bytes (125 Kb)
opened URL
downloaded 125 Kb

trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/xts_0.9-7.zip'
Content type 'application/zip' length 661613 bytes (646 Kb)
opened URL
downloaded 646 Kb

trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/zoo_1.7-11.zip'
Content type 'application/zip' length 878510 bytes (857 Kb)
opened URL
downloaded 857 Kb

trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/TTR_0.22-0.zip'
Content type 'application/zip' length 282355 bytes (275 Kb)
opened URL
downloaded 275 Kb

trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/quantmod_0.4-0.zip'
Content type 'application/zip' length 444379 bytes (433 Kb)
opened URL
downloaded 433 Kb

package ‘Defaults’ successfully unpacked and MD5 sums checked
Warning: unable to move temporary installation ‘C:\Users\John\Documents\R\win-library\3.1\file1a60c48ba541d\Defaults’ to ‘C:\Users\John\Documents\R\win-library\3.1\Defaults’
package ‘xts’ successfully unpacked and MD5 sums checked
package ‘zoo’ successfully unpacked and MD5 sums checked
package ‘TTR’ successfully unpacked and MD5 sums checked
package ‘quantmod’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\John\AppData\Local\Temp\RtmpsZAJj4\downloaded_packages


> library(quantmod)
Loading required package: Defaults
Error: package ‘Defaults’ could not be loaded
In addition: Warning message:
In library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc) :
  there is no package called ‘Defaults’

> install.packages("Defaults")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/Defaults_1.1-1.zip'
Content type 'application/zip' length 128358 bytes (125 Kb)
opened URL
downloaded 125 Kb

package ‘Defaults’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\John\AppData\Local\Temp\RtmpsZAJj4\downloaded_packages

> library(quantmod)
Loading required package: Defaults
Loading required package: xts
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Loading required package: TTR
Version 0.4-0 included new data defaults. See ?getSymbols.
> amzn = getSymbols("AMZN",auto.assign=FALSE)
    As of 0.4-0, ‘getSymbols’ uses env=parent.frame() and
 auto.assign=TRUE by default.

 This  behavior  will be  phased out in 0.5-0  when the call  will
 default to use auto.assign=FALSE. getOption("getSymbols.env") and 
 getOptions("getSymbols.auto.assign") are now checked for alternate defaults

 This message is shown once per session and may be disabled by setting 
 options("getSymbols.warning4.0"=FALSE). See ?getSymbol for more details
Warning message:
In download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=", from.m,  :
  downloaded length 100878 != reported length 200
> sampleTimes = index(amzn)

> head(sampleTimes)
[1] "2007-01-03" "2007-01-04" "2007-01-05" "2007-01-08" "2007-01-09"
[6] "2007-01-10"
> s2 <- as.Date(sampleTimes,"%Y-%m-%d")
> s3 <- cbind(s2,weekdays(s2),as.numeric(format(s2,"%Y"))
+ )
> head(s3)
     s2                        
[1,] "13516" "Wednesday" "2007"
[2,] "13517" "Thursday"  "2007"
[3,] "13518" "Friday"    "2007"
[4,] "13521" "Monday"    "2007"
[5,] "13522" "Tuesday"   "2007"
[6,] "13523" "Wednesday" "2007"

> names(s3)
NULL
> table(s3[,2],s3[,3])
           
            2007 2008 2009 2010 2011 2012 2013 2014
  Friday      51   50   49   50   51   51   51   32
  Monday      48   48   48   47   46   47   48   31
  Thursday    51   50   51   51   51   51   50   35
  Tuesday     50   52   52   52   52   50   52   34
  Wednesday   51   53   52   52   52   51   51   34
> table(s3[,3])

2007 2008 2009 2010 2011 2012 2013 2014 
 251  253  252  252  252  250  252  166 
> 


