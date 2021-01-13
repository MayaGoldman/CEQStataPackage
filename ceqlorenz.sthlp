{smcl}
{* 19aug2016}{...}
{cmd:help ceqlorenz} (beta version; please report bugs) {right:Sean Higgins}
{hline}

{title:Title}

{p 4 11 2}
{hi:ceqlorenz} {hline 2} Computes anonymous summary statistics and detailed information for the CEQ core income concepts by income decile, group, centile, and bin for sheet "E3. Lorenz" of the CEQ Master Workbook 2016 Section E

{pstd}
{ul:Caution:} The construction of the CEQ income concepts Market Income, Market Income plus Pensions, Net Market Income, Gross Income, and Taxable Income will differ depending on which scenario for the public contributory pension system has been chosen. In the public contributory Pensions as Deferred Income (PDI) scenario, pension system income is treated as (Market) income earned previously deferred until today; while pension system contributions are treated as mandatory savings (income deferred to one’s future self).  In contrast, the contributory Pensions as Government Transfer(PGT) scenario, pension system income is treated as a pure transfer (from the fisc), while pension system contributions are treated as a tax. In the PDI scenario pensions are prefiscal income while in the PGT scenario the public contributory pension system is a fiscal tax and transfer system that redistributes income from today’s working-age population to today’s pension-age population.  When the user wishes to analyze both PDI and PGT scenarios, this command must be run twice: once for outputting information generated under the PDI scenario to a Masterworkbook (section E); and again for outputting information generated under the PGT scenario to its own Masterworkbook (section E).  See also the Income concepts options section below for more detail.


{title:Syntax}

{p 8 11 2}
    {cmd:ceqlorenz} {ifin} {weight} [{cmd:using} {it:filename}] [{cmd:,} {it:options}]{break}

{synoptset 29 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Income concepts}
{synopt :{opth m:arket(varname)}}Market income{p_end}
{synopt :{opth mp:luspensions(varname)}}Market income plus pensions{p_end}
{synopt :{opth n:etmarket(varname)}}Net market income{p_end}
{synopt :{opth g:ross(varname)}}Gross income{p_end}
{synopt :{opth t:axable(varname)}}Taxable income{p_end}
{synopt :{opth d:isposable(varname)}}Disposable income{p_end}
{synopt :{opth c:onsumable(varname)}}Consumable income{p_end}
{synopt :{opth f:inal(varname)}}Final income{p_end}

{syntab:PPP conversion}
{synopt :{opth ppp(real)}}PPP conversion factor (LCU per international $, consumption-based) from year of PPP (e.g., 2005 or 2011) to year of PPP; do not use PPP factor for year of household survey{p_end}
{synopt :{opth cpib:ase(real)}}CPI of base year (i.e., year of PPP, usually 2005 or 2011){p_end}
{synopt :{opth cpis:urvey(real)}}CPI of year of household survey{p_end}
{synopt :{opt da:ily}}Indicates that variables are in daily currency{p_end}
{synopt :{opt mo:nthly}}Indicates that variables are in monthly currency{p_end}
{synopt :{opt year:ly}}Indicates that variables are in yearly currency (the default){p_end}

{pstd}
Note that the default PPP conversion factors, default poverty lines and default income cutoffs are related. See Poverty Lines options and Income group cut-offs options for a more detailed explanation.

{syntab:Survey information}
{synopt :{opth hs:ize(varname)}}Number of members in the household
    (should be used when each observation in the data set is a household){p_end}
{synopt :{opth hh:id(varname)}}Unique household identifier variable
    (should be used when each observation in the data set is an individual){p_end}
{synopt :{opth psu(varname)}}Primary sampling unit; can also be set using {help svyset:svyset}{p_end}
{synopt :{opth s:trata(varname)}}Strata (used with complex sampling desings); can also be set using {help svyet:svyset}{p_end}

{syntab:Poverty lines}
{synopt :{opth pl1(real)}}Lowest poverty line in $ PPP (default is $1.90 PPP per day){p_end}
{synopt :{opth pl2(real)}}Second lowest poverty line in $ PPP (default is $3.20 PPP per day){p_end}
{synopt :{opth pl3(real)}}Third lowest poverty line in $ PPP (default is $5.50 PPP per day){p_end}
{synopt :{opth nationale:xtremepl(string)}}National extreme poverty line in same units as income variables (can be a scalar or {varname}){p_end}
{synopt :{opth nationalm:oderatepl(string)}}National moderate poverty line in same units as income variables (can be a scalar or {varname}){p_end}
{synopt :{opth othere:xtremepl(string)}}Other extreme poverty line in same units as income variables (can be a scalar or {varname}){p_end}
{synopt :{opth otherm:oderatepl(string)}}Other moderate poverty line in same units as income variables (can be a scalar or {varname}){p_end}
{synopt :{opth prop:ortion(real)}}Relative poverty line as a proportion of median household income from 0 to 1 (default is 0.5){p_end}
   
{syntab:Income group cut-offs}
{synopt :{opth cut1(real)}}Upper bound (exclusive) income for ultra-poor; default is $1.90 PPP per day{p_end}
{synopt :{opth cut2(real)}}Upper bound (exclusive) income for extreme poor; default is $3.20 PPP per day{p_end}
{synopt :{opth cut3(real)}}Upper bound (exclusive) income for moderate poor; default is $5.50 PPP per day{p_end}
{synopt :{opth cut4(real)}}Upper bound (exclusive) income for vulnerable; default is $11.50 PPP per day{p_end}
{synopt :{opth cut5(real)}}Upper bound (exclusive) income for middle class; default is $57.60 PPP per day{p_end}
   
{syntab:Produce subset of results}
{synopt :{opt nod:ecile}}Do not produce results by decile{p_end}
{synopt :{opt nog:roup}}Do not produce results by income group{p_end}
{synopt :{opt noc:entile}}Do not produce results by centile{p_end}
{synopt :{opt nob:in}}Do not produce results by bin{p_end}

{syntab:Ignore missing values}
{synopt :{opt ignorem:issing}}Ignore any missing values of income concepts and fiscal interventions{p_end}
   
{syntab:Export directly to CEQ Master Workbook (requires Stata 13 or newer)}
{synopt :{opth coun:try(string)}}Country{p_end}
{synopt :{opth surv:eyyear(string)}}Year of survey{p_end}
{synopt :{opth auth:ors(string)}}Authors of study{p_end}
{synopt :{opth base:year(real)}}Base year of PPP conversion (e.g., 2005, 2011){p_end}
{synopt :{opth scen:ario(string)}}Scenario{p_end}
{synopt :{opth grou:p(string)}}Group{p_end}
{synopt :{opth proj:ect(string)}}Project{p_end}
{synopt :{opth sheet(string)}}Name of sheet to write population matrices. Default is "E3. Lorenz"{p_end}
{synopt :{opt open}}Automatically open CEQ Master Workbook with new results added{p_end}
{synoptline}
{p 4 6 2}
{cmd:pweight} allowed; see {help weights}. Alternatively, weights can be specified using {help svyset}.

{title:Required commands}

{pstd}
{cmd:ceqlorenz} requires installation of {cmd:quantiles} (Osorio, 2007) and {cmd:sgini} (Van Kerm, 2009). To install, {stata ssc install quantiles:ssc install quantiles} and {stata "net install sgini, from(http://medim.ceps.lu/stata)"}.

{title:Description}

{pstd}
{cmd:ceqlorenz} calculates anonymous summary statistics and detailed information by income decile, group, centile, and bin for each of the CEQ core
income concepts. Summary statistics include the mean, median, standard deviation, Gini, absolute Gini, S-Gini with a variety of parameters, Theil,
90/10, and headcount index, poverty gap, and squared poverty gap for a number of poverty lines. The detailed information by income decile, group,
centile, and bin includes total income in local currency units (preferably per year) and PPP dollars per day, per capita income in local
currency (preferably per year) and PPP dollars per day, shares of total income, cumulative shares of total income, and fiscal incidence with respect
to (i.e., income relative to) market income, market income + pensions, net market income, gross income, and disposable income.

{pstd}
This sheet differs from the Concentration sheets because in this sheet, households are ranked by the same
CEQ core income concept as the column. In other words, the results are anonymous: we redefine
deciles, groups, centiles, and bins in each column; their composition can change due to reranking. The CEQ
core income concepts include market income, market income plus pensions, net market income, gross income,
taxable income, disposable income, consumable income, and final income. The variables for these income
concepts, which should be expressed in local currency units (preferably {bf:per year} for ease of comparison
with totals from national accounts), are indicated using the {opth m:arket(varname)}, {opth mp:luspensions(varname)},
{opth n:etmarket(varname)}, {opth g:ross(varname)}, {opth t:axable(varname)}, {opth d:isposable(varname)},
{opth c:onsumable(varname)}, {opth c:onsumable(varname)}, and {opth f:inal(varname)} options.

{pstd}
{cmd: ceqlorenz} automatically converts local currency variables to PPP dollars, using the PPP conversion
factor given by {opth ppp(real)}, the consumer price index (CPI) of the year of PPP (e.g., 2005 or
2011) given by {opth cpib:ase(real)}, and the CPI of the year of the household
survey used in the analysis given by {opth cpis:urvey(real)}. The year of PPP, also called base year,
refers to the year of the International Comparison Program (ICP) that is being used, e.g. 2005 or 2011.
The survey year refers to the year of the household survey used in the analysis. If the year of PPP is
2005, the PPP conversion factor should be the "2005 PPP conversion factor, private consumption (LCU per
international $)" indicator from the World Bank's World Development Indicators (WDI). If the year of
PPP is 2011, use the "PPP conversion factor, private consumption (LCU per international $)" indicator
from WDI. The PPP conversion factor should convert from year of PPP to year of PPP. In other words,
when extracting the PPP conversion factor, it is possible to select any year; DO NOT select the year of
the survey, but rather the year that the ICP was conducted to compute PPP conversion factors (e.g.,
2005 or 2011). The base year (i.e., year of PPP) CPI, which can also be obtained from WDI, should match
the base year chosen for the PPP conversion factor. The survey year CPI should match the year of the
household survey. Finally, for the PPP conversion, the user can specify whether the original variables
are in local currency units per day ({opt da:ily}), per month ({opt mo:nthly}), or per year
({opt year:ly}, the default assumption).

{pstd}
If the data set is at the individual level (each observation is an individual), the
variable with the identification code of each household (i.e., it takes the same
value for all members within a household) should be specified in the
{opth hh:id(varname)} option; the {opth hs:ize(varname)} option should not be
specified. If the data set is at the household level, the number of members in the
household should be specified in {opth hs:ize(varname)}; the {opth hh:id(varname)}
option should not be specified. In either case, the weight used should be the
household sampling weight and should {it:not} be multiplied by the number of members
in the household since the program will do this multiplication automatically in the
case of household-level data.

{pstd}
There are two options for including information about weights and survey sample design for accurate
estimates and statistical inference. The sampling weight can be entered using
{weight} or {help svyset}. Information about complex stratified sample designs can also be entered
using {help svyset} since {cmd:ceqlorenz} automatically uses the information specified using
{help svyset}. Alternatively, the primary sampling unit can be entered using the {opth psu(varname)}
option and strata can be entered using the {opth s:trata(varname)} option.

{pstd}
By default, {cmd: ceqlorenz} does not allow income concept or fiscal intervention variables to have missing
values: if a household has 0 income for an income concept, receives 0 from a transfer or a subsidy,
or pays 0 of a tax, the household should have 0 rather than a missing value. If one of these variables has
missing values, the command will produce an error. For flexibility, however, the command includes an
{opt ignorem:issing} option that will drop observations with missing values for any of these variables, thus
allowing the command to run even if there are missing values.

{pstd}
Negative incomes are allowed, but a warning is issued for each core income concept that
has negative values (or positive values when a fiscal intervention is stored as negative values). This is because
various measures are no longer well-behaved when negative values are included (for example, the Gini coefficient,
concentration coefficient, or squared poverty gap can exceed 1, and other desirable properties of these measures
when incomes are non-negative no longer hold when negative values are allowed).

{marker opt}
{title:Options}

{marker cor}
{dlgtab:Core options}

{phang}
{opt using} is required, and indicates the filename for the output. Results are automatically exported to the CEQ Master Workbook if {cmd:using} {it:filename} is specifed in the command, where {it:filename} is the Master Workbook. By default, {cmd:ceqlorenz} prints to a sheet titled "E3. Lorenz"; the user can override the sheet name using the {opt sheet(string)} option. Exporting directly to the Master Workbook requires Stata 13 or newer. The Master Workbook populated with results from {cmd:ceqlorenz} can be automatically opened if the {opt open} option is specified (in this case, {it:filename} cannot have spaces). Results are also saved in matrices available from {cmd:return list}. To produce only a portion of the results, specify only a subset of the income concept options or use {opt nod:ecile}, {opt nog:roup}, {opt noc:entile}, or {opt nob:in}.


{p 8 8 2}
Notice that if the user wishes to do the CEQ {it} Assessment {sf} for both the {bf: "pensions as deferred income scenario"} and
{bf: "pensions as government transfer scenario"}, the ado does {bf: NOT} run both scenarios automatically. The user must run the
ado twice, one time per scenario (see Income concepts options for an explanation on the differences across
scenarios), and create two separate sets of E sheets. Hence, {it:filename} should be changed accordingly.


{marker inc}
{dlgtab:Income concepts options}

{pstd}
The CEQ core income concepts include market income, market income plus pensions, net market income, gross income,
taxable income, disposable income, consumable income, and final income. The variables for these income
concepts, which should be expressed in local currency units (preferably {bf:per year} for ease of comparison
with totals from national accounts), are indicated using the {opth m:arket(varname)}, {opth mp:luspensions(varname)},
{opth n:etmarket(varname)}, {opth g:ross(varname)}, {opth t:axable(varname)}, {opth d:isposable(varname)},
{opth c:onsumable(varname)}, and {opth f:inal(varname)} options.

{pstd}
The public contributory old-age pension system can be incorporated into a CEQ Assessment as deferred income or as a government transfer (for a detailed discussion regarding
the alternatives see Lustig (2018) available at {browse "http://commitmentoequity.org/publications-ceq-handbook"}). The decision regarding the public contributory pension system can have a significant impact on assessing the redistributive power of a fiscal system, especially in countries with a high proportion of retirees and large spending on social security. The construction of Market income, Market income plus pensions, Gross income, Net market income, and Taxable Income will differ between the PDI and PGT scenarios (while Disposable income, Consumable income and Final income are equivalent in value in both scenarios). The user must create two separate sets of E sheets, one per scenario (for a more detailed
explanation see {cmd: using} in {help ceqlorenz##cor:core options}).

{pstd}
In CEQ {it} Assessments {sf} in the {bf: "pensions as deferred income scenario"}, it is assumed that contributions
during working years are a form of “forced saving” and income concepts are defined in the following way:

{p 16 16 10}
Market income given by {opth m:arket(varname)} as factor income (wages and salaries and income from capital) plus private transfers
 (remittances, private pensions, etc.) {bf: PLUS} imputed rent and own production {bf: MINUS} contributions to social insurance old-age pensions.

{p 16 16 10}
Market income plus pensions given by {opth mp:luspensions(varname)} as Market income (PDI) {bf: PLUS} contributory social
 insurance old-age pensions. Prefiscal income (PDI) is defined as Market income plus Pensions (PDI).

{p 16 16 10}
Gross Income given by {opth g:ross(varname)} as Market Income plus pensions (PDI) {bf: PLUS} direct cash and near cash
transfers (conditional and unconditional cash transfers, school feeding programs, free food transfers, etc.).

{p 16 16 10}
Net Market Income given by {opth n:etmarket(varname)} as Market Income plus pensions (PDI) {bf: MINUS} direct taxes
and {bf: MINUS} non-pension social contributions.

{p 16 16 10}
Taxable income given by {opth t:axable(varname)} as Gross Income (PDI) MINUS all non-taxable Gross Income components.

{p 16 16 10}
Disposable income given by {opth d:isposable(varname)} as Market Income plus pensions (PDI) {bf: PLUS} all direct transfers
 {bf: MINUS} all direct taxes and non-pension social contributions.


{pstd}
In the {bf: "pensions as government transfer scenario"}, it is assumed that pensions are a pure government transfers and income concepts are defined in the following way:

{p 16 16 10}
Market income given by {opth m:arket(varname)} as factor income (wages and salaries and income from capital) plus private transfers
 (remittances, private pensions, etc.)  {bf: PLUS} imputed rent and own production. Prefiscal income (PGT) is defined as Market income (PGT).

{p 16 16 10}
Market income plus pensions given by {opth mp:luspensions(varname)} as Market income (PGT) {bf: PLUS} contributory social insurance old-age pensions.

{p 16 16 10}
Gross Income given by {opth g:ross(varname)} as Market Income plus pensions (PGT) {bf: PLUS} direct cash and near cash transfers (conditional and
 unconditional cash transfers, school feeding programs, free food transfers, etc.).

{p 16 16 10}
Net Market Income given by {opth n:etmarket(varname)} as Market Income (PGT) {bf: MINUS} direct taxes and {bf: MINUS}  non-pension
social contributions.

{p 16 16 10}
Taxable income given by {opth t:axable(varname)} as Gross Income (PGT) MINUS all non-taxable Gross Income components.

{p 16 16 10}
Disposable income given by {opth d:isposable(varname)} as Market Income (PGT) {bf: MINUS}  all direct taxes {bf: PLUS} pension income {bf: PLUS}
 all other direct transfers {bf: MINUS} all pension and non-pension social contributions.


{pstd}
The construction of Consumable and Final income is done in the same way in both the PDI and PGT scenarios:

{p 16 16 10}
Consumable income given by {opth c:onsumable(varname)} as Disposable Income {bf: PLUS} indirect subsidies (energy, food and other general
 or targeted price subsidies) and {bf: MINUS} indirect taxes (VAT, excise taxes, and other indirect taxes).

{p 16 16 10}
Final income given by {opth f:inal(varname)} as Consumable income {bf: PLUS} Monetized value of in-kind transfers in education and health
 services at average government cost and {bf: MINUS} co-payments and user fees.


{marker pov}
{dlgtab: Poverty lines options}

{pstd}
Poverty lines in PPP dollars per day can be set using the {opth pl1(real)}, {opth pl2(real)}, and {opth pl3(real)} options. The default poverty
lines $1.90, $3.20 and $5.50 correspond to the income-category-specific poverty lines suggested in Joliffe & Prydz (2016), who determined the
median (to the nearest 10 cents) national poverty line in $PPP (using the 2011 ICP PPP conversion factors) for each set of countries grouped
under the World Bank's income classification system. Specifically, there are three income class-specific poverty lines: US$1.90 a day for low
income countries, US$3.20 a day for lower middle- income countries and US$5.50 a day for upper middle-income countries. Thus, in the context of
middle-income countries, we call those living on less than US$1.90 PPP per day the “ultra-poor.” The US$3.20 and US$5.50 PPP per day poverty lines
 are commonly used as extreme and moderate poverty lines for Latin America and roughly correspond to the median official extreme and moderate
poverty lines in those countries. The user may specify any poverty line values. For example, to change the lowest poverty line from $1.90 PPP per
day to $1.25 PPP per day, specify {cmd:pl1(1.25)}.

{pstd}
Poverty lines in local currency can be entered using the {opth nationale:xtremepl(string)},
{opth nationalm:oderatepl(string)}, {opth othere:xtremepl(string)}, {opth otherm:oderatepl(string)} options. Local currency poverty lines can
be entered as real numbers (for poverty lines that are fixed for the entire population) or variable names (for poverty lines that vary, for
example across space), and should be in the same units as the income concept variables (preferably local currency units per year). The relative
poverty line can be specfied as a proportion of median household income using {opth proportion(real)}, where {it:real} should be a proportion
between 0 and 1. The default proportion is 0.5, i.e. 50% of household median income. For example, to change the relative poverty line from 50% to
60% of median income (which is used by the OECD), specify {cmd:proportion(0.6)}.


{marker cut}
{dlgtab:Income group cut-offs options}

{pstd}
{opth cut1(real)} to {opth cut5(real)} are in $PPP. The default cut-off values of $1.90, $3.20 and $5.50 correspond to the income-category-specific poverty lines suggested in Joliffe & Prydz (2016), who determined the median (to the nearest 10 cents) national poverty line in $PPP (using the 2011 ICP PPP conversion factors) for each set of countries grouped under the World Bank's income classification system. Specifically, there are three income class-specific poverty lines: US$1.90 a day for low income countries, US$3.20 a day for lower middle- income countries and US$5.50 a day for upper middle-income countries. Thus, in the context of middle-income countries, we call those living on less than US$1.90 PPP per day the “ultra-poor.” The US$3.20 and US$5.50 PPP per day poverty lines are commonly used as extreme and moderate poverty lines for Latin America and roughly correspond to the median official extreme and moderate poverty lines in those countries.

{pstd}
The $11.50 and $57.60 cutoffs correspond to cutoffs for the vulnerable and middle-class populations suggested for the 2005-era PPP conversion factors by Lopez-Calva and Ortiz-Juarez (2014); $11.50 and $57.60 represent a United States CPI-inflation adjustment of the 2005-era $10 and $50 cutoffs.  The US$10 PPP per day line is the upper bound of those vulnerable to falling into poverty (and thus the lower bound of the middle class) in three Latin American countries, calculated by Lopez-Calva and Ortiz-Juarez (2014). Ferreira and others (2013) find that an income of around US$10 PPP also represents the income at which individuals in various Latin American countries tend to self-identify as belonging to the middle class and consider this a further justification for using it as the lower bound of the middle class. The US$10 PPP per day line was also used as the lower bound of the middle class in Latin America in Birdsall (2010) and in developing countries in all regions of the world in Kharas (2010). The US$50 PPP per day line is the upper bound of the middle class proposed by Ferreira and others (2013).

{pstd}
The user may specify any set of cut points that create exclusive population groups.  For example, the older cut points for the ultra-poor, extreme poor, moderate poor, vulnerable and middle class, which corresponded to the 2005-era PPP conversion factors were $1.25, $2.50, $4, $10 and $50 (respectively).



{title:Examples}

{pstd}Locals for PPP conversion (obtained from WDI through the {cmd: wbopendata} command){p_end}
{phang} {cmd:. local ppp = 1.5713184 // 2005 Brazilian reais per 2005 $ PPP}{p_end}
{phang} {cmd:. local cpi = 95.203354 // CPI for Brazil for 2009}{p_end}
{phang} {cmd:. local cpi05 = 79.560051 // CPI for Brazil for 2005}{p_end}

{pstd}Local currency poverty lines{p_end}
{phang} {cmd:. local pl70 = 70*12 // 70 reais/month to yearly}{p_end}
{phang} {cmd:. local pl140 = 140*12 // 140 reais/month to yearly}{p_end}

{pstd}Individual-level data (each observation is an individual){p_end}
{phang} {cmd:. ceqlorenz [pw=w] using C:/Output_Tables.xlsx, ///}{p_end}
{phang} {cmd:> hhid(hh_code) psu(psu_var) strata(stra_var) m(ym) mplusp(ymplusp) n(yn) g(yg) t(yt) d(yd) c(yc) f(yf) ppp(`ppp') cpibase(`cpi05') cpisurvey(`cpi') prop(0.6) nationale(PLipea_ext) nationalm(PLipea)    othere(`pl70') otherm(`pl140') open}{p_end}

{pstd}Household-level data (each observation is a household){p_end}
{phang} {cmd:. ceqlorenz [pw=w] using C:/Output_Tables.xlsx, hsize(members) psu(psu_var) strata(stra_var) m(ym) mp(ymplusp) n(yn) g(yg) t(yt) d(yd) c(yc) f(yf) ppp(`ppp') cpibase(`cpi05') cpisurvey(`cpi') prop(0.6) nationale(PLipea_ext) nationalm(PLipea)    othere(`pl70') otherm(`pl140') open}{p_end}

{title:Saved results}

Pending

{title:Author}

{p 4 4 2}Sean Higgins, CEQ Institute, sean.higgins@ceqinstitute.org


{title:References}

{pstd}Commitment to Equity (CEQ) {browse "http://www.commitmentoequity.org":website}.{p_end}

{phang}
Lustig, N. and S. Higgins. 2013. "Commitment to Equity Assessment (CEQ): Estimating the Incidence of Social Spending, Subsidies and Taxes Handbook." {browse "http://www.commitmentoequity.org/publications_files/Methodology/CEQWPNo1%20Handbook%20Edition%20Sept%202013.pdf":CEQ Working Paper 1.}{p_end}

{phang}
Osorio, R. 2007. "{bf:quantiles}: Stata module to categorize by quantiles." Boston
College Department of Economics Statistical Software Components S456856.{p_end}

{phang}
Van Kerm, P. 2009. "{bf:sgini}: Generalized Gini and concentration coefficients (with factor decomposition) in Stata." {browse "http://medim.ceps.lu/stata/sgini.pdf":medim.ceps.lu/stata/sgini.pdf}.{p_end}

