# Creating Effective Display Tables with the gt Package

**Author:** Richard Iannone

**Generated:** 2026-02-04

---

This document combines all chapters of the gt book into a single reference.
For the interactive version with rendered tables, visit the online book.

---


## Welcome {.unnumbered}

Welcome to "Creating Effective Display Tables with the **gt** Package", your comprehensive guide to building professional, publication-ready tables in R. This book is designed to take you from basic table creation to advanced customization techniques using the **gt** package, one of the most powerful and flexible table-making tools in the R ecosystem.

Data presentation is often the final, crucial step in any analysis. While R is excellent at data manipulation and statistical modeling, transforming results into clear, compelling tables has historically been challenging. The **gt** package addresses this by providing an intuitive, layered approach to table construction that emphasizes both functionality and design. With **gt**, you can build tables systematically, adding components and styling incrementally to achieve precisely the presentation you need.

In this book, you'll master the art and science of table design. You'll learn how to structure data effectively for tabular presentation, apply consistent formatting that enhances readability, and create visual hierarchies that guide readers through complex information. Whether you're preparing tables for academic publications, business reports, web dashboards, or presentations, this book will give you the skills to create tables that not only display data accurately but also communicate insights effectively.

## What you'll learn

This book covers the complete **gt** workflow, from fundamental concepts to advanced customization:

- understanding the anatomy of tables and how **gt**'s component-based approach lets you build complex layouts systematically
- transforming raw values into reader-friendly formats with proper number formatting, date/time presentation, and currency display
- applying colors, fonts, borders, and spacing to create tables that are both functional and aesthetically pleasing  
- adding footnotes, source notes, and conditional formatting that provide additional context without cluttering
- incorporating sparklines and small multiples, creating summary statistics, and building custom themes
- tailoring tables for different formats (HTML, PDF, Word, etc.) and understanding how design choices affect readability across contexts
- learning when and how to use different table features to maximize clarity and minimize cognitive load for readers

Throughout the book, you'll work with real datasets and practical examples that demonstrate not just how to use **gt** functions, but when and why to use them. You'll develop an eye for effective table design and learn to make principled decisions about formatting, layout, and visual emphasis.

## Who this book is for

This book is written for R users who want to elevate their table-making skills. Whether you're a data analyst creating reports, a researcher preparing manuscripts, a consultant building client presentations, or a student learning best practices for data communication, you'll find practical guidance and techniques you can apply immediately.

While some familiarity with R and basic data manipulation (using **dplyr** or similar tools) is helpful, the book includes sufficient background to get you started. More importantly, it focuses on the thinking behind good table design. These principles will serve you well regardless of your technical background.

## About this resource

This website is free to use and will remain freely available. The content is designed to be both a linear tutorial you can read from start to finish and a reference guide you can return to when working on specific table challenges. Each chapter builds on previous concepts while also standing alone for readers who need to solve particular problems.

The book emphasizes reproducible examples throughout. All code is provided in full, and datasets are either built into R packages or clearly documented for download. This means you can follow along, experiment with variations, and adapt the techniques to your own data and design requirements.

Whether you're creating your first **gt** table or looking to push the boundaries of what's possible with table design in R, this book will help you build tables that not only present data clearly but also engage and inform your audience effectively.


---


# Introduction {#sec-introduction}


Tables are everywhere. They appear in financial reports, scientific papers, train schedules, and restaurant menus. We encounter them so frequently that we rarely pause to consider what makes them work. Or, why humanity has relied on this particular arrangement of rows and columns for thousands of years. Yet this ubiquity belies a remarkable sophistication. The table is not merely a grid of values but a carefully evolved technology for organizing information, one that predates written language itself and continues to shape how we understand the world.

Consider for a moment the sheer variety of tables you might encounter in a single day. The nutrition label on your breakfast cereal is a table. The weather forecast in your news app presents temperatures and conditions in tabular form. Your bank statement arranges transactions in rows, with columns for date, description, and amount. The departure board at the train station, the periodic table on a classroom wall, the league standings in the sports section: all tables, each serving a distinct purpose but sharing the same fundamental structure.

![The fundamental structure of a table: column labels identify what each column contains, while rows organize individual records or observations. This simple arrangement of labeled columns over a regular grid of cells has remained essentially unchanged for thousands of years.](assets/schematic_simple_table.jpg){#fig-simple-table-schematic}

This chapter traces the table's journey from ancient clay tablets to modern software, exploring why this seemingly simple format has proven so enduring and adaptable. Along the way, we'll examine what distinguishes tables from other forms of information display, how printing technology transformed tabular presentation, and how computational tools have both expanded and complicated what tables can do. We'll conclude by considering how **gt**, the R package that is the subject of this book, fits into this long history and what principles guide its approach to table creation.

## The origins of tabular thinking

The impulse to arrange information in rows and columns appears to be deeply human. Long before the first writing systems emerged, humans were scratching tally marks into bones and cave walls. This is an early form of record-keeping that, while not quite a table, reflects the same desire to organize discrete pieces of information in a structured, retrievable way. The Ishango bone, discovered in what is now the Democratic Republic of Congo and dated to approximately 20,000 years ago, bears notched marks that some scholars interpret as an early tally system (de Heinzelin, 1962; Huylebrouck, 2019). Whether or not these marks constitute a proto-table, they reveal an ancient impulse toward systematic record-keeping.

![The Ishango bone, dating to approximately 20,000 years ago, features notched marks arranged in three columns along its length. Discovered in what is now the Democratic Republic of Congo, it is considered one of the earliest known artifacts suggesting systematic numerical record-keeping.](assets/ishango_bone.jpg){#fig-ishango-bone}

The earliest recognizable tables date to ancient Mesopotamia, around 2000 BCE (Neugebauer, 1957; Robson, 2008). Babylonian scribes pressed cuneiform characters into clay tablets to create multiplication tables, tables of reciprocals, and astronomical tables tracking lunar and planetary movements. These weren't mere lists. Rather, they were organized with clear row and column structure, allowing readers to look up values by cross-referencing categories. A Babylonian merchant could consult a table to calculate interest on a loan. An astronomer could predict when Venus would next appear in the evening sky.

![Two views of a cuneiform tablet from the Temple of Enlil at Nippur, dating to approximately 1850 BCE (CBS 3323, University of Pennsylvania). This administrative tablet records sources of revenue and monthly disbursements for 50 temple personnel. Despite its age, the tablet displays remarkably modern tabular conventions: column headings (month names), row titles (names and professions of individuals), cells left blank where no information applies, numerical values in the data cells, subtotals for each individual every six months, grand totals, and annotations with explanatory notes (Robson, 2003). The regular grid structure demonstrates that the fundamental principles of table design were already well established nearly four thousand years ago.](assets/nippur_cuneiform_tablet.jpg){#fig-nippur-tablet}

The sophistication of these early tables is striking. Some Babylonian astronomical tablets contained dozens of columns, each representing a different mathematical series used to predict celestial phenomena. The tablet known as Mul-Apin, dating to around 1000 BCE, compiled star catalogs, planetary periods, and seasonal information in tabular formats that remained authoritative for centuries (Hunger & Pingree, 1999). The scribes who created them understood something fundamental: when information has multiple dimensions (when you need to find a value based on two or more criteria) a tabular format dramatically reduces the cognitive burden on the reader. Instead of searching through prose descriptions or performing calculations from first principles, one simply locates the appropriate row and column and reads the answer directly.

![One of the Mul-Apin clay tablets, now held at the British Museum. Dating to around 1000 BCE (though preserved in later copies), this astronomical compendium organized star catalogs, planetary periods, and calendrical information in a tabular format.](assets/mul_apin.jpg){#fig-mul-apin}

This efficiency principle drove the adoption of tables across ancient cultures. Egyptian surveyors used tables to calculate land areas for taxation, essential work in a civilization whose agricultural prosperity depended on the annual flooding of the Nile. The Rhind Mathematical Papyrus, dating to around 1550 BCE, contains tables for converting fractions: a practical tool for scribes who needed to divide rations among workers or calculate shares of harvested grain (Imhausen, 2016).

![A table carved into stone at the Temple of Karnak in Egypt. The cells contain tally marks using the Egyptian hieratic numeral system: inverted U-shapes represent tens, vertical strokes represent units, and spiral symbols (resembling coiled rope) represent hundreds. This monumental inscription demonstrates that tabular formats were important enough to warrant permanent display in sacred architecture.](assets/temple_at_karnak.jpg){#fig-karnak-table}

![A portion of the Rhind Mathematical Papyrus, dating to around 1550 BCE and now held at the British Museum. The papyrus contains mathematical tables including fraction conversions, making it one of the most important sources for understanding ancient Egyptian mathematics. The document was copied by the scribe Ahmes from an even older text.](assets/rhind_mathematical_papyrus.jpg){#fig-rhind-papyrus}

Greek astronomers, building on Babylonian work, created sophisticated trigonometric tables (Jones, 1991). Hipparchus, working in the second century BCE, compiled a table of chords that served essentially as a trigonometric reference, enabling calculations in astronomy and geography. Ptolemy's Almagest, written in the second century CE, contained extensive astronomical tables that would remain the standard reference for over a millennium (Toomer, 1984).

![A page from Ptolemy's Almagest, showing astronomical tables. Originally written in Greek around 150 CE, the Almagest contained extensive star catalogs, planetary tables, and trigonometric data that remained the authoritative astronomical reference for over a millennium. This later edition demonstrates how tabular formats were preserved and transmitted across centuries of copying and translation.](assets/almagest.jpg){#fig-almagest}

Roman tax collectors and administrators maintained census records that tracked populations, property, and obligations across the vast empire. While many ancient administrative records were organized as prose or lists rather than true tables, the underlying challenge was the same: how to structure multi-dimensional information so it could be reliably retrieved. In each case where tables were used, they served the same essential function: transforming complex information into a format that could be quickly consulted and reliably interpreted.

## Tables in the medieval and early modern world

The fall of Rome and the fragmentation of Europe might have disrupted the tradition of table-making, but the format persisted. It was preserved in monasteries, transmitted through Islamic scholarship, and eventually rekindled during the Renaissance. Medieval monks, laboriously copying manuscripts, maintained astronomical tables, calendrical computations, and reference works that kept the tabular tradition alive through centuries of political upheaval.

Islamic scholars made particularly important contributions to the development of tables during the medieval period. Building on Greek and Indian mathematical traditions, astronomers in the Islamic world created elaborate astronomical tables called Zij (Kennedy, 1956). These comprehensive works contained tables for calculating the positions of the sun, moon, and planets, along with tables for trigonometric functions, geographical coordinates, and calendrical conversions. The Zij of al-Khwarizmi, compiled in the ninth century, and the later Zij of Ulugh Beg, produced in fifteenth-century Samarkand, represented the pinnacle of pre-telescopic astronomical tabulation (Saliba, 2007). Their precision and comprehensiveness would not be surpassed until the scientific revolution.

![Two pages from the Zij of Ulugh Beg, compiled in fifteenth-century Samarkand. These astronomical tables represented the culmination of Islamic astronomical tradition, combining observations from Ulugh Beg's observatory with centuries of accumulated mathematical techniques. The precise tabular format enabled astronomers to calculate planetary positions and predict celestial events with unprecedented accuracy.](assets/zij_table_ulugh_beg.jpg){#fig-ulugh-beg-zij}

In medieval Europe, astronomers relied heavily on the Alfonsine Tables, compiled in Toledo in the thirteenth century under the patronage of King Alfonso X of Castile. These tables, which incorporated both Islamic astronomical knowledge and new observations, became the standard reference for planetary calculations throughout Europe for over three centuries. Their wide circulation in manuscript form testifies to the essential role that tabular formats played in transmitting astronomical knowledge across cultures and centuries.

![Two pages from the Alfonsine Tables, showing the characteristic layout of medieval astronomical tables. Originally compiled in thirteenth-century Toledo, these tables combined Islamic and European astronomical traditions and remained the standard reference for calculating planetary positions throughout Europe until the sixteenth century.](assets/alfonsine_table.jpg){#fig-alfonsine-tables}

The Renaissance brought renewed interest in classical learning and, with it, renewed appreciation for the utility of tables. Merchants in the growing commercial centers of Italy and the Low Countries developed sophisticated accounting practices that relied heavily on tabular formats. Double-entry bookkeeping, systematized by Luca Pacioli in 1494, organized financial information into tables of debits and credits that remain fundamental to accounting today (Sangster, Stoner, & McCarthy, 2008). The spread of commercial arithmetic (practical mathematics for merchants, bankers, and traders) depended on printed tables of interest rates, currency conversions, and commercial weights and measures.

![A multiplication table from Luca Pacioli's *Summa de arithmetica geometria proportioni et proportionalita* (1494), spread across two pages. This comprehensive treatise on mathematics and accounting included numerous reference tables that became essential tools for merchants and accountants. The tabular format made calculation faster and more reliable, supporting the expansion of commerce in Renaissance Italy.](assets/luca_pacioli_table.jpg){#fig-pacioli-table}

The scientific revolution of the sixteenth and seventeenth centuries generated an explosion of tabular data. Tycho Brahe's meticulous astronomical observations, compiled into tables, provided the foundation for Johannes Kepler's laws of planetary motion.

![Two pages from the *Rudolphine Tables* (*Tabulae Rudolphinae*), published by Johannes Kepler in 1627, showing tables for calculating eclipses of the Sun and Moon. The tables were based on Tycho Brahe's decades of precise observations and remained the most accurate astronomical tables available for over a century. Named in honor of Emperor Rudolf II, who had patronized both Brahe and Kepler, they exemplify how tabular formats could encode complex astronomical calculations in a form usable by practitioners.](assets/rudolphine_tables.jpg){#fig-rudolphine-tables}

John Napier's invention of logarithms in 1614 was accompanied by the publication of logarithmic tables that transformed calculation by converting multiplication into addition (Campbell-Kelly et al., 2003). These tables became essential tools for astronomers, navigators, surveyors, and engineers (anyone whose work required complex arithmetic). For nearly four centuries, until electronic calculators became widely available, logarithmic tables remained indispensable equipment for technical work.

Navigation tables deserve particular mention. The age of exploration created urgent demand for tables that could help sailors determine their position at sea. Tables of solar declination, lunar distances, and stellar positions allowed navigators to calculate latitude and (eventually) longitude from celestial observations. The British Nautical Almanac, first published in 1767 and still in print today, provided the tabular data that made reliable ocean navigation possible (Maskelyne, 1766). Errors in these tables could mean shipwreck and death so their accuracy was a matter of national importance. The calculation and verification of navigation tables employed generations of human "computers", who were skilled mathematicians that spent their careers performing the arithmetic necessary to produce reliable tabular values (Grier, 2005).

![A page from *The Nautical Almanac and Astronomical Ephemeris for the Year 1767*, the first edition of the British Nautical Almanac edited by Nevil Maskelyne. The precisely formatted tables of lunar distances and celestial positions enabled navigators to determine longitude at sea, solving one of the great technical challenges of the age of exploration.](assets/nautical_almanac.jpg){#fig-nautical-almanac}

## Tables versus text: the cognitive advantage

Why do tables work so well? The answer lies partly in how human visual perception operates. When information is arranged in a grid, our eyes can rapidly scan along rows and columns to locate relevant data. We don't need to read every cell. The spatial structure itself conveys meaning. A value's position tells us what category it belongs to before we even read the value itself.

Cognitive scientists have studied this phenomenon extensively. Research on visual search demonstrates that humans are remarkably efficient at locating targets in organized spatial arrays. When items are arranged in regular rows and columns, we can use the grid structure to guide our attention, eliminating large portions of the display from consideration without conscious effort. This is fundamentally different from how we process prose, which must be read sequentially and parsed grammatically before its meaning can be extracted.

Consider the alternative: presenting the same information as prose. A sentence like "The population of France in 2020 was 67 million, while Germany had 83 million, Italy had 60 million, and Spain had 47 million" requires the reader to parse the grammatical structure, extract the country names and values, and mentally construct the relationships between them. The same information in a simple two-column table can be grasped almost instantaneously:

```{r}
countrypops |>
  dplyr::filter(
    country_name %in% c("France", "Germany", "Italy", "Spain"),
    year == 2020
  ) |>
  dplyr::select(country_name, population) |>
  dplyr::arrange(desc(population)) |>
  gt() |>
  tab_header(title = "Population of Selected European Countries (2020)") |>
  fmt_integer(columns = population) |>
  cols_label(country_name = "Country", population = "Population")
```

The table format offers several distinct advantages. First, it separates the data from the syntax that would otherwise be needed to express it. In prose, we need words like "while", "had", and "was" to connect the values. In a table, the structure itself provides the connections. Second, tables support comparison. Aligning values vertically makes it trivially easy to see that Germany is the most populous country in the list. Third, tables are scannable. A reader looking specifically for Spain's population can locate it without reading about France, Germany, or Italy.

These advantages become even more pronounced as the amount of data increases. A table with fifty rows and five columns remains relatively easy to navigate. The equivalent prose (dozens of sentences, each stuffed with multiple values) would be nearly impossible to use effectively. Edward Tufte, the influential information designer, captured this distinction by noting that tables are "clearly the best way to show exact numerical values" (Tufte, 2001). Graphs may reveal patterns and trends more vividly, but when precision matters, tables are unmatched.

The psychologist George Miller famously identified "seven plus or minus two" as the typical capacity of human working memory: the number of distinct items we can hold in mind simultaneously (Miller, 1956). Tables help us work around this limitation. Instead of trying to remember multiple values and their relationships, we can offload that burden onto the table's structure. The information remains available for consultation and we need only remember where to look.

This cognitive offloading extends to more complex operations. When comparing values across multiple dimensions (say, sales figures across different products, regions, and time periods) a well-designed table allows us to perform comparisons that would otherwise exceed our mental capacity. We can scan down a column to compare products, across a row to compare regions, or diagonally to trace trends over time. The table serves as an external memory and calculation aid, extending our cognitive capabilities beyond their natural limits.

This doesn't mean tables are always superior. Prose is good at conveying narrative, context, and nuance (the kinds of qualitative information that resist easy categorization). A story about economic hardship cannot be reduced to a row of numbers. The human experience it describes requires language that tables cannot provide. And visual displays like charts and maps can reveal relationships that tables obscure. A scatterplot showing the correlation between two variables makes patterns visible at a glance; the same data in tabular form would require careful study to discern. The point is not that tables should replace other forms of communication but that they occupy a distinctive niche: they are the optimal format for presenting structured, precise, multi-dimensional information to readers who need to look up, compare, or verify specific values.

## From manuscript to print: the typographic revolution

For most of history, tables were created by hand. Scribes copied them laboriously, introducing errors with each transcription. A misplaced digit in an astronomical table could lead to incorrect predictions. An error in a financial table could affect fortunes. The profession of table-making was consequently a skilled one, requiring not only arithmetic competence but also meticulous attention to layout and proofreading.

The invention of printing with movable type in the fifteenth century began to change this, but tables posed particular challenges for early printers. Text could be set from pre-cast letter blocks, but tables required careful alignment across multiple columns. This resulted in a fussier process that demanded specialized techniques. The type cases designed for ordinary text printing didn't include the thin metal strips needed for ruled lines. Printers had to improvise or commission special materials.

The early printed tables were often crude by modern standards. Columns might be separated by vertical lines drawn by hand after printing, or, by simple spacing (that might shift if the paper expanded or contracted). The horizontal rules that we now take for granted (the lines separating header rows from data, one section from another, etc.) were difficult to produce consistently. Many printers avoided tables altogether, preferring to present numerical information as prose or lists.

![A page from *Kalendarion Gregorianon* (1590), a Greek translation of Gregorian calendar tables. This late sixteenth-century publication shows the developing conventions for printed tables: ruled lines separate columns and rows, headers are distinguished from data, and the dense arrangement of numerical information demonstrates how printers were learning to organize complex tabular content within the constraints of movable type.](assets/kalendarion_gregorianon_1590.jpg){#fig-kalendarion-gregorianon}

Gradually, however, typographic conventions emerged. Printers developed techniques for casting thin metal rules that could be assembled into table frameworks. They experimented with different approaches to column separation: ruled lines, generous white space, alternating shading. They learned that aligning numbers by their decimal points made tables more readable. They discovered that headers could be distinguished through boldface, italics, or capital letters, and that horizontal rules helped readers track across long rows.

The sixteenth and seventeenth centuries saw the emergence of specialized table printers who developed proprietary techniques and competed for lucrative contracts. Mathematical tables, almanacs, and commercial reference works represented significant markets. The accuracy of these publications was a selling point. Printers advertised the care taken in their verification. Some publishers hired professional calculators to check every entry, while others offered rewards for errors discovered by readers.

![A page from John Seller's *A Pocket Book* (1677), containing tables for arithmetic, astronomy, geometry, surveying, navigation, and other practical arts. This compact reference work exemplifies the seventeenth-century market for portable mathematical tables. The careful alignment of columns and the use of ruled lines show the maturing conventions for tabular presentation, while the pocket-sized format reflects the practical needs of surveyors, navigators, and merchants who required ready access to calculated values.](assets/seller_pocket_book_1677.jpg){#fig-seller-pocket-book}

By the nineteenth century, the typography of tables had become a sophisticated craft. Scientific publishers developed elaborate conventions for statistical tables, with clear hierarchies of headers, stub columns for row labels, and footnotes for qualifications and sources. The stub, which is the leftmost column containing row labels, became recognized as a distinct structural element requiring its own typographic treatment. Nested headers, spanning multiple columns, conveyed hierarchical relationships among variables. Footnotes, marked with symbols or superscript numbers, allowed qualifications and explanations without cluttering the main body of the table.

![A page from *The British Merchant* (1713), showing detailed tables of import trade data. Published as a Whig response to the Tory *Mercator* during debates over commercial policy, this periodical demonstrates how tables had become essential tools for economic and political argument. The structured presentation of trade figures lent authority to partisan claims, illustrating how tabular formats were already being used to shape public discourse.](assets/british_merchant_1713.jpg){#fig-british-merchant}

![A page from John Wright's *The American Negotiator* (1765), showing tables of currency exchange rates across the British colonies in America. Such commercial reference works were essential tools for merchants navigating the complex monetary landscape of colonial trade, where different colonies used different currencies with varying values. The clear tabular format made it possible to quickly look up conversion rates that would otherwise require laborious calculation.](assets/american_negotiator_1765.jpg){#fig-american-negotiator}

Financial tables grew increasingly complex, with nested column headers and multi-level row groupings. The annual reports of major corporations, the prospectuses of stock offerings, and the statistical publications of governments all demanded sophisticated tabular presentation. Railway timetables, a distinctly modern invention, demonstrated that tables could convey temporal as well as categorical structure. The Bradshaw's railway guide, first published in 1839, became legendary for its dense, intricate tables that allowed travelers to plan journeys across Britain's growing rail network (Simmons, 1991). Its complexity was both mocked and admired. Sherlock Holmes consulted it repeatedly in Arthur Conan Doyle's stories.

![A page from Bradshaw's railway timetable, showing the characteristic dense tabular format that allowed Victorian travelers to navigate Britain's complex rail network. The intricate arrangement of departure times, stations, and route information exemplifies how tables evolved to handle increasingly complex scheduling data.](assets/bradshaw_table.jpg){#fig-bradshaw-table}

The aesthetic standards for printed tables also evolved. Victorian-era tables often featured elaborate decorative rules and ornate headers that seem excessive to modern eyes (e.g., heavy borders, ornamental corner pieces, and intricate typographic flourishes). This reflected broader Victorian tastes for elaborate decoration, but it also served a practical purpose: in an era before photocopying and electronic transmission, distinctive styling helped identify the source and authenticity of printed tables.

![A page from Charles Babbage's *Table of Logarithms of the Natural Numbers from 1 to 108000* (1889 edition). Babbage, famous for his work on mechanical computing, was deeply concerned with the accuracy of mathematical tables; errors in existing tables had motivated his designs for the Difference Engine. This edition exemplifies the refined typography of nineteenth-century mathematical publishing: clean layouts, careful alignment, and systematic organization that minimized the risk of transcription errors while maximizing usability for the scientists, engineers, and navigators who depended on such tables.](assets/babbage_table_of_logarithms_1889.jpg){#fig-babbage-logarithms}

The twentieth century brought a movement toward simplification. Statisticians like Andrew Ehrenberg argued that heavy rules and excessive ornamentation actually impeded understanding (Ehrenberg, 1977). In his influential guidelines for table design, Ehrenberg demonstrated that many conventional table elements (vertical rules, cell borders, unnecessary shading, etc.) added visual noise without improving comprehension (Wainer, 1984). The "less is more" philosophy gradually prevailed, leading to the clean, minimalist table designs that predominate today: horizontal rules used sparingly to separate logical sections, ample white space, and careful attention to typography.

## Tables and the authority of numbers

Tables do more than present information efficiently, they also convey authority. A claim supported by a table of data carries more weight than the same claim made in prose. This association between tables and credibility has deep historical roots and continues to shape how we communicate quantitative information.

The authority of tables derives partly from their association with precision and objectivity (Porter, 1995). When information is presented in tabular form, it appears to have been measured, counted, or calculated (not merely asserted). The rigid structure of rows and columns suggests systematic organization and careful verification. The numbers themselves carry connotations of scientific rigor, even when the underlying data is uncertain or contested.

This authority can be deserved or manufactured (Best, 2001). A table of experimental results, carefully collected and analyzed, genuinely supports the conclusions drawn from it. But tables can also create an illusion of precision that masks underlying uncertainty or bias. Publishing polling data in tabular form suggests definiteness that the margins of error rarely convey. Financial projections presented as tables imply a predictability that markets rarely exhibit. The very format that makes tables useful for legitimate communication also makes them effective tools for persuasion and manipulation.

Historians of statistics have documented how the rise of quantification in the nineteenth century was accompanied by proliferating tables in government reports, scientific publications, and commercial documents (Porter, 1995; Desrosières, 1998). "Statistics" originally meant the science of state, the collection and tabulation of information useful for governance. Census tables counted populations, vital statistics tables tracked births and deaths, trade tables documented imports and exports. These tabulations served administrative purposes, but they also shaped public discourse by making certain kinds of claims possible. Once a phenomenon was tabulated, it became available for comparison, trending, and policy intervention in ways that qualitative descriptions did not permit.

![A table from the 1880 United States Census showing the percentage of population increase by state and territory across nine decades, from 1790–1800 through 1870–1880. This table is a good example of the elaborate statistical tables that nineteenth-century governments produced to track demographic change. The dense grid of percentages, with footnotes marking decreases and special cases, demonstrates how census tabulations made long-term population trends visible and comparable in ways that narrative descriptions could not achieve.](assets/us_census_1880.jpg){#fig-us-census-1880}

The sciences adopted tables as standard equipment for reporting empirical results. The format of scientific papers crystallized around figures and tables presenting data, with prose relegated to interpretation and contextualization. To this day, the "results" section of a scientific paper typically centers on tables and figures. The authority of the findings depends significantly on how convincingly the data is tabulated.

![Two meteorological tables from Pliny Earle Chase's "A new method of Meteorological comparison, with three illustrative tables", published in *The American Journal of Science and Arts* (1866). The tables present correlations of temperature, gravity, and magnetism from observatories in Toronto (left) and St. Helena (right). These dense scientific tables exemplify the conventions that emerged in nineteenth-century empirical research: abbreviated column headers to fit narrow journal pages, vertical and horizontal rules to organize complex data, subtotals and grand totals at the bottom, and systematic presentation that enabled readers to verify calculations and compare findings across different observation sites.](assets/chase_1866.jpg){#fig-chase-meteorological}

Understanding this relationship between tables and authority is important for anyone who creates tables professionally. With the power to make claims appear credible comes the responsibility to ensure that the claims are actually supported by the data. A well-designed table doesn't just present information clearly, it also represents that information honestly, acknowledging uncertainty where it exists and avoiding presentations that would mislead readers. The visual conventions of tables (alignment, precision, formatting) should serve clarity rather than creating false impressions.

## The computational transformation

The advent of electronic computing in the mid-twentieth century transformed every aspect of data work, and tables were no exception (Ceruzzi, 2003). Early computers could generate tables of astonishing size and precision. Actuarial tables, mathematical tables, census tabulations are some examples. These would have taken human calculators years to produce by hand. The ENIAC (one of the first general-purpose electronic computers) was initially used to calculate artillery firing tables, a task that had previously occupied teams of human computers for months (Goldstine, 1972). What once required armies of mathematicians could now be accomplished in hours.

![The ENIAC (Electronic Numerical Integrator and Computer) at the University of Pennsylvania, circa 1946. One of the first general-purpose electronic computers, ENIAC filled an entire room.](assets/eniac_computer.jpg){#fig-eniac}

But these early computer-generated tables were constrained by the output technology of the time: line printers that could produce only fixed-width characters, with no variation in font, weight, or size. These printers worked by striking an inked ribbon against paper through a rotating drum or chain of characters, much like a very fast typewriter. They were optimized for speed and reliability, not typographic sophistication.

The tables that emerged from line printers had a distinctive aesthetic: monospaced characters arranged in rigid columns, often with ASCII characters like dashes, pipes, and plus signs used to simulate rules and borders. This style persists in some contexts today (command-line interfaces and plain-text data files still use it) but it was a significant step backward from the typographic sophistication that printed tables had achieved. A line-printer table could not use bold or italic type to distinguish headers, it could not align numbers by decimal points (since all characters were the same width), and it could not adjust column widths to fit content elegantly.

The limitations of line-printer output created a cultural divide between "computer tables" and "publication tables". For serious publication, computer output had to be manually retyped by skilled typists or sent to professional typesetters. This reintroduced the errors and delays that computing was supposed to eliminate. An analyst might have data processed in minutes but wait weeks for properly formatted tables.

The development of word processors and desktop publishing software in the 1980s began to restore table-making capabilities. Users could once again create tables with proper typography: proportional fonts, bold headers, visible rules. Software like WordPerfect, Microsoft Word, and later desktop publishing applications like PageMaker and QuarkXPress included table features that allowed precise control over cell formatting, borders, and alignment. These tools democratized table production since anyone with a personal computer could create reasonably professional-looking tables without professional typesetters.

But these tools were primarily designed for creating tables manually, one cell at a time. They worked well enough for simple tables but became unwieldy when tables needed to be generated programmatically from data, updated frequently, or reproduced across multiple documents in a consistent format. The connection between data and presentation remained broken: change the underlying data, and you had to manually update the table.

Spreadsheet software such as VisiCalc, Lotus 1-2-3, and eventually Microsoft Excel offered a different paradigm. Spreadsheets treated the table as the fundamental unit of work, with each cell capable of containing data or formulas that referenced other cells. This was enormously powerful for calculation and analysis. Spreadsheets could automatically recalculate when data changed. They could sort and filter data dynamically. They could generate charts from tabular data with a few clicks.

![VisiCalc running on an Apple II computer. Released in 1979, VisiCalc was the first spreadsheet program for personal computers and is often credited with turning the microcomputer from a hobbyist's toy into a serious business tool. The grid of cells, each capable of containing values or formulas, established the paradigm that would define electronic tables for decades to come.](assets/visicalc_apple_ii.jpg){#fig-visicalc}

![Lotus 1-2-3 running under DOS. Introduced in 1983, Lotus 1-2-3 dominated the spreadsheet market throughout the 1980s and became the standard business application that drove adoption of IBM PCs. Its characteristic blue-and-white interface and dense grid of cells exemplify the utilitarian aesthetic of early spreadsheet software: functional and powerful, but with limited typographic refinement.](assets/lotus_123_dos.jpg){#fig-lotus-123}

But spreadsheets were designed primarily as working tools rather than presentation tools. Their default appearance (gridlines everywhere, columns sized to fit content, minimal typographic distinction between headers and data) produced tables that were functional but rarely beautiful. While Excel and its competitors did include formatting capabilities, applying them consistently required manual effort, and the results often looked obviously "spreadsheet-generated" rather than professionally typeset. The gridline aesthetic became so associated with spreadsheet output that it acquired its own connotations: utilitarian, perhaps preliminary, not quite finished.

The web introduced yet another approach to tables. HTML included table elements from its earliest versions, recognizing that tabular data was fundamental to many kinds of web content. The `<table>`, `<tr>`, `<td>`, and `<th>` tags allowed developers to create tables directly in markup, and Cascading Style Sheets (CSS) provided control over appearance.

![A table from SynthZone.com, a website dedicated to music synthesis resources that has been online since 1995. This screenshot illustrates the characteristic aesthetic of early web tables: visible borders on every cell, default browser fonts, and minimal styling. Such tables were functional for organizing information but lacked the typographic refinement of professionally printed tables. The HTML table element made tabular presentation accessible to anyone who could write basic markup, democratizing table creation while simultaneously lowering aesthetic standards.](assets/synthzone_com.jpg){#fig-synthzone}

But HTML tables were notoriously difficult to style and even more difficult to make responsive. A table that looked acceptable on a desktop monitor might become unusable on a mobile phone. The rigid two-dimensional structure of tables conflicted with the fluid, reflowing layout that web design demanded. Web developers spent years wrestling with table formatting, and the challenges contributed to a backlash against tables that led some to avoid them entirely, even when tabular presentation would have been appropriate. For a period in the early 2000s, using tables for page layout was so discouraged that the stigma attached to all table usage, including legitimate tabular data.

## Tables in statistical computing

For statisticians and data analysts, the challenge of producing well-formatted tables has been particularly acute. Statistical software is typically better at computation (fitting models, testing hypotheses, summarizing distributions) but historically struggled at presentation. The outputs of statistical procedures were often functional but aesthetically impoverished: plain text, minimal formatting, no consideration of how the results would ultimately be communicated to readers.

The oldest statistical software systems such as SAS, SPSS, and Stata developed their own conventions for tabular output that prioritized information density over visual appeal. A regression table from SAS might include every conceivable statistic, formatted to many decimal places, with labels abbreviated to fit narrow columns. These outputs were designed to be comprehensive rather than communicative; they assumed readers who would study the numbers carefully rather than scan them quickly.

![Regression output from three major statistical software systems: SAS (top-left), Stata (top-right), and SPSS (bottom). These outputs exemplify the conventions that emerged in traditional statistical software: dense presentation of many statistics, numerous decimal places, abbreviated labels to fit narrow columns, and formatting optimized for completeness rather than communication. While comprehensive, such outputs typically required manual reformatting before they could appear in publications.](assets/sas_stata_spss_tabular_results.jpg){#fig-sas-stata-spss}

This created a frustrating workflow. Analysts would perform their calculations in statistical software, then manually transfer the results into word processors or page layout applications for formatting. This transfer was error-prone and time-consuming, and it broke the connection between the analysis and its presentation. If the underlying data changed, the entire process had to be repeated. A single additional observation in the dataset might require re-running the analysis, re-transferring the numbers, and re-applying all the formatting.

The R programming language, which emerged in the 1990s as an open-source implementation of the S statistical language, inherited this limitation. R could produce statistical outputs of great sophistication, but getting those outputs into a professionally formatted table required either manual intervention or third-party tools with their own learning curves and limitations. The default R output was plain text, suitable for the console but not for publication.

Various R packages attempted to address this gap. Early solutions like `xtable` could convert R objects to LaTeX or HTML, but offered limited formatting control. The package produced serviceable output but required users to understand LaTeX table syntax for customization. Later packages like `kable` (part of the `knitr` ecosystem) provided simple table generation with reasonable defaults, making basic table creation straightforward but still limiting complex formatting. The `formattable` package introduced the idea of embedding visualizations within table cells (color scales, icons, and bar charts that augmented numerical values). `DT` brought interactive JavaScript datatables to R, enabling sorting, filtering, and pagination in web-based outputs. `flextable` offered a different approach with comprehensive support for Word and PowerPoint output. `huxtable` emphasized a tidy interface and conditional formatting. `reactable` provided another JavaScript-based solution with modern aesthetics.

Each package solved particular problems but none provided a comprehensive, unified approach to table creation. The landscape was fragmented. An analyst might use one package for simple tables, another for interactive tables, a third for tables with embedded graphics. The syntax and concepts differed across packages, and achieving consistent, high-quality formatting remained difficult. The tables produced by R (notwithstanding the sophistication of the underlying analyses) often fell short of the typographic standards that professional publishers had established over the preceding centuries.

The situation mirrored a broader challenge in data science: the gap between analysis and communication. Tools optimized for statistical computation did not prioritize presentation; tools designed for presentation did not connect easily to computational workflows. Bridging this gap required either extensive manual effort or compromises in quality.

## The structure of tables

Into this context came **gt**. The package drew significant inspiration from an unlikely source: a 266-page government manual published in 1949.

The *Manual of Tabular Presentation*, prepared by Bruce L. Jenkinson as Chief of the Statistical Reports Section at the U.S. Bureau of the Census, represents perhaps the most thorough treatment of table design ever produced (Jenkinson, 1949). The manual codified decades of accumulated wisdom from the Bureau's experience preparing statistical publications, establishing terminology and principles that remain relevant today. It introduced precise vocabulary for table components: the *stub* (the leftmost column containing row labels), the *boxhead* (the structure of column headers), the *field* (the data cells themselves), *spanners* (headers that span multiple columns), and *caption* (the table's title). It provided detailed guidance on everything from the placement of units to the alignment of figures to the handling of footnotes.

![Pages from the *Manual of Tabular Presentation* (1949), showing the systematic approach to table design developed by the U.S. Bureau of the Census. The manual provided precise terminology for table components (including the formal table structure with its major parts), guidance on table proportions (such as the narrow table format), and detailed recommendations for footnote mark sequencing in column labels and spanners. These conventions, developed through decades of government statistical publishing, established standards that continue to influence table design today.](assets/manual_tabular_presentation_1949.jpg){#fig-census-manual}

What made Jenkinson's manual particularly valuable was its combination of practical specificity and principled reasoning. Rather than merely prescribing rules, it explained why certain conventions worked better than others. Why should numbers be right-aligned? Because this causes the decimal points to align, making comparison easier. Why should row labels be left-aligned? Because text is easier to read when it starts at a consistent position. Why should horizontal rules be used sparingly? Because excessive lines create visual clutter that impedes rather than aids comprehension.

Of course, not every recommendation from a 1949 manual translates directly to modern practice. The Census manual advocated for *leaders* (rows of dots or dashes connecting stub entries to their corresponding values across wide tables) a typographic convention that was common in mid-century printing but has largely fallen out of favor and proves difficult to implement in web-based rendering. The manual also endorsed more liberal use of vertical rules than contemporary taste typically permits; modern table design has trended toward minimalism, relying on white space and alignment rather than explicit lines to separate columns. Some conventions around capitalization, abbreviation, and the placement of units have similarly evolved. **gt** had to balance respect for the manual's enduring insights with accommodation of changed expectations, taking what remained valuable while adapting to the aesthetic and technical context of tables rendered on screens rather than printed on paper.

More fundamentally, electronic tables deal with space differently than page-based tables. The printed page imposed hard constraints: a table had to fit within fixed margins, and if it didn't, the designer had no choice but to abbreviate, reduce type size, or split the table across pages. Screen-based tables enjoy the affordance of scrolling. A table can extend beyond the visible viewport, and readers can navigate to see more. Yet this affordance brings its own challenges. On mobile devices, where screen real estate is precious, excessive scrolling becomes tiresome; a table that requires both horizontal and vertical scrolling to comprehend is a poor user experience. The old tricks of the trade (abbreviating column headers, attending to the balance and density of information, choosing what to include and what to omit) remain important, but the calculus has changed. A table destined for a printed report faces different constraints than one designed for a responsive web page that must render legibly on everything from a large desktop monitor to a narrow phone screen.

**gt** embodies many of the principles articulated in this foundational work, translated into the computational context of modern data analysis. The package recognizes that tables have a logical structure: components that exist independently of any particular visual rendering. A table has a body (the main grid of data cells), but it may also have a header (with title and subtitle), a footer (with footnotes and source notes), column labels, row labels, row groups, column spanners, and summary rows. Each of these components has its own properties (content, formatting, positioning) that can be specified independently.

![The composition of a table as understood by **gt**. The package provides distinct terminology for each structural component: the table header (containing title and subtitle), column labels and spanner labels that organize columns, the stub (containing row labels, row group labels, and summary labels), the stubhead label, the body cells, summary cells, and the table footer (with footnotes and source notes). This vocabulary, derived from the Census Bureau's *Manual of Tabular Presentation* and adapted for computational table-making, maps directly to **gt**'s function names and documentation.](assets/schematic_more_complex_table.jpg){#fig-gt-table-composition}

This structural decomposition reflects how people actually think about tables. When designing a table, we don't think in terms of individual cell properties but, instead, we think in terms of structural elements ("this table needs a title", "these columns should be grouped under a common header", "the last row should show totals"). Each of these statements identifies a table component and an operation to perform on it. **gt** provides functions that correspond directly to these natural expressions of intent.

By providing distinct functions for each component and each type of operation, **gt** allows table construction to be expressed as a pipeline of transformations. One begins with data, passes it to `gt()` to create a table object, then pipes that object through functions that add headers, format values, apply styles, insert footnotes, and so on. Each step is self-contained and understandable as the overall table emerges from the cumulative effect of the pipeline.

This compositional approach brings several benefits. It makes table construction more systematic. Instead of clicking through menus or setting dozens of parameters in a single function call, users express their intentions through a sequence of discrete, meaningful operations. It makes tables more reproducible as the same code will produce the same table every time, with no manual steps that might introduce variation. And it makes tables more maintainable. If the underlying data changes, the table can be regenerated automatically. If the formatting needs adjustment, specific functions can be modified without disturbing the rest of the pipeline.

The pipeline approach also facilitates iterative refinement. A table can be built incrementally, with each step producing a visible result that can be evaluated before proceeding. This matches how designers actually work: they start with a rough version, assess it, make adjustments, and gradually converge on a finished product. The code-based workflow makes this iteration explicit and reversible. Any change can be undone simply by removing or modifying the corresponding line of code.

## What **gt** does

At its core, **gt** transforms data into formatted display tables suitable for publication, reporting, or presentation. The package handles the entire workflow: accepting data from R (typically as data frames or tibbles), organizing that data into the structural components of a table, applying formatting and styling, and rendering the result in various output formats including HTML, LaTeX, RTF, and Word.

The starting point is always data. **gt** accepts data frames and tibbles (the standard tabular data structures in R) and treats them as the raw material from which tables are constructed. This connection to R's data ecosystem means that the full power of R's data manipulation capabilities is available upstream of table creation. Users can filter, transform, aggregate, and reshape their data using familiar tools like **dplyr** and **tidyr**, then pass the result directly to **gt**.

The table body, the main grid of data, is where **gt** begins its work. The `fmt_*()` family of functions formats cell values according to their type: numbers with specified decimal places and digit separators, currencies with appropriate symbols and conventions, dates and times in chosen styles, percentages, scientific notation, and more. These formatting functions operate on columns and can be applied conditionally to specific rows. The separation of data from formatting is crucial: the underlying values remain available for computation even as their display is customized for human readers.

```{r}
exibble |>
  dplyr::select(num, currency, date) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_number(columns = num, decimals = 1) |>
  fmt_currency(columns = currency, currency = "EUR") |>
  fmt_date(columns = date, date_style = "yMMMd")
```

Column labels can be set, renamed, or generated programmatically. The original column names from the data frame are retained internally (for reference in code) while display labels can be freely customized. Columns can be grouped under spanning headers that convey hierarchical relationships, which is a common requirement when presenting data with natural groupings (such as multiple years within categories or different measurements of the same variable). Rows can be organized into groups with their own labels, and summary rows can present aggregations like totals or averages at the group or table level.

The package provides extensive control over visual styling. Colors, fonts, borders, padding, and alignment can be applied globally through table options or selectively through styling functions that target specific cells, columns, rows, or regions. The targeting system is precise: you can style the third row of a specific column, all cells exceeding a threshold, or the header of a particular row group. Conditional formatting allows styles to respond to data values, highlighting cells that exceed thresholds, coloring values along a gradient, marking missing data with distinctive treatment.

```{r}
towny |>
  dplyr::select(name, population_2021, density_2021) |>
  dplyr::slice_max(population_2021, n = 8) |>
  gt() |>
  tab_header(
    title = "Ontario's Largest Municipalities",
    subtitle = "Population and density from the 2021 census"
  ) |>
  fmt_integer(columns = c(population_2021, density_2021)) |>
  cols_label(
    name = "Municipality",
    population_2021 = "Population",
    density_2021 = "Density (per km²)"
  ) |>
  tab_source_note(source_note = "Source: Statistics Canada") |>
  data_color(
    columns = density_2021,
    palette = c("white", "steelblue")
  )
```

Beyond basic formatting, **gt** supports several features that extend the communicative power of tables. Footnotes can be attached to specific cells, columns, or other table elements, with automatic mark generation and placement. The package handles the bookkeeping of which footnote mark corresponds to which note. Images and plots can be embedded in cells, enabling small multiples or sparkline-style visualizations within the table structure. Nanoplots, tiny inline charts, can be generated directly from row data, adding a visual dimension to otherwise numerical displays. These features blur the line between traditional tables and data visualization, creating hybrid displays that combine the precision of tabular data with the pattern-revealing power of graphics.

The package also addresses the practical realities of professional table production. Locale settings control language and formatting conventions automatically. Decimal separators, date formats, currency symbols all adjust appropriately. A table formatted for American readers uses periods as decimal separators and formats dates as month/day/year. The same table formatted for German readers uses commas as decimal separators and formats dates as day.month.year. This internationalization support is essential for producing tables that will be read across linguistic and cultural boundaries.

Output can be generated in multiple formats from the same code, ensuring consistency across HTML reports, PDF documents, and Word files. This multi-format capability addresses a persistent challenge in document production: the need to produce essentially the same table for different output contexts. Integration with Quarto allows tables to be embedded in reproducible documents that combine prose, code, and output.

## Principles of effective table design

**gt** is a tool, and like any tool, its effectiveness depends on how it is used. The package provides capabilities but does not enforce particular design choices. That responsibility falls to the table maker, who must consider both the nature of the data and the needs of the audience.

Certain principles have emerged from the long history of table design, and **gt** is built to support them. The statistician Andrew Ehrenberg, who studied table design systematically, articulated several principles that remain influential (Ehrenberg, 1977). Round numbers to two significant digits unless more precision is genuinely needed as excessive decimal places create clutter without adding information. Order rows and columns meaningfully rather than arbitrarily. Either by size, chronology, or some other logic that aids comprehension. Use row and column totals to provide context and enable checking. Put figures to be compared in columns rather than rows, since vertical comparison is easier than horizontal (Wainer, 1984).

![Two tables from Ehrenberg's "Rudiments of Numeracy" (1977) demonstrating the principles of effective table design. The left table shows typical presentation with unrounded figures. The right table shows the same data improved: values rounded to two significant figures, rows reordered in their groups by size, and a clearer layout that makes patterns immediately apparent (summary row at the bottom of each row group with clear labeling). The transformation illustrates how thoughtful design choices can dramatically improve a table's communicative power.](assets/ehrenberg_1977.jpg){#fig-ehrenberg-tables}

Simplicity generally serves comprehension as tables should contain only the information necessary for the reader's purpose (with minimal visual clutter). Every line, border, and typographic effect should justify its presence. This doesn't mean tables should be stark or austere. Appropriate styling can guide attention and improve readability. But decoration for its own sake distracts from the data.

Alignment matters: numbers should typically be right-aligned so decimal places line up for easy comparison. Text should generally be left-aligned for readability. Mixed alignment within a column (some values right-aligned, others left-aligned) creates visual chaos. Column widths should be proportional to content as overly wide columns waste space while overly narrow columns truncate or wrap awkwardly.

Rules should be used purposefully to separate logical sections, not applied uniformly to every row and column. The heavy gridlines that spreadsheets produce by default are almost never the best choice for a presentation table. Horizontal rules effectively separate headers from body and body from footer. Vertical rules on the other hand are rarely necessary and are often harmful. The white space between columns, combined with alignment, usually provides sufficient separation.

Headers should be distinct but not overwhelming. They exist to orient the reader, not to compete with the data for attention. A common mistake is making headers so prominent (large, bold, perhaps colored) that they dominate the table visually. The data should be the star while headers are the supporting players.

Context matters enormously. A table for scientific publication may need to meet specific journal requirements: particular fonts, prescribed numbers of decimal places, required statistical information. A table for a business dashboard may need to update dynamically as data changes. A table in a slide presentation must be readable from across a room, which typically means fewer rows, larger text, and higher contrast than a table intended for close reading. **gt** provides the flexibility to address these varying needs, but the table maker must understand what the situation requires.

Perhaps most importantly, effective tables are those that respect the reader's time and cognitive resources. Every element should serve a purpose. If a column doesn't contribute to the reader's understanding, omit it. If a value doesn't need five decimal places, round it. If the table is too large to digest at a glance, consider whether it should be broken into multiple smaller tables, or whether a visualization might better reveal the patterns in the data.

## Tables across languages and cultures

Tables, unlike prose, might seem culturally neutral. Numbers are numbers, after all. But the presentation of tabular information is more culturally embedded than it first appears. Different languages have different conventions for number formatting, date representation, and text direction, and these conventions affect how tables should be designed for different audiences.

The decimal separator is perhaps the most obvious example. In the United States, the United Kingdom, and many other countries, the period separates the integer and fractional parts of a number: 3.14159. In much of continental Europe, Latin America, and elsewhere, the comma serves this function: 3,14159. The digit grouping separator (used to break up large numbers for readability) similarly varies: where Americans write 1,000,000, Germans write 1.000.000 and the French write 1 000 000 (using thin spaces).

```{r}

countries <- c("United States", "Germany", "France", "Brazil", "India", "Japan", "Italy", "Switzerland")
locales <- c("en", "de", "fr", "pt-BR", "hi-IN", "ja", "it", "de-CH")

countrypops |>
  dplyr::filter(country_name %in% countries, year == 2024) |>
  dplyr::mutate(locale = locales[match(country_name, countries)]) |>
  dplyr::arrange(match(country_name, countries)) |>
  dplyr::select(country_name, locale, population) |>
  gt() |>
  tab_header(
    title = "Number Formatting Across Locales",
    subtitle = "The same population figures formatted according to each country's locale conventions, showing variation in digit grouping separators. Locale codes combine a language (e.g., 'de' for German) with a region (e.g., 'CH' for Switzerland)."
  ) |>
  fmt_integer(columns = population, locale = from_column("locale")) |>
  tab_style(
    style = cell_text(font = google_font("IBM Plex Mono")),
    locations = cells_body(columns = locale)
  ) |>
  cols_label(
    country_name = "Country",
    locale = "Locale",
    population = "Population (2024)"
  ) |>
  cols_width(
    country_name ~ px(110),
    locale ~ px(120),
    population ~ px(110)
  ) |>
  cols_align(align = "center", columns = locale) |>
  opt_align_table_header(align = "left")
```

Currency formatting varies even more widely. The currency symbol may precede or follow the amount. Negative amounts may be indicated with a minus sign, parentheses, or red coloring. The number of decimal places expected varies by currency. A table of financial data formatted for one country may be confusing or even misleading when viewed in another.

```{r}

dplyr::tibble(
  country = c("United States", "Germany", "France", "Japan", "Switzerland", "Denmark"),
  locale = c("en", "de", "fr", "ja", "de-CH", "da"),
  currency = c("USD", "EUR", "EUR", "JPY", "CHF", "DKK"),
  amount = 1234.56
) |>
  gt() |>
  tab_header(
    title = "Currency Formatting Across Locales",
    subtitle = "The same base value formatted with each country's currency and locale conventions. Note the variation in symbol placement, decimal separators, and digit grouping."
  ) |>
  cols_merge(
    columns = c(locale, currency),
    pattern = "{1}/{2}"
  ) |>
  fmt_currency(
    columns = amount,
    currency = from_column("currency"),
    locale = from_column("locale")
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = cells_title(groups = c("title", "subtitle"))
  ) |>
  tab_style(
    style = cell_text(font = google_font("IBM Plex Mono")),
    locations = cells_body(columns = c(locale, currency))
  ) |>
  cols_label(
    country = "Country",
    locale = md("Locale and <br>Currency"),
    amount = "Value"
  ) |>
  cols_width(
    country ~ px(110),
    locale ~ px(120),
    amount ~ px(110)
  ) |>
  cols_align(align = "center", columns = c(locale, currency))
```

Date formatting is notoriously variable. Americans typically write month/day/year while much of the rest of the world uses day/month/year. East Asian countries often use year/month/day. A date written as "03/04/2024" is ambiguous without knowing the intended convention. It could be March 4, April 3, or (in some East Asian formats) part of 2024 depending on context.

```{r}

sample_date <- "2024-03-04"

countries <- c("United States", "United Kingdom", "Germany", "France", "Japan", "China")
locales <- c("en-US", "en-GB", "de-DE", "fr-FR", "ja", "zh")

dplyr::tibble(
  country = countries,
  locale = locales
) |>
  dplyr::rowwise() |>
  dplyr::mutate(
    formatted = vec_fmt_date(sample_date, date_style = "yMd", locale = locale)
  ) |>
  dplyr::ungroup() |>
  gt() |>
  tab_header(
    title = "Date Formatting Across Locales",
    subtitle = "The same date (March 4, 2024) formatted using the flexible 'yMd' style, which adapts to each locale's conventions. Note how the order of month and day varies, making '03/04/2024' ambiguous without context."
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = cells_title(groups = c("title", "subtitle"))
  ) |>
  tab_style(
    style = cell_text(font = google_font("IBM Plex Mono")),
    locations = cells_body(columns = c(locale, formatted))
  ) |>
  cols_label(
    country = "Country",
    locale = "Locale",
    formatted = "March 4, 2024"
  ) |>
  cols_align(align = "center", columns = c(locale, formatted))
```

Even the direction of reading affects table design. In languages that read right-to-left, such as Arabic and Hebrew, tables may need to be mirrored so that the visual flow matches reading expectations. While the underlying data remains the same, the presentation must adapt to the audience.

```{r}

dplyr::tibble(
  language = c("English", "Arabic", "Hebrew", "Persian"),
  direction = c("Left-to-Right", "Right-to-Left", "Right-to-Left", "Right-to-Left"),
  hello = c("Hello", "مرحبا", "שלום", "سلام"),
  numbers = c("1, 2, 3", "١، ٢، ٣", "1, 2, 3", "۱، ۲، ۳")
) |>
  gt() |>
  tab_header(
    title = "Text Direction in Different Scripts",
    subtitle = "Languages with right-to-left scripts present unique challenges for table design. Note that Arabic and Persian use their own numerals, while Hebrew typically uses Western numerals."
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = cells_title(groups = c("title", "subtitle"))
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = cells_body(columns = c(hello, numbers), rows = language == "English")
  ) |>
  tab_style(
    style = cell_text(align = "right"),
    locations = cells_body(columns = c(hello, numbers), rows = language != "English")
  ) |>
  tab_style(
    style = cell_borders(sides = c("left", "right"), style = "dashed"),
    locations = cells_body(columns = hello)
  ) |>
  tab_style(
    style = cell_text(align = "center"),
    locations = cells_column_labels(columns = c(hello, numbers))
  ) |>
  cols_label(
    language = "Language",
    direction = "Reading Direction",
    hello = "Greeting",
    numbers = "Numerals"
  ) |>
  cols_align(align = "center", columns = direction)
```

**gt** addresses these challenges through its locale system. By specifying a locale, table makers can automatically apply the appropriate formatting conventions for their intended audience. Numbers format with the correct separators, dates display in the expected order, and currencies appear with appropriate symbols and positioning. This internationalization support is not merely cosmetic. It's essential for producing tables that communicate clearly across linguistic and cultural boundaries.

The localization challenge extends beyond mere formatting to considerations of what information to include and how to organize it. A table designed for expert readers might use technical abbreviations and assume background knowledge. The same information presented to a general audience might require fuller explanations and more careful labeling. While **gt** cannot make these editorial decisions for you, it provides the flexibility to implement whatever choices you make.

## Tables in the modern data ecosystem

Tables occupy a distinctive position in contemporary data communication. They sit between raw data and visualized insights: more structured than the former, more precise than the latter. In a world where dashboards, infographics, and interactive visualizations attract much attention, tables might seem old-fashioned. But their utility endures precisely because they serve needs that other formats cannot.

When a researcher needs to report exact statistical results, tables are the standard. A coefficient estimate of `0.237` with a standard error of `0.042` cannot be adequately conveyed by a bar chart. The precision matters, and only a table preserves it. When an analyst needs to verify that calculated values match source data, tables provide the transparency that charts cannot. A bar plot shows proportions while a table shows exactly how many observations fall into each category. When a regulatory filing requires specific numbers in specific formats, tables meet the requirement. The austere precision of a well-constructed table has a credibility that no visualization can match.

Tables also serve as a bridge between computational and documentary workflows. Data flows from databases and APIs into analytical environments. Tables allow that data to flow out into reports, presentations, and publications. A table is a snapshot of data at a moment in time, formatted for human comprehension. This is a translation from the machine-readable to the human-readable.

At the same time, the line between tables and visualizations has begun to blur. Modern tables can incorporate color, icons, and embedded charts that add visual dimensions without sacrificing tabular structure. **gt**'s support for nanoplots and inline visualizations reflects this evolution. A column of numbers might be accompanied by a column of sparklines showing trends (a percentage might be visualized as a progress bar within its cell). The table is no longer purely textual as it can combine the precision of numbers with the pattern-revealing power of graphics.

This hybrid approach, tables enhanced with visual elements, represents a synthesis of previously separate traditions. The tabular presentation provides structure, precision, and lookup capability. The visual elements provide pattern recognition and at-a-glance comprehension. Well-designed hybrid tables give readers multiple entry points: they can scan the visual elements to identify interesting patterns, then consult the numbers for precision.

The tools for creating tables have also matured. What once required manual typesetting or laborious formatting can now be accomplished programmatically, with full reproducibility and version control. A table created with **gt** is a piece of code as it can be reviewed, tested, modified, and shared like any other code artifact. This represents a significant advance over the point-and-click table creation that remains common in many workflows. When the data changes, the table regenerates automatically. When a colleague suggests modifications, you can see exactly what changed in version control. When you need to create similar tables for different datasets, you can reuse and adapt the code.

The programmatic approach also enables automation at scale. A single template can generate hundreds of tables for different subsets of data or different reporting periods. Reports that once required days of manual formatting can be produced in minutes. This scalability transforms what tables can accomplish in organizational contexts as they become not just presentation artifacts but components of automated data pipelines.

## Looking ahead

This book is about making effective display tables with **gt**. The chapters that follow will explore the package's capabilities systematically, from basic table construction through advanced formatting, styling, and integration techniques. Along the way, we'll encounter both technical details and design considerations, because effective tables require both.

We'll begin with the fundamental structure of **gt** tables. How to create them from data, how to organize rows and columns, how to add headers and footers. We'll then explore the extensive formatting capabilities that transform raw values into polished presentations: number formatting, date handling, currency display, and more. From there, we'll move to styling which involves colors, fonts, borders, and the visual elements that give tables their distinctive appearance. We'll examine advanced features like embedded visualizations, interactive outputs, and multi-format export. Throughout, we'll consider not just how to use these features but when to use them. Such design principles can distinguish effective tables from mere data dumps.

But before diving into those specifics, it's worth pausing to appreciate what tables represent. They are among humanity's oldest information technologies. Older than writing, older than mathematics as a formal discipline, older than most of the institutions we take for granted. The Babylonian scribes who created multiplication tables four thousand years ago would recognize, in principle, the tables we create today. The rows and columns, the headers and footers, the careful alignment of values: these elements have persisted across millennia because they work. They match how human minds process structured information.

The fact that we're still making tables today, using tools that would be recognizable in principle to a Babylonian scribe, speaks to the enduring power of the basic concept. Technology has changed the production process dramatically but the fundamental format remains. This persistence through technological revolutions suggests that tables tap into something deep about human cognition, something that won't be superseded by the next technological development.

**gt** is the latest contribution to this long tradition. It won't be the last. But it represents a well thought-out synthesis of what has been learned about table design over centuries, combined with the capabilities that modern computing makes possible. The package embodies certain convictions: that tables should be reproducible, that they should be beautiful as well as functional, that their construction should be systematic rather than ad hoc, and that the tools for making them should respect the intelligence of both creators and readers.

The goal of this book is to help you use **gt** effectively for creating tables that inform, clarify, and communicate with the precision and elegance that the format has always promised. Whether you're preparing tables for scientific publication, business reporting, government documentation, or personal projects, the principles are the same: understand your data, respect your audience, and craft your presentation with care. The tools have never been better and the opportunity to create excellent tables has never been more accessible.

Let us begin.

## References

The historical material in this chapter draws on numerous sources. For readers interested in exploring further, the following works provide authoritative treatments of the topics discussed.

### On early mathematical notation and the Ishango bone

- de Heinzelin, Jean. "Ishango". *Scientific American* 206, no. 6 (June 1962): 105–116. The original scholarly publication describing the discovery and interpretation of the Ishango bone.
- Huylebrouck, Dirk. *Africa and Mathematics*. Mathematics, Culture, and the Arts. Cham: Springer International Publishing, 2019. Chapter 9, "Missing Link", provides a comprehensive review of research on the Ishango bone.
- Joseph, George Gheverghese. *The Crest of the Peacock: Non-European Roots of Mathematics*. 3rd ed. Princeton: Princeton University Press, 2011. An essential work on mathematical development across cultures.

### On Babylonian mathematics and astronomical tables

- Neugebauer, Otto. *The Exact Sciences in Antiquity*. 2nd ed. Providence: Brown University Press, 1957. The foundational scholarly work on Babylonian mathematical astronomy.
- Robson, Eleanor. *Mathematics in Ancient Iraq: A Social History*. Princeton: Princeton University Press, 2008. A comprehensive modern treatment of Mesopotamian mathematics.
- Robson, Eleanor. "Tables and Tabular Formatting in Sumer, Babylonia, and Assyria, 2500–50 BCE". In *The History of Mathematical Tables from Sumer to Spreadsheets*, edited by Martin Campbell-Kelly, Mary Croarken, Raymond G. Flood, and Eleanor Robson, 18–47. Oxford: Oxford University Press, 2003. A detailed examination of ancient Mesopotamian tables and their conventions.
- Hunger, Hermann, and David Pingree. *Astral Sciences in Mesopotamia*. Leiden: Brill, 1999. Detailed coverage of MUL.APIN and other astronomical compendia.

### On Egyptian mathematics

- Imhausen, Annette. *Mathematics in Ancient Egypt: A Contextual History*. Princeton: Princeton University Press, 2016.
- Clagett, Marshall. *Ancient Egyptian Science: A Source Book*. Vol. 3, *Ancient Egyptian Mathematics*. Philadelphia: American Philosophical Society, 1999.

### On Greek astronomy and Ptolemy

- Toomer, G. J., trans. *Ptolemy's Almagest*. London: Duckworth, 1984. The standard English translation.
- Jones, Alexander. "The Adaptation of Babylonian Methods in Greek Numerical Astronomy". *Isis* 82, no. 3 (1991): 441–453.

### On Islamic astronomical tables

- Kennedy, E. S. "A Survey of Islamic Astronomical Tables." *Transactions of the American Philosophical Society* 46, no. 2 (1956): 123–177. The classic survey of *Zij* literature.
- Saliba, George. *Islamic Science and the Making of the European Renaissance*. Cambridge, MA: MIT Press, 2007.

### On the history of accounting and double-entry bookkeeping

- Pacioli, Luca. *Summa de Arithmetica, Geometria, Proportioni et Proportionalita*. Venice, 1494. The work that systematized double-entry bookkeeping.
- Sangster, Alan, Greg N. Stoner, and Patricia McCarthy. "The Market for Luca Pacioli's Summa Arithmetica." *Accounting Historians Journal* 35, no. 1 (2008): 111–134.

### On logarithms and mathematical tables

- Napier, John. *Mirifici Logarithmorum Canonis Descriptio*. Edinburgh, 1614.
- Roegel, Denis. "Napier's Ideal Construction of the Logarithms." LOCOMAT project, 2012. Available at: https://locomat.loria.fr.
- Campbell-Kelly, Martin, et al., eds. *The History of Mathematical Tables: From Sumer to Spreadsheets*. Oxford: Oxford University Press, 2003. An excellent collection covering tables from antiquity through the computer age.

### On navigation tables and human computers

- Maskelyne, Nevil, ed. *The Nautical Almanac and Astronomical Ephemeris for the Year 1767*. London: Order of the Commissioners of Longitude, 1766. The first edition of the British Nautical Almanac.
- Grier, David Alan. *When Computers Were Human*. Princeton: Princeton University Press, 2005. A fascinating history of human computation, including the production of mathematical and navigation tables.

### On railway timetables

- Bradshaw, George. *Bradshaw's Railway Time Tables and Assistant to Railway Travelling*. Manchester, 1839. The first edition of the famous guide.
- Simmons, Jack. *The Victorian Railway*. London: Thames and Hudson, 1991.

### On cognitive science and information processing

- Miller, George A. "The Magical Number Seven, Plus or Minus Two: Some Limits on Our Capacity for Processing Information". *Psychological Review* 63, no. 2 (1956): 81–97. The classic paper on working memory capacity.
- Tufte, Edward R. *The Visual Display of Quantitative Information*. 2nd ed. Cheshire, CT: Graphics Press, 2001.

### On table design principles

- Ehrenberg, A. S. C. "Rudiments of Numeracy". *Journal of the Royal Statistical Society, Series A* 140, no. 3 (1977): 277–297.
- Ehrenberg, A. S. C. "The Problem of Numeracy". *The American Statistician* 35, no. 2 (1981): 67–71.
- Wainer, Howard. "How to Display Data Badly". *The American Statistician* 38, no. 2 (1984): 137–147.

### On the history of statistics and quantification

- Best, Joel. *Damned Lies and Statistics: Untangling Numbers from the Media, Politicians, and Activists*. Berkeley: University of California Press, 2001. An accessible examination of how statistics can mislead, with particular attention to how tabular presentation creates an illusion of precision.
- Porter, Theodore M. *Trust in Numbers: The Pursuit of Objectivity in Science and Public Life*. Princeton: Princeton University Press, 1995.
- Desrosières, Alain. *The Politics of Large Numbers: A History of Statistical Reasoning*. Translated by Camille Naish. Cambridge, MA: Harvard University Press, 1998.

### On early computing and table generation

- Goldstine, Herman H. *The Computer from Pascal to von Neumann*. Princeton: Princeton University Press, 1972.
- Ceruzzi, Paul E. *A History of Modern Computing*. 2nd ed. Cambridge, MA: MIT Press, 2003.

### On the foundational work for **gt**

- Jenkinson, Bruce L. *Manual of Tabular Presentation: An Outline of Theory and Practice in the Presentation of Statistical Data in Tables for Publication*. Washington, DC: U.S. Bureau of the Census, 1949. The 266-page government manual that established terminology and principles for table design that remain influential today.


---


# Table components {#sec-table-components}


It can be useful to identify the components that make up a table before getting into the nitty gritty of generating tables. Why? This will give us a language to speak about table composition and, in doing so, we'll discover the merits of the different components, how they work together, and finally understand how to make effective table visualizations when the time comes. Tabular presentation can serve several purposes. We may want to present raw data values in unvarnished form, so that others can perform analyses from that data. We could also prepare a set of summarized results and tabulate that; this provides the reader with the results of an analysis. We could even produce a table with varied information on a particular topic and present it in a visually appealing way. With creativity and an eye to aesthetics, the reader will linger for a bit and explore the presented data, perhaps leaving with heightened understanding of the topic at hand and a feeling of edification.  

The **gt** package can make all of this possible. The general principle is that we combine table components together and refine the presentation bit by bit. We've prepared a basic diagram here, showing how the main components of a table (and their subcomponents) fit together:

Here is a listing of the table components (from top to bottom):

- the Table Header (optional; with a title and possibly a subtitle)
- the Stub and the Stub Head (optional; contains row labels, optionally within row groups having row group labels and possibly summary labels when a summary is present)
- the Column Labels (contains column labels, optionally under spanner column labels)
- the Table Body (contains columns and rows of cells)
- the Table Footer (optional; possibly with footnotes and source notes)

Once we have the input data for the table to present, we need to decide which of these components should be used. This chapter will show you how to introduce the input data to **gt** and how to add the various components together. Generally, the functions that produce or modify these table components will begin with `tab_*()` and the components will only be displayed when there is content for them (e.g., there won't be a table footer unless you use a function that adds content to a footer). Now let's get to making **gt** tables by starting with the very important, entry-point function: `gt()`.

## Making a **gt** table: start with `gt()`

When one provides table data to the `gt()` function, it generates a **gt** table object. This function is the initial step in a typical **gt** workflow. Once you possess the **gt** table object, you have the ability to perform styling transformations before rendering it as a display table of different formats.

Here is the function’s signature:

```r
gt(
  data,
  rowname_col = NULL,
  groupname_col = dplyr::group_vars(data),
  omit_na_group = FALSE,
  process_md = FALSE,
  caption = NULL,
  rownames_to_stub = FALSE,
  row_group_as_column = FALSE,
  auto_align = TRUE,
  id = NULL,
  locale = getOption("gt.locale"),
  row_group.sep = getOption("gt.row_group.sep", " - ")
)
```

Let's use the `exibble` dataset for the next few examples, we'll learn how to make simple **gt** tables with the `gt()` function. The most basic thing to do is to just use `gt()` with the dataset as the input.

```{r}
exibble |> gt()
```

From this, we get a very simple table with column labels and all of the body cells below. This is the simplest form of a **gt** table: it doesn't restructure the data at all and closely resembles what you'd see when printing a tibble or data frame in the R console. The key difference is that you now have a presentation-ready table that can be rendered in HTML, PDF, or other formats. While this basic output is functional, the `gt()` function offers several arguments that let you add structure and context to your table right from the start.

This dataset has the row and group columns. The former contains unique values that are ideal for labeling rows, and this often happens in what is called the 'stub' (a reserved area that serves to label rows). With the `gt()` function, we can immediately place the contents of the row column into the stub column. To do this, we use the `rowname_col` argument with the name of the column to use in quotes.

```{r}
exibble |> gt(rowname_col = "row")
```

This sets up a table with a stub, the row labels are placed within the stub column, and a vertical dividing line has been placed on the right-hand side.

The `group` column can be used to divide the rows into discrete groups. Within that column, we see repetitions of the values `"grp_a"` and `"grp_b"`. These serve both as ID values and the initial label for the groups. With the `groupname_col` argument in `gt()`, we can set up the row groups immediately upon creation of the table.

```{r}
exibble |>
  gt(
    rowname_col = "row",
    groupname_col = "group"
  )
```

If you'd rather perform the set up of row groups later (i.e., not in the `gt()` call), this is possible with use of the `tab_row_group()` function (and `row_group_order()` can help with the arrangement of row groups).

One more thing to consider with row groups is their layout. By default, row group labels reside in separate rows the appear above the group. However, we can use the `row_group_as_column = TRUE` option to put the row group labels within a secondary column within the table stub.

```{r}
exibble |>
  gt(
    rowname_col = "row",
    groupname_col = "group",
    row_group_as_column = TRUE
  )
```

This could be done later if need be, and using `tab_options(row_group.as_column = TRUE)` would be the way to do it outside of the `gt()` call.

### Multi-column stubs for hierarchical row labels

When your data has natural hierarchical structure, you can create a multi-column stub by passing a vector of column names to `rowname_col`. This feature is particularly useful for financial reports with account hierarchies, clinical trial tables with multiple levels of categorization, or any situation where rows have parent-child relationships.

Let's create a dataset with a two-level hierarchy (region and category) and display it with a multi-column stub:

```{r}
sales_data <- dplyr::tibble(
  region = c("North", "North", "North", "South", "South", "South"),
  category = c("Electronics", "Clothing", "Food", "Electronics", "Clothing", "Food"),
  Q1 = c(45000, 32000, 28000, 38000, 41000, 35000),
  Q2 = c(48000, 35000, 30000, 42000, 39000, 37000),
  Q3 = c(52000, 38000, 32000, 45000, 43000, 39000),
  Q4 = c(58000, 42000, 35000, 48000, 46000, 41000)
)

sales_data |>
  gt(rowname_col = c("region", "category")) |>
  tab_header(
    title = "Quarterly Sales by Region and Category",
    subtitle = "All values in USD"
  ) |>
  fmt_currency(columns = everything(), currency = "USD", decimals = 0) |>
  tab_stubhead(label = c("Region", "Category")) |>
  tab_style(
    style = cell_fill(color = "gray95"),
    locations = cells_stub()
  )
```

The multi-column stub creates a clean visual hierarchy. Notice that repeating values in the first stub column (the region) are automatically consolidated, making it clear which categories belong to each region. The `tab_stubhead()` function also accepts a vector of labels, one for each level of the hierarchy.

This feature works seamlessly with formatting and styling functions. The stub columns are treated as a unit, allowing you to apply styles to the entire stub area while still being able to reference individual stub columns when needed.

### Additional `gt()` options

Some datasets have rownames built in (`mtcars` famously has the car model names as the rownames). To use those rownames as row labels in the stub, the `rownames_to_stub = TRUE` option will prove to be useful.

```{r}
head(mtcars, 10) |> gt(rownames_to_stub = TRUE)
```

By default, values in the body of a **gt** table (and their column labels) are automatically aligned. The alignment is governed by the types of values in a column. If you'd like to disable this form of auto-alignment, the `auto_align = FALSE` option can be taken.

```{r}
exibble |> gt(rowname_col = "row", auto_align = FALSE)
```

What you'll get from that is center-alignment of all table body values and all column labels. Note that row labels in the the stub are still left-aligned (though it's hard to see that in the previous example); `auto_align` has no effect on alignment within the table stub. It's generally not recommended to use `auto_align = FALSE` since the the automatic alignment choices are quite reasonable for most tables.

However which way you generate the initial **gt** table object, you can use it with a huge variety of functions in the package to further customize the presentation. Formatting body cells is commonly done with the family of formatting functions (e.g., `fmt_number()`, `fmt_date()`, etc.). The package supports formatting with internationalization ('i18n' features) and so locale-aware functions come with a locale argument. To avoid having to use that argument repeatedly, the `gt()` function has its own locale argument. Setting a locale in that will make it available globally. Here's an example of how that works in practice when setting `locale = "fr"` in `gt()` and using formatting functions:

```{r}
exibble |>
  gt(
    rowname_col = "row",
    groupname_col = "group",
    locale = "fr"
  ) |>
  fmt_number() |>
  fmt_date(
    columns = date,
    date_style = "yMEd"
  ) |>
  fmt_datetime(
    columns = datetime,
    format = "EEEE, MMMM d, y",
    locale = "en"
  )
```

In this example, the `fmt_number()` and `fmt_date()` functions understand that the locale for this table is `"fr"` (French), so the appropriate formatting for that locale is apparent in the `num`, `currency`, and `date` columns. However in the `fmt_datetime()` call, we explicitly use the `"en"` (English) locale. This overrides the `"fr"` default set for this table and the end result is dates formatted with the English locale in the datetime column.

The `process_md` argument controls whether the contents of `rowname_col` and `groupname_col` should be interpreted as Markdown. By default (`FALSE`), the text appears literally. When set to `TRUE`, **gt** will render Markdown syntax in your row labels and row group labels. This is useful when your stub or grouping data contains formatted text.

```{r}
dplyr::tibble(
  item = c("**Premium** Widget", "*Standard* Widget", "Basic Widget"),
  category = c("**Featured**", "**Featured**", "Regular"),
  price = c(99.99, 49.99, 19.99)
) |>
  gt(rowname_col = "item", groupname_col = "category", process_md = TRUE) |>

  tab_header(title = "Product Catalog") |>
  fmt_currency(columns = price)
```

Without `process_md = TRUE`, you would see the literal Markdown syntax (e.g., `**Premium** Widget` instead of **Premium** Widget) in the stub and row group labels. Note that `process_md` specifically affects the `rowname_col` and `groupname_col` content; for Markdown in other parts of the table (like column labels or headers), use the `md()` helper function. If you need Markdown text in the table body cells to be rendered, use the `fmt_markdown()` formatting function, which is covered in @sec-formatting-dates-text.

## The table header and footer

It's possible to add a table header to the **gt** table, which includes a title and even a subtitle. The table header is an optional component of the table that appears above the column labels. You have the flexibility to use Markdown formatting for the header's title and subtitle, allowing for greater customization. Additionally, if you intend to use HTML output for the table, you may utilize HTML in either the title or subtitle.

### `tab_header()`

The `tab_header()` function adds a header section to your **gt** table, which can include a title and subtitle. These elements appear above the column labels and help provide context for the data presented. The header is particularly useful for giving tables descriptive names, explaining their purpose, or noting important details about the data source or time period.

Here is the function's signature:

```r
tab_header(
  data,
  title,
  subtitle = NULL,
  preheader = NULL
)
```

Use the `gtcars` dataset to create a **gt** table. Add a header part to the table with the `tab_header()` function. We'll add a title and the optional subtitle as well. With the `md()` helper function, we can make sure the Markdown formatting is interpreted and transformed.

```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice(1:5) |>
  gt() |>
  tab_header(
    title = md("Data listing from **gtcars**"),
    subtitle = md("`gtcars` is an R dataset")
  )
```

If the table is intended solely as an HTML table, you could introduce your own HTML elements into the header. You can even use the **htmltools** package to help arrange and generate the HTML. Here's an example of that, where two `<div>` elements are placed in a `htmltools::tagList()`.

```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice(1:5) |>
  gt() |>
  tab_header(
    title =
      htmltools::tagList(
        htmltools::tags$div(
          style = htmltools::css(
            `text-align` = "center"
          ),
          htmltools::HTML(
            web_image("https://www.r-project.org/logo/Rlogo.png")
          )
        ),
        htmltools::tags$div(
          "Data listing from ",
          htmltools::tags$strong("gtcars")
        )
      )
  )
```

If using HTML but doing something far simpler, we can use the `html()` helper function to declare that the text provided is HTML.

```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice(1:5) |>
  gt() |>
  tab_header(
    title = html("Data listing from <strong>gtcars</strong>"),
    subtitle = html("From <span style='color:red;'>gtcars</span>")
  )
```

The `html()` helper function tells **gt** to interpret the provided text as raw HTML, allowing for direct use of HTML tags like `<strong>` for bold text and `<span>` with inline styles for colored text. This approach gives you precise control over formatting when creating HTML output.

### `opt_align_header()`

By default, table headers are center-aligned, which works well for most tables. However, sometimes you may want to align the header text to the left or right to match your table's overall design or to create a specific visual effect.

Here is the function's signature:

```r
opt_align_table_header(
  data,
  align = c("left", "center", "right")
)
```

The table header that is appended to a **gt** table typically has center alignment for both the title and subtitle elements. However, it is possible to adjust the horizontal alignment of the title and subtitle by utilizing the `align` argument. This function provides a quick and easy means to set the alignment to the left or right. It also serves as a convenient shortcut for `<gt_tbl> |> tab_options(heading.align = <align>)`.

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_header(
    title = "The title of the table",
    subtitle = "The table's subtitle"
  ) |>
  opt_align_table_header(align = "left")
```

The title and subtitle now align to the left edge of the table, creating a more document-like appearance. Left-aligned headers work well when the table is part of a larger report or when you want to establish a clear reading direction from left to right.

## Adding *source notes* to the footer of the table

The footer section of a table sits beneath the table body and provides space for supplementary information. Source notes are one type of footer content. They typically cite data origins, provide general disclaimers, or offer context that applies to the entire table. Unlike footnotes (which link to specific cells via marks), source notes stand alone as general commentary.

### `tab_source_note()`

It's possible to add a source note to the footer part of the **gt** table with `tab_source_note()`. Several of these can be added to the footer and, to do that, we can simply use multiple calls of `tab_source_note()` (they will be inserted in the order provided). We can use Markdown formatting for the note, or, if the table is intended for HTML output, we can include HTML formatting.

Here is the function's signature:

```r
tab_source_note(
  data,
  source_note
)
```

With three columns from the `gtcars` dataset, let's create a **gt** table. We can use the `tab_source_note()` function to add a source note to the table footer. Here we are citing the data source but this function can be used for any text you'd prefer to display in the footer section.

```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice(1:5) |>
  gt() |>
  tab_source_note(source_note = "From edmunds.com")
```

The `md()` and `html()` helper functions work with source notes, allowing you to add styled text, links, or other formatting. Here's an example using Markdown to create a clickable link:

```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice(1:5) |>
  gt() |>
  tab_source_note(
    source_note = md("Data from [edmunds.com](https://www.edmunds.com), 2015.")
  ) |>
  tab_source_note(
    source_note = md("*Prices shown are MSRP in USD.*")
  )
```

This example demonstrates two source notes added in sequence, both using Markdown formatting. The first contains a hyperlink, and the second uses italics. For HTML-specific formatting, you could use `html()` instead:
 
```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice(1:5) |>
  gt() |>
  tab_source_note(
    source_note = html(
      "Data from <a href='https://www.edmunds.com'>edmunds.com</a>",
      "<span style='color: gray;'>(retrieved 2015)</span>"
    )
  )
```

Source notes provide a clean way to document your data's provenance and add necessary context without cluttering the table itself. They appear in a dedicated footer area, visually separated from the data, making it clear that this information applies to the table as a whole rather than to specific cells or values.

## Grouping together column labels with spanners

Column spanners are horizontal labels that stretch across multiple columns, grouping them under a common heading. They create visual hierarchy in the boxhead (the part of the table containing column labels) and help readers understand relationships between columns. For example, columns showing different years of population data might be grouped under a `"Population"` spanner, while density columns might share a `"Density"` spanner.

The part of the table that contains, at a minimum, column labels and, optionally, spanner labels is sometimes called the table boxhead. A spanner will occupy space over any number of contiguous column labels. With the `tab_spanner()` function, you can insert a spanner in the boxhead part of a **gt** table. This function allows for mapping to be defined by column names, existing spanner ID values, or a mixture of both. 

### `tab_spanner()`

With the `tab_spanner()` function, you can insert a spanner above column labels or existing spanners in the boxhead part of a **gt** table.

Here is the function's signature:

```r
tab_spanner(
  data,
  label,
  columns = NULL,
  spanners = NULL,
  level = NULL,
  id = label,
  gather = TRUE,
  replace = FALSE
)
```

The spanners are placed in the order of calling `tab_spanner()` so if a later call uses the same columns in its definition (or even a subset) as the first invocation, the second spanner will be overlaid atop the first. Options exist for forcibly inserting a spanner underneath other (with `level` as space permits) and with `replace`, which allows for full or partial spanner replacement.

Let's create a **gt** table using a small portion of the `gtcars` dataset. Over several columns (`hp`, `hp_rpm`, `trq`, `trq_rpm`, `mpg_c`, `mpg_h`) we'll use `tab_spanner()` to add a spanner with the label `"performance"`. This effectively groups together several columns related to car performance under a unifying label.

```{r}
gtcars |>
  dplyr::select(
    year, model, bdy_style, starts_with(c("hp", "trq", "mpg")), msrp
  ) |>
  dplyr::slice(1:8) |>
  gt(rowname_col = "model") |>
  tab_spanner(
    label = "performance",
    columns = starts_with(c("hp", "trq", "mpg"))
  )
```

Notice that in the above table code, we used the `starts_with()` selection helper in both the **dplyr** `select()` statement and in the **gt** `tab_spanner()` statement. Such use of tidyselect selection helpers is incredibly helpful for shortening the amount of code supplied in the `columns` argument across many **gt** functions.

With the default `gather = TRUE` option, columns selected for a particular spanner will be moved so that there is no separation between them. This can be seen with the example below that uses a subset of the `towny` dataset. The starting column order is `name`, `latitude`, `longitude`, `population_2016`, `density_2016`, `population_2021`, and `density_2021`. The first two uses of `tab_spanner()` deal with making separate spanners for the two population and two density columns. After their use, the columns are moved to this new ordering: `name`, `latitude`, `longitude`, `population_2016`, `population_2021`, `density_2016`, and `density_2021`. The third and final call of `tab_spanner()` doesn't further affect the ordering of columns.

```{r}
towny |>
  dplyr::arrange(desc(population_2021)) |>
  dplyr::slice_head(n = 5) |>
  dplyr::select(
    name, latitude, longitude,
    ends_with("2016"), ends_with("2021")
  ) |>
  gt() |>
  tab_spanner(
    columns = starts_with("pop"),
    label = "Population"
  ) |>
  tab_spanner(
    columns = starts_with("den"),
    label = "Density"
  ) |>
  tab_spanner(
    columns = ends_with("itude"),
    label = md("*Location*"),
    id = "loc"
  )
```

While columns are moved, it is only the minimal amount of moving required (pulling in columns from the right) to ensure that columns are gathered under the appropriate spanners. With the last call, there are two more things to note: (1) `label` values can use the `md()` (or `html()`) helper functions to help create styled text, and (2) an `id` value may be supplied for reference later (e.g., for styling with `tab_style()` or applying footnotes with `tab_footnote()`).

It's possible to stack multiple spanners atop each other with consecutive calls of `tab_spanner()`. It's a bit like playing Tetris: putting a spanner down anywhere there is another spanner (i.e., there are one or more shared columns) means that second spanner will reside a level above prior. Let's look at a few examples at how this works, and we'll also explore a few lesser-known placement tricks. Let's use a cut down version of `exibble` for this, set up a few level-one spanners, and then place a level two spanner over two other spanners.

```{r}
exibble_narrow <- exibble |> dplyr::slice_head(n = 3)

exibble_narrow |>
  gt() |>
  tab_spanner(
    label = "Row Information",
    columns = c(row, group)
  ) |>
  tab_spanner(
    label = "Numeric Values",
    columns = where(is.numeric),
    id = "num_spanner"
  ) |>
  tab_spanner(
    label = "Text Values",
    columns = c(char, fctr),
    id = "text_spanner"
  ) |>
  tab_spanner(
    label = "Numbers and Text",
    spanners = c("num_spanner", "text_spanner")
  )
```

In the above example, we used the `spanners` argument to define where the `"Numbers and Text"`-labeled spanner should reside. For that, we supplied the `"num_spanner"` and `"text_spanner"` ID values for the two spanners associated with the `num`, `currency`, `char`, and `fctr` columns. Alternatively, we could have given those column names to the `columns` argument and achieved the same result. You could actually use a combination of `spanners` and `columns` to define where the spanner should be placed. Here is an example of just that:

```{r}
exibble_narrow_gt <-
  exibble_narrow |>
  gt() |>
  tab_spanner(
    label = "Numeric Values",
    columns = where(is.numeric),
    id = "num_spanner"
  ) |>
  tab_spanner(
    label = "Text Values",
    columns = c(char, fctr),
    id = "text_spanner"
  ) |>
  tab_spanner(
    label = "Text, Dates, Times, Datetimes",
    columns = contains(c("date", "time")),
    spanners = "text_spanner"
  )
  
exibble_narrow_gt
```

And, again, we could have solely supplied all of the column names to `columns` instead of using this hybrid approach, but it is interesting to express the definition of spanners with this flexible combination. What if you wanted to extend the above example and place a spanner above the `date`, `time`, and `datetime` columns? If you tried that in the manner as exemplified above, the spanner will be placed in the third level of spanners:

```{r}
exibble_narrow_gt |>
  tab_spanner(
    label = "Date and Time Columns",
    columns = contains(c("date", "time")),
    id = "date_time_spanner"
  )
```

Remember that the approach taken by `tab_spanner()` is to keep stacking atop existing spanners. But, there is space next to the `"Text Values"` spanner on the first level. You can either revise the order of `tab_spanner()` calls, or, use the `level` argument to force the spanner into that level (so long as there is space).

```{r}
exibble_narrow_gt |>
  tab_spanner(
    label = "Date and Time Columns",
    columns = contains(c("date", "time")),
    level = 1,
    id = "date_time_spanner"
  )
```

That puts the spanner in the intended level. If there aren't free locations available in the `level` specified you'll get an error stating which columns cannot be used for the new spanner (this can be circumvented, if necessary, with the `replace = TRUE` option). If you choose a level higher than the maximum occupied, then the spanner will be dropped down. Again, these behaviors are indicative of Tetris-like rules though they tend to work well for the application of spanners.

### `tab_spanner_delim()`

The `cols_spanner_delim()` function can take specially-crafted column names and generate one or more spanner column labels (along with relabeling the column labels).

Here is the function's signature:

```r
tab_spanner_delim(
  data,
  delim,
  columns = everything(),
  split = c("last", "first"),
  limit = NULL,
  reverse = FALSE
)
```

This is done by splitting the column name by a specified delimiter character (this is the `delim`) and placing the fragments from top to bottom (i.e., higher-level spanners to the column labels). Furthermore, the neighboring text fragments on different spanner levels will be coalesced together to put the span back into spanner. For instance, having the three side-by-side column names `rating_1`, `rating_2`, and `rating_3` will (in the default case at least) result in a spanner with the label `"rating"` above columns with the labels `"1"`, `"2"`, and `"3"`.

If we take a hypothetical table that includes the column names `province.NL_ZH.pop`, `province.NL_ZH.gdp`, `province.NL_NH.pop`, and `province.NL_NH.gdp`, we can see that we have a naming system that has a well-defined structure. We start with the more general to the left (`"province"`) and move to the more specific on the right (`"pop"`). If the columns are in the table in this exact order, then things are in an ideal state as the eventual spanner column labels will form from this neighboring. When using `tab_spanner_delim()` here with delim set as "." we get the following text fragments:

`province.NL_ZH.pop` -> `"province"`, `"NL_ZH"`, `"pop"`

`province.NL_ZH.gdp` -> `"province"`, `"NL_ZH"`, `"gdp"`

`province.NL_NH.pop` -> `"province"`, `"NL_NH"`, `"pop"`

`province.NL_NH.gdp` -> `"province"`, `"NL_NH"`, `"gdp"`

This gives us the following arrangement of column labels and spanner labels:

```
--------- `"province"` ---------- <- level 2 spanner
---`"NL_ZH"`--- | ---`"NL_NH"`--- <- level 1 spanners
`"pop"`|`"gdp"` | `"pop"`|`"gdp"` <- column labels
---------------------------------
```

There might be situations where the same delimiter is used throughout but only the last instance requires a splitting. With a pair of column names like `north_holland_pop` and `north_holland_area` you would only want `"pop"` and `"area"` to be column labels underneath a single spanner (`"north_holland"`). To achieve this, the split and limit arguments are used and the values for each need to be `split = "last"` and `limit = 1`. This will give us the following arrangement:

```
--`"north_holland"`-- <- level 1 spanner
 `"pop"`  |  `"area"` <- column labels
---------------------
```

With a subset of the towny dataset, we can create a **gt** table and then use the `tab_spanner_delim()` function to automatically generate column spanner labels. In this case we have some column names in the form `population_<year>`. The underscore character is the delimiter that separates a common word `"population"` and a year value. In this default way of splitting, fragments to the right are lowest (really they become new column labels) and moving left we get spanners. Let's have a look at how `tab_spanner_delim()` handles these column names:

```{r}
towny_subset_gt <-
  towny |>
  dplyr::select(name, starts_with("population")) |>
  dplyr::filter(grepl("^F", name)) |>
  gt() |>
  tab_spanner_delim(delim = "_") |>
  fmt_integer()

towny_subset_gt
```

The spanner created through this use of `tab_spanner_delim()` is automatically given an ID value by **gt**. Because it's hard to know what the ID value is, we can use `tab_info()` to inspect the table's indices and ID values.

```{r}
towny_subset_gt |> tab_info()
```

From this informational table, we see that the ID for the spanner is `"spanner-population_1996"`. Also, the columns are still accessible by the original column names (`tab_spanner_delim()` did change their labels though). Let's use `tab_style()` to add some styles to the `towny_subset_gt` table.

```{r}
towny |>
  dplyr::select(name, starts_with("population")) |>
  dplyr::filter(grepl("^F", name)) |>
  gt() |>
  tab_spanner_delim(delim = "_") |>
  fmt_integer() |>
  tab_style(
    style = cell_fill(color = "aquamarine"),
    locations = cells_body(columns = population_2021)
  ) |>
  tab_style(
    style = cell_text(transform = "capitalize"),
    locations = cells_column_spanners(spanners = "spanner-population_1996")
  )
```

We can plan ahead a bit and refashion the column names with **dplyr** before introducing the table to `gt()` and `tab_spanner_delim()`. Here the column labels have underscore delimiters where splitting is not wanted (so a period or space character is used instead). The usage of `tab_spanner_delim()` gives two levels of spanners. We can further touch up the labels after that with `cols_label_with()` and `text_transform()`.

```{r}
towny |>
  dplyr::arrange(desc(population_2021)) |>
  dplyr::slice_head(n = 5) |>
  dplyr::select(name, ends_with("pct")) |>
  dplyr::rename_with(
    .fn = function(x) {
      x |>
        gsub("(.*?)_(\\d{4})", "\\1.\\2", x = _) |>
        gsub("pop_change", "Population Change", x = _)
    }
  ) |>
  gt(rowname_col = "name") |>
  tab_spanner_delim(delim = "_") |>
  fmt_number(decimals = 1, scale_by = 100) |>
  cols_label_with(
    fn = function(x) gsub("pct", "%", x)
  ) |>
  text_transform(
    fn = function(x) gsub("\\.", " - ", x),
    locations = cells_column_spanners()
  ) |>
  tab_style(
    style = cell_text(align = "center"),
    locations = cells_column_labels()
  ) |>
  tab_style(
    style = "padding-right: 36px;",
    locations = cells_body()
  )
```

With a summarized, filtered, and pivoted version of the `pizzaplace` dataset, we can create another **gt** table and then use the `tab_spanner_delim()` function with the same delimiter/separator that was used in the **tidyr** `pivot_wider()` call. We can also process the generated column labels with `cols_label_with()`.

```{r}
pizzaplace |>
  dplyr::select(name, date, type, price) |>
  dplyr::group_by(name, date, type) |>
  dplyr::summarize(revenue = sum(price), sold = n(), .groups = "drop") |>
  dplyr::filter(date %in% c("2015-01-01", "2015-01-02", "2015-01-03")) |>
  dplyr::filter(type %in% c("classic", "veggie")) |>
  tidyr::pivot_wider(
    names_from = date,
    names_sep = ".",
    values_from = c(revenue, sold),
    values_fn = sum,
    names_sort = TRUE
  ) |>
  gt(rowname_col = "name", groupname_col = "type") |>
  tab_spanner_delim(delim = ".") |>
  sub_missing(missing_text = "") |>
  fmt_currency(columns = starts_with("revenue")) |>
  data_color(
    columns = starts_with("revenue"),
    method = "numeric",
    palette = c("white", "lightgreen")
  ) |>
  cols_label_with(
    fn = function(x) {
      paste0(x, " (", vec_fmt_datetime(x, format = "E"), ")")
    }
  )
```

This example demonstrates a sophisticated workflow combining pivoting, delimiter-based spanners, and dynamic label generation. The `pivot_wider()` creates columns like `revenue.2015-01-01` and `sold.2015-01-01`, which `tab_spanner_delim()` splits into spanners (`revenue`, `sold`) and column labels (the dates). The `cols_label_with()` function then appends the day of the week to each date label, producing labels like `"2015-01-01 (Thu)"`. The `data_color()` call adds a subtle green gradient to revenue cells, making it easy to spot higher-performing days at a glance.

## The stub and row groups

The stub is a special column (or set of columns) on the left side of the table that holds row labels. When present, the stub serves as an identifier for each row, similar to how column labels identify columns. Row groups take this organization further by dividing rows into named sections, each with its own header row. Together, the stub and row groups create vertical structure in a table, making it easier to navigate and understand large datasets.

The stub is created when you designate a column for row labels using `rowname_col` in `gt()`. Once a stub exists, you can add a stubhead label (a header for the stub column itself) and organize rows into groups. Row groups appear as labeled sections that visually separate different categories of data.

### `tab_row_group()`

Create a row group with a collection of rows. This requires specification of the rows to be included, either by supplying row labels, row indices, or through use of a select helper function like `starts_with()`.

Here is the function's signature:

```r
tab_row_group(
  data,
  label,
  rows,
  id = label
)
```

To set a default row group label for any rows not formally placed in a row group, we can use a separate call to `tab_options(row_group.default_label = <label>)`. If this is not done and there are rows that haven't been placed into a row group (where one or more row groups already exist), those rows will be automatically placed into a row group without a label. To restore labels for row groups not explicitly assigned a group, `tab_options(row_group.default_label = "")` can be used.

Using a subset of the `gtcars` dataset, let's create a simple **gt** table with row labels (from the `model` column) inside of a stub. This eight-row table begins with no row groups at all but with a single use of the `tab_row_group()` function, we can specify a row group that will contain any rows where the car model begins with a number.

```{r}
gtcars |>
  dplyr::select(model, year, hp, trq) |>
  dplyr::slice(1:8) |>
  gt(rowname_col = "model") |>
  tab_row_group(
    label = "numbered",
    rows = matches("^[0-9]")
  )
```

This actually makes two row groups since there are row labels that don't begin with a number. That second row group is a catch-all `NA` group, and it doesn't display a label at all. Rather, it is set off from the other group with a double line. This may be a preferable way to display the arrangement of one distinct group and an 'others' or default group. If that's the case but you'd like the order reversed, the `row_group_order()` function can be used for that.

```{r}
gtcars |>
  dplyr::select(model, year, hp, trq) |>
  dplyr::slice(1:8) |>
  gt(rowname_col = "model") |>
  tab_row_group(
    label = "numbered",
    rows = matches("^[0-9]")
  ) |>
  row_group_order(groups = c(NA, "numbered"))
```

Two more options include: (1) setting a default label for the 'others' group (done through `tab_options()]`, and (2) creating row groups until there are no more unaccounted for rows. Let's try the first option in the next example:

```{r}
gtcars |>
  dplyr::select(model, year, hp, trq) |>
  dplyr::slice(1:8) |>
  gt(rowname_col = "model") |>
  tab_row_group(
    label = "numbered",
    rows = matches("^[0-9]")
  ) |>
  row_group_order(groups = c(NA, "numbered")) |>
  tab_options(row_group.default_label = "others")
```

The above use of the `row_group.default_label` in `tab_options()` gets the job done and provides a default label. One drawback is that the default/`NA` group doesn't have an ID, so it can't as easily be styled with `tab_style()`; however, row groups have indices and the index for the `"others"` group here is `1`.

```{r}
gtcars |>
  dplyr::select(model, year, hp, trq) |>
  dplyr::slice(1:8) |>
  gt(rowname_col = "model") |>
  tab_row_group(
    label = "numbered",
    rows = matches("^[0-9]")
  ) |>
  row_group_order(groups = c(NA, "numbered")) |>
  tab_options(row_group.default_label = "others") |>
  tab_style(
    style = cell_fill(color = "bisque"),
    locations = cells_row_groups(groups = 1)
  ) |>
  tab_style(
    style = cell_fill(color = "lightgreen"),
    locations = cells_row_groups(groups = "numbered")
  )
```

Another way to handle rows with `NA` values in the grouping column is through the `omit_na_group` argument in `gt()`. By default (`FALSE`), rows with `NA` in the `groupname_col` are assigned to a group labeled `"NA"`. Setting `omit_na_group = TRUE` causes those rows to appear as ungrouped rows in the table body instead. This is useful when you want certain rows to stand apart from any row group, perhaps as header rows or separators.

Let's see how this works. First, we'll create a dataset where some rows have `NA` for the group column:

```{r}
data_with_na_group <- 
  dplyr::tibble(
    item = c("Category A Items", "Widget", "Gadget", "Category B Items", "Sprocket", "Cog"),
    group = c(NA, "A", "A", NA, "B", "B"),
    value = c(NA, 100, 150, NA, 200, 175)
  )

data_with_na_group |>
  gt(rowname_col = "item", groupname_col = "group")
```

With the default behavior, the rows with `NA` in the group column are placed in an `"NA"` group. Now let's use `omit_na_group = TRUE` to have those rows appear outside of any group:

```{r}
data_with_na_group |>
  gt(
    rowname_col = "item",
    groupname_col = "group",
    omit_na_group = TRUE
  )
```

The rows that had `NA` for their group now appear as ungrouped rows, visually distinct from the grouped content. This pattern is particularly useful when you want to include descriptive header rows or section dividers that logically shouldn't belong to any data group.

Now let's try using `tab_row_group()` with our `gtcars`-based table such that all rows are formally assigned to different row groups. We'll define two row groups with the (Markdown-infused) labels `"**Powerful Cars**"` and `"**Super Powerful Cars**"`. The distinction between the groups is whether `hp` is lesser or greater than `600` (and this is governed by the expressions provided to the `rows` argument).

```{r}
gtcars |>
  dplyr::select(model, year, hp, trq) |>
  dplyr::slice(1:8) |>
  gt(rowname_col = "model") |>
  tab_row_group(
    label = md("**Powerful Cars**"),
    rows = hp < 600,
    id = "powerful"
  ) |>
  tab_row_group(
    label = md("**Super Powerful Cars**"),
    rows = hp >= 600,
    id = "v_powerful"
  ) |>
  tab_style(
    style = cell_fill(color = "gray85"),
    locations = cells_row_groups(groups = "powerful")
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "gray95"),
      cell_text(size = "larger")
    ),
    locations = cells_row_groups(groups = "v_powerful")
  )
```

Setting the `id` values for each of the row groups makes things easier since you will have clean, markup-free ID values to reference in later calls (as was done with the `tab_style()` invocations in the example above). The use of the `md()` helper function makes it so that any Markdown provided for the `label` of a row group is faithfully rendered.

### `row_group_order()`

By default, row groups appear in the order they were created with `tab_row_group()`. The `row_group_order()` function lets you rearrange them into any sequence you prefer.

Here is the function's signature:

```r
row_group_order(
  data,
  groups
)
```

The `groups` argument takes a vector of row group ID values in the desired order. If a group was created without an explicit `id`, its label serves as the ID. The special value `NA` represents the default/unnamed group (rows not explicitly assigned to any group).

```{r}
gtcars |>
  dplyr::select(model, mfr, year, hp, msrp) |>
  dplyr::filter(
    mfr %in% c("Audi", "Porsche", "Maserati", "Ford")
  ) |>
  gt(rowname_col = "model") |>
  tab_row_group(
    label = "German",
    rows = mfr %in% c("Audi", "Porsche"),
    id = "german"
  ) |>
  tab_row_group(
    label = "Italian",
    rows = mfr == "Maserati",
    id = "italian"
  ) |>
  row_group_order(groups = c("italian", "german", NA)) |>
  cols_hide(columns = mfr)
```

Here, Italian manufacturers appear first, followed by German, with any remaining rows in the unnamed group at the bottom. The `cols_hide()` call removes the `mfr` column since that information is now conveyed by the row group labels.

### `row_order()`
 
While `row_group_order()` controls the order of groups themselves, `row_order()` lets you control the order of rows *within* each group (or across the entire table if there are no groups). This function is perfect when you need to sort rows by one or more columns after your table has been created.

Here is the function's signature:

```r
row_order(
  data,
  ...,
  .locale = NULL
)
```

The `...` argument accepts column names (optionally wrapped with `desc()` for descending order). The `.locale` argument affects string sorting when ordering character columns.

#### Ordering rows without row groups

Let's start with a simple example: a table without row groups where we want to sort rows by a numeric column.

```{r}
gtcars |>
  dplyr::select(model, year, hp, msrp) |>
  dplyr::slice_head(n = 8) |>
  gt(rowname_col = "model") |>
  row_order(hp) |>
  fmt_currency(columns = msrp, currency = "USD", decimals = 0) |>
  fmt_integer(columns = hp)
```

The rows are now sorted by horsepower in ascending order. To sort in descending order (highest horsepower first), use `desc()`:

```{r}
gtcars |>
  dplyr::select(model, year, hp, msrp) |>
  dplyr::slice_head(n = 8) |>
  gt(rowname_col = "model") |>
  row_order(desc(hp)) |>
  fmt_currency(columns = msrp, currency = "USD", decimals = 0) |>
  fmt_integer(columns = hp)
```

You can sort by multiple columns. Here we sort first by year, then by horsepower within each year:

```{r}
gtcars |>
  dplyr::select(model, year, hp, msrp) |>
  dplyr::slice_head(n = 8) |>
  gt(rowname_col = "model") |>
  row_order(year, desc(hp)) |>
  fmt_currency(columns = msrp, currency = "USD", decimals = 0) |>
  fmt_integer(columns = hp)
```

#### Ordering rows within row groups

The real power of `row_order()` shines when working with grouped tables. The sorting happens *within* each group, maintaining the group structure while organizing the rows inside.

```{r}
gtcars |>
  dplyr::select(model, mfr, year, hp, msrp) |>
  dplyr::filter(mfr %in% c("Ferrari", "Lamborghini", "Porsche")) |>
  gt(rowname_col = "model", groupname_col = "mfr") |>
  row_order(desc(hp)) |>
  fmt_currency(columns = msrp, currency = "USD", decimals = 0) |>
  fmt_integer(columns = hp)
```

Within each manufacturer group, cars are now sorted from highest to lowest horsepower. The groups themselves remain in their original order (or whatever order was set by `row_group_order()`).

#### Combining `row_order()` with `row_group_order()`

These two functions work together really well! Use `row_group_order()` to arrange your groups, then `row_order()` to sort within them:

```{r}
gtcars |>
  dplyr::select(model, mfr, year, hp, msrp) |>
  dplyr::filter(mfr %in% c("Ferrari", "Lamborghini", "Porsche")) |>
  gt(rowname_col = "model", groupname_col = "mfr") |>
  row_group_order(groups = c("Porsche", "Ferrari", "Lamborghini")) |>
  row_order(desc(msrp)) |>
  fmt_currency(columns = msrp, currency = "USD", decimals = 0) |>
  fmt_integer(columns = hp)
```

Here, groups are arranged alphabetically by our custom order, and within each group, cars are sorted by price from highest to lowest.

#### Practical use case: leaderboards and rankings

A common scenario is creating a ranked list or leaderboard. Perhaps you've collected results from a competition, survey responses with scores, or performance metrics for a team. The data might arrive in an arbitrary order (maybe alphabetically by name, or in the order it was collected). With `row_order()`, you can sort your data after applying all your formatting and styling, ensuring the final presentation reflects the ranking you want to communicate.

Consider a gaming tournament where you want to display the top players sorted by their scores:

```{r}
dplyr::tibble(
  player = c("Chen", "Rodriguez", "Okonkwo", "Müller", "Tanaka"),
  score = c(2450, 2890, 2100, 2750, 2300),
  games_played = c(42, 38, 45, 40, 35)
) |>
  gt(rowname_col = "player") |>
  row_order(desc(score)) |>
  fmt_integer(columns = c(score, games_played)) |>
  tab_stubhead(label = "Player") |>
  tab_header(
    title = "Tournament Leaderboard",
    subtitle = "Top 5 Players by Score"
  )
```

The beauty of `row_order()` is that it operates on the **gt** table after creation. This means you can build your table step by step (adding formatting, styling, and structure) and then decide on the final row arrangement. Unlike sorting your data frame before passing it to `gt()`, using `row_order()` keeps your table-building logic self-contained. You don't need to worry about upstream data manipulations affecting your presentation, and you can easily experiment with different orderings without modifying your source data.

This separation of concerns is especially valuable in reporting workflows where the same underlying data might be presented in multiple ways, or where the sorting criteria might change based on the audience or context.

### `tab_stubhead()`

Add a label to the stubhead of a **gt** table. The stubhead is the lone element that is positioned left of the column labels, and above the stub. If a stub does not exist, then there is no stubhead (so no change will be made when using this function in that case). We have the flexibility to use Markdown formatting for the stubhead label. Furthermore, if the table is intended for HTML output, we can use HTML for the stubhead label.

Here is the signature for `tab_stubhead()`:

```r
tab_stubhead(
  data,
  label
)
```

Using a small subset of the `gtcars` dataset, we can create a **gt** table with row labels. Since we have row labels in the stub (via use of `rowname_col = "model"` in the `gt()` function call) we have a stubhead, so, let's add a stubhead label (`"car"`) with the `tab_stubhead()` function to describe what's in the stub.

```{r}
gtcars |>
  dplyr::select(model, year, hp, trq) |>
  dplyr::slice(1:5) |>
  gt(rowname_col = "model") |>
  tab_stubhead(label = "car")
```

The stubhead label `"car"` now appears above the stub column, clarifying that the row labels represent car models. Without a stubhead, readers might need to infer this from context. For tables with many rows or complex stub content, a clear stubhead label improves navigability.

### `tab_stub_indent()`

Indentation of row labels is an effective way for establishing structure in a table stub. The `tab_stub_indent()` function allows for fine control over row label indentation in the stub. We can use an explicit definition of an indentation level, or, employ an indentation directive using keywords.

Here is the function's signature:

```r
tab_stub_indent(
  data,
  rows,
  indent = "increase"
)
```

Let's use a summarized version of the `pizzaplace` dataset to create a **gt** table with row groups and row labels. With the `summary_rows()` function, we'll generate summary rows at the top of each row group. With `tab_stub_indent()` we can add indentation to the row labels in the stub.

```{r}
pizzaplace |>
  dplyr::group_by(type, size) |>
  dplyr::summarize(
    sold = dplyr::n(),
    income = sum(price),
    .groups = "drop"
  ) |>
  gt(rowname_col = "size", groupname_col = "type") |>
  tab_header(title = "Pizzas Sold in 2015") |>
  fmt_integer(columns = sold) |>
  fmt_currency(columns = income) |>
  summary_rows(
    fns = list(label = "All Sizes", fn = "sum"),
    side = "top",
    fmt = list(
      ~ fmt_integer(., columns = sold),
      ~ fmt_currency(., columns = income)
    )
  ) |>
  tab_options(
    summary_row.background.color = "gray95",
    row_group.background.color = "#FFEFDB",
    row_group.as_column = TRUE
  ) |>
  tab_stub_indent(
    rows = everything(),
    indent = 2
  )
```

The `indent` argument accepts either a numeric value (0 through 5) or the keywords `"increase"` or `"decrease"`. When using numeric values, `0` means no indentation and `5` is the maximum. The keywords adjust indentation relative to the current level, which is useful when building tables programmatically.

```{r}
exibble |>
  dplyr::select(row, group, num, currency) |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_stub_indent(rows = c("row_1", "row_5"), indent = 1) |>
  tab_stub_indent(rows = c("row_2", "row_6"), indent = 2) |>
  tab_stub_indent(rows = c("row_3", "row_7"), indent = 3) |>
  tab_stub_indent(rows = c("row_4", "row_8"), indent = 4)
```

Progressive indentation creates a visual hierarchy within each group, useful for showing parent-child relationships or levels of detail.

## Column labels

Column labels appear at the top of each column and identify the data within. While **gt** uses column names from your data as default labels, you'll often want to provide cleaner, more descriptive labels for presentation. Several functions help manage column labels: `cols_label()` for setting labels directly, `cols_label_with()` for applying transformations, and `cols_move()` family functions for reordering.

### `cols_label()`

The `cols_label()` function assigns display labels to columns. These labels appear in the table while the underlying column names remain unchanged (useful for referencing columns in subsequent **gt** function calls).

Here's the signature of `cols_label()`:

```r
cols_label(
  data,
  ...,
  .list = list2(...),
  .fn = NULL,
  .process_md = FALSE,
  .process_units = FALSE
)
```

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp, mpg_c, mpg_h) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  cols_label(
    mfr = "Manufacturer",
    model = "Model",
    year = "Year",
    hp = "Horsepower",
    mpg_c = "City MPG",
    mpg_h = "Highway MPG"
  )
```

The labels can include Markdown or HTML formatting when wrapped with the appropriate helper functions:

```{r}
towny |>
  dplyr::select(name, population_2021, density_2021, land_area_km2) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "name") |>
  fmt_integer(columns = c(population_2021, density_2021)) |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  cols_label(
    population_2021 = md("**Population**"),
    density_2021 = md("Density *(per km²)*"),
    land_area_km2 = html("Area (km<sup>2</sup>)")
  )
```

The `md()` helper renders Markdown syntax, making `"Population"` bold and adding italics to the unit in `"Density"`. The `html()` helper allows raw HTML, which we use here to create a proper superscript for the squared unit in `"Area"`. Mixing these approaches gives you flexibility: Markdown for simple formatting and HTML when you need precise control over the output.

#### Incorporating units with **gt**'s units notation

Measurement units frequently appear in column labels, and it's often clearer to include them in the label itself rather than using other methods to convey unit information. While the `cols_units()` function provides one approach, **gt** also supports a built-in units notation system that allows you to define units directly within column labels.

To use this notation, surround the portion of text representing the units with `{{` and `}}`. This tells **gt** to interpret that text as a units definition and render it appropriately.

The units notation uses a succinct, ASCII-friendly syntax for writing measurement units. While it may feel somewhat familiar, it's specifically designed for this purpose. Each component (unit names, parentheses, symbols) is treated as a separate entity, and you can flexibly add subscripts and exponents. Here are the key rules and examples:

**Basic units and division:**

- `"m/s"` and `"m / s"` both render as "m/s" with proper formatting
- spaces around operators are optional and ignored
- `"m /s"` gives the same result, since `"/<unit>"` is equivalent to `"<unit>^-1"`

**Exponents:**

- `"m s^-1"` displays with the "-1" as a proper exponent
- `"t_i^2.5"` shows a *t* with an "*i*" subscript and a "2.5" exponent
- exponents are specified with the `^` character

**Subscripts:**

- `"E_h"` renders as *E* with an "*h*" subscript
- use the `_` character for subscripts
- `"m[_0^2]"` uses brackets with overstriking to set both subscript and superscript vertically aligned

**Chemical formulas:**

- `"g/L %C6H12O6%"` encloses a chemical formula in `%` characters
- numbers in formulas are automatically subscripted (e.g., C₆H₁₂O₆)
- useful for biochemistry and chemistry tables

**Automatic symbol conversions:**

- the letter "u" in `"ug"`, `"um"`, `"uL"`, and `"umol"` converts to the Greek mu symbol (µ)
- `"degC"` and `"degF"` render with a proper degree symbol (°C, °F)
- these shortcuts make typing common units easier

**Greek letters:**

- enclose Greek letter names in colons (e.g., `:beta:`, `:sigma:`)
- lowercase: `:alpha:`, `:beta:`, `:gamma:`, `:delta:`, etc.
- uppercase: `:Alpha:`, `:Beta:`, `:Gamma:`, `:Delta:`, etc.
- works for the full Greek alphabet

**Special symbols:**

- shorthand names enclosed in colons convert to proper symbols
- examples: `:angstrom:`, `:ohm:`, `:micro:`, `:degree:`
- provides access to scientific and mathematical symbols

**Text formatting:**

- surround text with `*` for italics: `"*m*/s"` renders *m*/s
- surround text with `**` for bold: `"**kg**"` renders **kg**
- can be applied to unit names, subscripts, or exponents partially or fully
- useful for emphasizing specific components

We can use units notation to cleanly express measurement units in column labels. By enclosing units in double braces (`{{` and `}}`), **gt** automatically formats them with proper typography:

```{r}
towny |>
  dplyr::select(name, land_area_km2, density_2021) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "name") |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  fmt_integer(columns = density_2021) |>
  cols_label(
    land_area_km2 = "Land Area {{km^2}}",
    density_2021 = "Density {{people/km^2}}"
  )
```

This example demonstrates the units notation in action. The `{{km^2}}` syntax automatically renders with proper superscript formatting for the squared kilometer unit, while `{{people/km^2}}` renders as a clean fraction with the exponent properly formatted. The resulting table displays professional-looking column headers with mathematically correct unit notation.

Here's a more complex example showing various features of units notation:

```{r}
data.frame(
  measurement = c("Sample A", "Sample B", "Sample C"),
  velocity = c(15.2, 18.7, 12.4),
  energy = c(4.5, 5.2, 3.8),
  concentration = c(2.3, 3.1, 2.7),
  temperature = c(25, 30, 22)
) |>
  gt(rowname_col = "measurement") |>
  cols_label(
    velocity = "Velocity {{m/s}}",
    energy = "Energy {{E_h}}",
    concentration = "Concentration {{umol/L}}",
    temperature = "Temperature {{degC}}"
  ) |>
  fmt_number(columns = c(velocity, energy, concentration), decimals = 1) |>
  fmt_number(columns = temperature, decimals = 0)
```

This notation system makes it straightforward to include properly formatted units without needing to manually construct HTML or Unicode characters.

### `cols_label_with()`

When you need to transform many column labels programmatically, `cols_label_with()` applies a function to generate labels:

```r
cols_label_with(
  data,
  columns = everything(),
  fn
)
```

Rather than manually specifying labels for each column with `cols_label()`, this function applies a transformation function to column names to automatically generate readable labels. This is especially valuable when working with datasets that have systematic naming conventions.

Let's see this in action with a subset of the `towny` dataset, which contains columns with underscored names like `population_2021`, `density_2021`, and `land_area_km2`. We'll use `cols_label_with()` to automatically convert these technical column names into proper display labels:

```{r}
towny |>
  dplyr::select(name, population_2021, density_2021, land_area_km2) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "name") |>
  cols_label_with(
    fn = ~ gsub("_", " ", .x) |> tools::toTitleCase()
  )
```

In this example, the transformation function does two things: first, `gsub("_", " ", .x)` replaces all underscores with spaces, converting `"population_2021"` to `"population 2021"`. Then `tools::toTitleCase()` applies title case formatting, resulting in clean labels like `"Population 2021"`, `"Density 2021"`, and `"Land Area Km2"`. The function is applied to all columns by default (you can limit it with the `columns` argument if needed).

This approach is particularly useful when column names follow a consistent pattern that can be transformed into readable labels. It saves considerable time compared to manually labeling each column, especially in tables with many columns that follow naming conventions.

### Hiding columns with `cols_hide()`

Sometimes you need columns for calculations or row grouping but don't want them displayed. The `cols_hide()` function removes columns from the visual output while keeping them accessible for other **gt** operations:

```r
cols_hide(
 data,
  columns
)
```

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp) |>
  dplyr::slice_head(n = 6) |>
  gt(rowname_col = "model", groupname_col = "mfr") |>
  cols_hide(columns = mfr) |>
  tab_style(
    style = cell_fill(color = "lightblue"),
    locations = cells_body(columns = hp, rows = hp > 500)
  )
```

The `mfr` column is hidden but still serves as the grouping variable. Hidden columns can be referenced in `tab_style()`, `fmt_*()` functions, and other operations.

## Inspecting table structure with `tab_info()`

As tables grow complex with multiple spanners, row groups, and customizations, it becomes helpful to inspect their structure. The `tab_info()` function generates a summary table showing column names, indices, and IDs for all table elements:

```r
tab_info(data)
```

```{r}
gtcars |>
  dplyr::select(model, mfr, year, hp, trq) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "model") |>
  tab_spanner(
    label = "Power Metrics",
    columns = c(hp, trq),
    id = "power"
  ) |>
  tab_row_group(
    label = "High Performance",
    rows = hp > 500,
    id = "high_perf"
  ) |>
  tab_info()
```

The output reveals:

- column indices and their current names
- spanner IDs (useful for styling or footnotes)
- row group IDs and their indices
- other structural metadata

This information is invaluable when you need to reference specific elements in `tab_style()`, `tab_footnote()`, or other location-based functions.

## Putting it all together

Let's combine the components covered in this chapter to create a well-structured table:

```{r}
pizzaplace |>
  dplyr::filter(type %in% c("classic", "veggie")) |>
  dplyr::group_by(type, size) |>
  dplyr::summarize(
    orders = dplyr::n(),
    revenue = sum(price),
    avg_price = mean(price),
    .groups = "drop"
  ) |>
  gt(rowname_col = "size", groupname_col = "type") |>
  tab_header(
    title = md("**Pizza Sales Summary**"),
    subtitle = "Classic and Veggie varieties, 2015"
  ) |>
  tab_spanner(
    label = "Sales Metrics",
    columns = c(orders, revenue)
  ) |>
  tab_spanner(
    label = "Pricing",
    columns = avg_price
  ) |>
  cols_label(
    orders = "Orders",
    revenue = "Revenue",
    avg_price = "Avg. Price"
  ) |>
  fmt_integer(columns = orders) |>
  fmt_currency(columns = c(revenue, avg_price)) |>
  tab_stubhead(label = "Size") |>
  tab_source_note(source_note = md("Data from the `pizzaplace` dataset in **gt**")) |>
  tab_stub_indent(rows = everything(), indent = 1) |>
  opt_align_table_header(align = "left") |>
  tab_options(
    row_group.background.color = "#FFF8E7",
    column_labels.font.weight = "bold"
  )
```

This table demonstrates:

- a header with title and subtitle
- row groups (pizza types) with a stub (sizes)
- a stubhead label
- column spanners grouping related metrics
- custom column labels
- formatted values (integers and currency)
- a source note in the footer
- stub indentation for visual polish
- table options for styling

## Conclusion

In this chapter, we've covered the essential structural components that form the foundation of every **gt** table. These building blocks (from the basic `gt()` function to headers, footers, spanners, stubs, and row groups) provide the scaffolding upon which all table presentation rests. 

Understanding these components is crucial because they establish the logical organization of your data before any formatting or styling is applied. The header gives context, the stub and row groups create vertical structure, column labels and spanners organize the horizontal dimension, and the footer provides additional information. Each component serves a specific purpose in making data more accessible and interpretable to your readers.

We've explored many functions such as `gt()`, `tab_header()`, `tab_source_note()`, `tab_spanner()`, `tab_row_group()`, `cols_label()`, and others. They'll appear repeatedly throughout your **gt** workflow. They form the vocabulary you'll use to describe and build table structure, whether you're creating simple data displays or complex analytical presentations.

As you progress through subsequent chapters, you'll see how these structural foundations support more advanced capabilities. @sec-formatting-numbers and @sec-formatting-dates-text cover formatting functions for numeric and non-numeric data, building upon the column organization you establish here. @sec-substitution-transformation introduces substitution and text transformation, completing the three-stage rendering pipeline. @sec-modifying-columns and @sec-summary-rows-columns address column modifications and summary rows, extending the structural concepts introduced in this chapter. The styling techniques in @sec-table-styling-options leverage the component structure to apply visual enhancements precisely where needed, while @sec-footnotes-source-notes shows how to add footnotes that reference structural elements. @sec-nanoplots demonstrates nanoplots for embedding visualizations within cells. The advanced topics in @sec-table-groups and @sec-output-formats cover table groups and output formats, and @sec-extension-packages and @sec-creating-extensions explore how to extend **gt** through external packages and your own extensions. All of these capabilities depend on the solid structural foundation established by the basic components covered here.

Master these fundamentals now, and the more sophisticated table-building techniques ahead will feel like natural extensions of what you already know. The time invested in understanding table structure will pay dividends in every **gt** table you create going forward.


---


# Formatting numeric values {#sec-formatting-numbers}


The presentation of values in the body and in the stub of the table is undoubtedly important when it comes to making tables for display purposes. Whereas table components like the header, the footer, and the column labels also need attention, the data values comprise the bulk of the information. And information that is not carefully presented can be difficult for the reader to parse or, worse, misleading.

The **gt** package takes a multi-stage approach to rendering values. In a latter part of the book we'll describe all of the stages (and do it in great detail) but at this point, it's important to outline how three groups of functions work within this build system. These functions are classified as:
 
1. formatting functions (`fmt_*()`)
2. substitution functions (`sub_*()`)
3. text transformation functions (`text_*()`)

And the rendering of values via functions in those groups operates in that order (i.e., formatting first, then substitution, then text transformation). Why such rigor and formality in what might be thought as a mundane operation? Well, we all want flexibility in how we present our data. After all, the presentation of data in the body is of paramount importance, so we need a system that gives us a wealth of functionality and opportunities for fine adjustments and tweaks where necessary. We also want **gt** to be easy to use, so the opportunity is there to use a little or a lot of this machinery.

Here's an example where we modify a single column of values with a function from each of the groups:

```{r}
exibble |>
  dplyr::select(num, char, currency) |>
  dplyr::slice(1:5) |>
  gt() |>
  fmt_number(columns = num, decimals = 1) |>
  sub_missing(columns = everything(), missing_text = "nil") |>
  text_transform(
    locations = cells_body(columns = char),
    fn = function(x) toupper(x)
  )
```

In this example, we first format the `num` column to show one decimal place, then substitute any missing values across all columns with "nil", and finally transform the text in the `char` column to uppercase. Each function operates in sequence, allowing us to progressively refine our table's presentation.

Formatting body cells is commonly done with the family of formatting functions (e.g., `fmt_number()`, `fmt_date()`, etc.). The package supports formatting with internationalization ('i18n' features) and so any locale-aware functions (and many of the formatting variety) come with a `locale` argument. To avoid having to use that argument repeatedly, the `gt()` function has its own locale argument. Setting a locale in that will make it available globally. Here's an example of how that works in practice when setting `locale = "fr"` in `gt()` and using formatting functions:

```{r}
exibble |>
  gt(
    rowname_col = "row",
    groupname_col = "group",
    locale = "fr"
  ) |>
  fmt_number() |>
  fmt_date(
    columns = date,
    date_style = "yMEd"
  ) |>
  fmt_datetime(
    columns = datetime,
    format = "EEEE, MMMM d, y",
    locale = "en"
  )
```

In this example, the `fmt_number()` and `fmt_date()` functions understand that the locale for this table is `"fr"` (French), so the appropriate formatting for that locale is apparent in the `num`, `currency`, and `date` columns. However in the `fmt_datetime()` call, we explicitly use the `"en"` (English) locale. This overrides the `"fr"` default set for this table and the end result is dates formatted with the English locale in the datetime column.

## Basic number formatting

Numbers are perhaps the most common type of data we encounter in tables. Raw numeric values, while precise, can be difficult for readers to quickly interpret. A value like `1234567.8912` is harder to read than `1,234,567.89`. The **gt** package provides several functions for formatting numeric values, each tailored to specific presentation needs: `fmt_number()` for general-purpose formatting with fine control over decimals and separators, `fmt_integer()` for whole numbers, and `fmt_percent()` for percentage values.

### `fmt_number()`

Number-based formatting in a **gt** table can be generally performed with the `fmt_number()` function. With this any targeted, numeric values can be rendered with a higher consideration for tabular presentation. What this means is that we have fine control over how numbers are going to appear, and here are some of the main features available in the function:

- choice of the number of decimal places, option to drop trailing zeros, and a choice of the decimal symbol
- the option to enable/disable digit separators and also to choose the separator symbol
- we can choose to scale targeted values by a multiplier value
- compact numbers: larger figures (thousands, millions, etc.) can be autoscaled and decorated with the appropriate suffixes
- with a text pattern, the formatted values can be decorated with literal characters
- locale-based formatting: providing a locale ID will result in number formatting specific to the chosen locale

Here is the function's signature:

```r
fmt_number(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  accounting = FALSE,
  scale_by = 1,
  suffixing = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  system = c("intl", "ind"),
  locale = NULL
)
```

Let's use the `exibble` dataset to create a **gt** table. With `fmt_number()`, we'll format the `num` column to have three decimal places (with `decimals = 3`) and omit the use of digit separators (with `use_seps = FALSE`).

```{r}
exibble |>
  gt() |>
  fmt_number(
    columns = num,
    decimals = 3,
    use_seps = FALSE
  )
```

The `num` column now displays values with exactly three decimal places, and without the thousands separator that would normally appear in larger numbers. This kind of control is essential when you need consistent formatting for scientific data or when digit separators might interfere with readability in certain contexts.

For presenting large numbers in a more compact form, the `suffixing` option is invaluable. Let's use a modified version of the `countrypops` dataset to demonstrate:

```{r}
countrypops |>
  dplyr::select(country_code_3, year, population) |>
  dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
  dplyr::filter(year > 1975 & year %% 10 == 0) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  gt(rowname_col = "country_code_3") |>
  fmt_number(suffixing = TRUE)
```

With `suffixing = TRUE`, population values in the millions and billions are automatically scaled and decorated with `"M"` and `"B"` suffixes respectively. This makes the table far more scannable and readers can quickly compare `"1.39B"` to `"331M"` without mentally parsing strings of digits.

We can combine suffixing with significant figures for even cleaner output:

```{r}
countrypops |>
  dplyr::select(country_code_3, year, population) |>
  dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
  dplyr::filter(year > 1975 & year %% 10 == 0) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  gt(rowname_col = "country_code_3") |>
  fmt_number(suffixing = TRUE, n_sigfig = 3)
```

When different rows require different precision levels, use `from_column()` to specify the number of decimal places dynamically. This is particularly useful when displaying measurements with varying precision requirements:

```{r}
dplyr::tibble(
  measurement = c("Length", "Weight", "Temperature", "Voltage"),
  value = c(12.5, 0.4532, 98.6, 3.3),
  precision = c(1, 4, 1, 2)
) |>
  gt() |>
  fmt_number(
    columns = value,
    decimals = from_column("precision")
  ) |>
  cols_hide(columns = precision)
```

Each measurement displays with its appropriate precision: length with 1 decimal, weight with 4 decimals for higher accuracy, and so on. The `from_column()` helper makes it easy to handle heterogeneous data where a one-size-fits-all approach to formatting won't work.

Using `n_sigfig = 3` ensures each value displays exactly three significant figures, providing appropriate precision for population estimates without spurious digits.

### `fmt_integer()`

When your data consists of whole numbers (counts, quantities, or values that shouldn't display decimals) `fmt_integer()` is the appropriate choice. This function formats numeric values as integers, rounding as necessary, with options for digit separators and accounting notation.

Here is the function's signature:

```r
fmt_integer(
  data,
  columns = everything(),
  rows = everything(),
  use_seps = TRUE,
  accounting = FALSE,
  scale_by = 1,
  suffixing = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  force_sign = FALSE,
  system = c("intl", "ind"),
  locale = NULL
)
```

Let's format the `num` column from the `exibble` dataset as integers:

```{r}
exibble |>
  dplyr::select(num, char) |>
  gt() |>
  fmt_integer(columns = num)
```

The values are now displayed as whole numbers. Notice that the original decimal values have been rounded to the nearest integer.

For population data where we want to express values in millions, we can combine `fmt_integer()` with the `scale_by` argument:

```{r}
countrypops |>
  dplyr::select(country_code_3, year, population) |>
  dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
  dplyr::filter(year > 1999 & year %% 5 == 0) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  gt(rowname_col = "country_code_3") |>
  fmt_integer(scale_by = 1 / 1E6) |>
  tab_spanner(label = "Population (Millions)", columns = everything())
```

By scaling the values by `1 / 1E6`, we convert the raw population figures to millions, then display them as integers. The spanner label clarifies the unit of measurement for readers.

The `force_sign` option is useful when you want to highlight positive and negative changes:

```{r}
towny |>
  dplyr::select(name, population_2001, population_2021) |>
  dplyr::slice_tail(n = 8) |>
  gt() |>
  cols_add(change = population_2021 - population_2001) |>
  fmt_integer() |>
  fmt_integer(columns = change, force_sign = TRUE)
```

With `force_sign = TRUE` on the `change` column, positive values display a plus sign, making it immediately clear which municipalities gained population and which lost it.

### `fmt_percent()`

Percentage values are ubiquitous in data presentation. The `fmt_percent()` function handles the formatting of proportional values, automatically multiplying by 100 and appending a percent sign. If your values are already expressed as percentages (not proportions), you can disable the automatic scaling with `scale_values = FALSE`.

Here is the function's signature:

```r
fmt_percent(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_values = TRUE,
  use_seps = TRUE,
  accounting = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  incl_space = FALSE,
  placement = c("right", "left"),
  system = c("intl", "ind"),
  locale = NULL
)
```

Here's an example using the `pizzaplace` dataset to show monthly pizza sales as percentages of annual totals:

```{r}
pizzaplace |>
  dplyr::mutate(month = as.numeric(substr(date, 6, 7))) |>
  dplyr::count(month, name = "pizzas_sold") |>
  dplyr::mutate(pct_of_annual = pizzas_sold / sum(pizzas_sold)) |>
  gt(rowname_col = "month") |>
  fmt_integer(columns = pizzas_sold) |>

  fmt_percent(columns = pct_of_annual, decimals = 1)
```

The `pct_of_annual` column contains proportional values (summing to `1`), and `fmt_percent()` correctly transforms them to percentages. Each month's share of annual pizza sales is now clearly expressed as a percentage with one decimal place.

For cases where values are already scaled as percentages, simply set `scale_values = FALSE`:

```{r}
dplyr::tibble(
  category = c("A", "B", "C"),
  value = c(45.2, 32.8, 22.0)  
) |>
  gt() |>
  fmt_percent(columns = value, scale_values = FALSE, decimals = 1)
```

The values remain unchanged numerically but now display with the percent symbol, communicating their meaning more clearly.

### `fmt_fraction()`

Some data is more naturally expressed as fractions than decimals. Measurements like "3/4 inch" or "1 1/2 cups" are immediately intuitive in ways that "0.75 inch" or "1.5 cups" are not. The `fmt_fraction()` function converts decimal values to mixed fractions.

Here is the function's signature:

```r
fmt_fraction(
  data,
  columns = everything(),
  rows = everything(),
  accuracy = NULL,
  simplify = TRUE,
  layout = c("inline", "diagonal"),
  use_seps = TRUE,
  pattern = "{x}",
  sep_mark = ",",
  system = c("intl", "ind"),
  locale = NULL
)
```

Let's convert decimal measurements to fractions, which is particularly useful for imperial measurements:

```{r}
dplyr::tibble(
  item = c("Bolt A", "Bolt B", "Bolt C", "Bolt D"),
  length = c(0.25, 0.5, 0.75, 1.375)
) |>
  gt() |>
  fmt_fraction(columns = length)
```

The decimal lengths are now displayed as fractions: `1/4`, `1/2`, `3/4`, and `1 3/8`. This presentation is immediately recognizable to anyone who has worked with imperial measurements.

The `accuracy` argument lets you constrain fractions to specific denominators:

```{r}
dplyr::tibble(
  item = c("Cut 1", "Cut 2", "Cut 3"),
  measurement = c(0.3333, 0.6667, 0.125)
) |>
  gt() |>
  fmt_fraction(columns = measurement, accuracy = 8)
```

With `accuracy = 8`, all fractions use eighths as the maximum denominator. The value `0.3333` rounds to `3/8` rather than displaying as `1/3`. This is particularly useful when working with standard measurement increments.


## Scientific and engineering formats

When dealing with very large or very small numbers, exponential notation provides a compact and standardized representation. The **gt** package offers two functions for this purpose: `fmt_scientific()` and `fmt_engineering()`. While both express numbers as a coefficient multiplied by a power of `10`, they differ in a crucial way that affects readability in different contexts.

**Scientific notation** expresses any number in the form *m* × 10^*n*, where the mantissa *m* is a value between `1` and `10` (specifically, `1 ≤ |*m*| < 10`). For example:

- 4,700 becomes 4.70 × 10^3
- 0.00022 becomes 2.20 × 10^-4
- 299,792,458 becomes 2.998 × 10^8

This format is standard in scientific publications because it normalizes all values to the same mantissa range, making it easy to compare orders of magnitude at a glance.

**Engineering notation** is a variant where the exponent is always a multiple of three (`... -6, -3, 0, 3, 6, 9 ...`). This means the mantissa falls between `1` and `1000` (specifically, `1 ≤ |*m*| < 1000`). The same numbers become:

- `4,700` becomes `4.70 × 10^3` (same as scientific)
- `0.00022` becomes `220 × 10^-6` (not `2.20 × 10^-4`)
- `299,792,458` becomes `299.8 × 10^6` (not `2.998 × 10^8`)

Why use engineering notation? The exponents align with SI unit prefixes: 10^3 is kilo (k), 10^6 is mega (M), 10^9 is giga (G), 10^-3 is milli (m), 10^-6 is micro (μ), and so forth. An engineer reading "220 × 10^-6 amperes" immediately recognizes this as "220 microamperes" or "220 μA". This mental translation is far easier than converting "2.20 × 10^-4 amperes" to the same quantity.

The choice between formats depends on your audience:

- **Scientific notation** for academic papers, scientific journals, and contexts where normalized mantissas aid comparison
- **Engineering notation** for technical reports, electronics documentation, and contexts where SI prefixes are the norm

Let's see both formats applied to the same data:

```{r}
dplyr::tibble(
  quantity = c("Resistance", "Capacitance", "Frequency"),
  value = c(4700, 0.000022, 2400000)
) |>
  gt() |>
  cols_add(scientific = value, engineering = value) |>
  fmt_scientific(columns = scientific) |>
  fmt_engineering(columns = engineering) |>
  cols_hide(columns = value) |>
  cols_move(columns = scientific, after = quantity)
```

The table shows the same values in both notations side by side. Notice how the engineering notation values (4.70 × 10^3, 22.00 × 10^-6, 2.40 × 10^6) correspond directly to 4.7 kΩ, 22 μF, and 2.4 MHz. These are common ways to express electronic component values.

### Exponent styles with `exp_style`

Both `fmt_scientific()` and `fmt_engineering()` share an `exp_style` argument that controls how the exponential portion is rendered. The default is `"x10n"`, which produces the familiar "× 10^n" notation, but several alternatives are available for different contexts:
 
| Style | Example | Use Case |
|-------|---------|----------|
| `"x10n"` | 1.23 × 10^5 | Scientific publications, formal documents |
| `"E"` | 1.23E05 | Spreadsheets, computational output |
| `"e"` | 1.23e05 | Programming languages, data files |
| `"e1"` | 1.23e5 | Compact programming style (no leading zero) |
| `"low-ten"` | 1.23 ᵡ 10^5 | Typographically styled documents |

```{r}
dplyr::tibble(
  style = c("x10n", "E", "e", "e1", "low-ten"),
  value = rep(123456.789, 5)
) |>
  gt(rowname_col = "style") |>
  fmt_scientific(
    columns = value,
    rows = 1,
    exp_style = "x10n"
  ) |>
  fmt_scientific(
    columns = value,
    rows = 2,
    exp_style = "E"
  ) |>
  fmt_scientific(
    columns = value,
    rows = 3,
    exp_style = "e"
  ) |>
  fmt_scientific(
    columns = value,
    rows = 4,
    exp_style = "e1"
  ) |>
  fmt_scientific(
    columns = value,
    rows = 5,
    exp_style = "low-ten"
  ) |>
  cols_label(value = "Formatted Output")
```

The choice of exponent style is largely a matter of convention and context. The `"x10n"` style is most appropriate for polished documents and publications where the multiplication sign and superscript exponent are expected. The `"E"` and `"e"` styles are familiar to anyone who has worked with spreadsheets or programming languages. They're compact and unambiguous, though less visually elegant. The `"low-ten"` style offers a compromise, using a specialized multiplication character that's more compact than the full "×" symbol.

### `fmt_scientific()`

Scientific notation expresses numbers as a mantissa (a value between 1 and 10) multiplied by a power of 10. This format is standard in scientific publications and is essential for presenting data that spans many orders of magnitude.

Here is the function's signature:

```r
fmt_scientific(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_by = 1,
  exp_style = "x10n",
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign_m = FALSE,
  force_sign_n = FALSE,
  locale = NULL
)
```

Let's create a table with values that span many orders of magnitude and format them using scientific notation:

```{r}
small_large_tbl <-
  dplyr::tibble(
    small = 10^(-6:-1),
    large = 10^(1:6)
  )

small_large_tbl |>
  gt() |>
  fmt_scientific()
```

Both columns are now formatted in scientific notation, making it easy to compare values across vastly different scales. The default style uses the "m × 10^n" construction, which is visually clear and familiar to scientific readers.

The `exp_style` argument offers alternative notation styles:

```{r}
small_large_tbl |>
  gt() |>
  fmt_scientific(
    columns = small,
    exp_style = "E"
  ) |>
  fmt_scientific(
    columns = large,
    exp_style = "e1",
    force_sign_n = TRUE
  )
```

The `small` column uses the "E" style (like `1.00E-06`), common in computational contexts. The `large` column uses "e1" style with forced signs on the exponent, making the power relationship explicit.

### `fmt_engineering()`

Engineering notation is a variant of scientific notation where exponents are restricted to multiples of three. This aligns with SI prefixes (kilo-, mega-, giga-, etc.) and is preferred in many engineering and technical contexts.

Here is the function's signature:

```r
fmt_engineering(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_by = 1,
  exp_style = "x10n",
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign_m = FALSE,
  force_sign_n = FALSE,
  locale = NULL
)
```

Let's format electronic component values using engineering notation:

```{r}
dplyr::tibble(
  component = c("Resistor", "Capacitor", "Inductor"),
  value = c(4700, 0.000022, 0.0033)
) |>
  gt() |>
  fmt_engineering(columns = value)
```

Each value's exponent is a multiple of three, corresponding to standard engineering prefixes. A resistance of 4,700 ohms becomes 4.70 × 10^3, aligning with the "kilo-" prefix.

### `fmt_number_si()`

While engineering notation aligns exponents with SI prefixes, `fmt_number_si()` takes this a step further by actually displaying the SI prefix symbols (k, M, G, T, m, μ, n, etc.) instead of exponential notation. This creates highly readable output for technical audiences.

Here is the function's signature:

```r
fmt_number_si(
  data,
  columns = everything(),
  rows = everything(),
  unit = NULL,
  prefix_mode = c("engineering", "decimal"),
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  scale_by = 1,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  incl_space = TRUE,
  locale = NULL
)
```

The `unit` argument lets you append a unit symbol after the SI prefix (e.g., `"g"` for grams, `"W"` for watts, `"Hz"` for hertz). This is particularly useful for storage capacities, transfer speeds, and other technical measurements:

```{r}
dplyr::tibble(
  device = c("USB Drive", "Laptop SSD", "External HDD", "NAS Server", "Cloud Storage"),
  capacity_bytes = c(32e9, 512e9, 2e12, 16e12, 100e12),
  transfer_speed = c(150e6, 3500e6, 180e6, 1000e6, 500e6)
) |>
  gt() |>
  tab_header(title = "Storage Device Specifications") |>
  cols_label(
    device = "Device",
    capacity_bytes = "Capacity",
    transfer_speed = "Transfer Speed"
  ) |>
  fmt_number_si(
    columns = capacity_bytes,
    unit = "B",
    decimals = 0
  ) |>
  fmt_number_si(
    columns = transfer_speed,
    unit = "B/s",
    decimals = 0
  )
```

The function automatically selects the appropriate SI prefix to keep numbers readable. A 32 billion byte USB drive becomes `"32 GB"` and a 3.5 billion bytes per second transfer rate becomes `"4 GB/s"`. This eliminates the need for manual scaling and prefix selection.

When different rows require different units, you can use `from_column()` to pull unit values from another column. This is useful when a single measurement column contains values with varying units:

```{r}
dplyr::tibble(
  substance = c("Glucose", "Vitamin C", "Caffeine", "Water"),
  amount = c(0.0051, 0.000075, 0.0002, 0.250),
  unit = c("g", "g", "g", "L")
) |>
  gt() |>
  fmt_number_si(
    columns = amount,
    unit = from_column("unit"),
    n_sigfig = 2
  ) |>
  cols_hide(columns = unit) |>
  cols_label(
    substance = "Substance",
    amount = "Amount"
  )
```

The `from_column()` helper retrieves unit values row by row, so glucose shows as `"5.1 mg"` while water displays as `"250 mL"`. The `cols_hide()` call removes the now-redundant unit column from the final output.

The `prefix_mode` argument controls which SI prefixes are used. The default `"engineering"` mode uses only prefixes for powers of 1000 (k, M, G, T, m, μ, n, p, etc.), which is the most common convention in scientific and engineering contexts. The `"decimal"` mode includes all SI prefixes, adding da (deca), h (hecto), d (deci), and c (centi) for powers of 10 and 100.

Here's the basic usage without units:

```{r}
dplyr::tibble(
  component = c("Resistor", "Capacitor", "Clock Speed", "Wavelength"),
  value = c(4700, 0.000022, 2400000000, 0.000000550)
) |>
  gt() |>
  fmt_number_si(columns = value)
```

The values are now displayed with SI prefixes: `"4.70k"` (kilo), `"22.00μ"` (micro), `"2.40G"` (giga), and `"550.00n"` (nano). For anyone working in electronics, physics, or engineering, this is the most natural way to express these quantities and it's how values appear on component labels and in technical specifications.

Compare this to the same data formatted with `fmt_engineering()`:

```{r}
dplyr::tibble(
  component = c("Resistor", "Capacitor", "Clock Speed", "Wavelength"),
  value = c(4700, 0.000022, 2400000000, 0.000000550)
) |>
  gt() |>
  cols_add(si_format = value) |>
  fmt_engineering(columns = value) |>
  fmt_number_si(columns = si_format) |>
  cols_label(
    value = "Engineering",
    si_format = "SI Prefix"
  )
```

Both formats convey the same information, but the SI prefix format is more compact and more familiar in practical contexts. A 2.4 GHz processor clock speed is more recognizable than 2.40 × 10^9 Hz.

### The `unit_conversion()` helper

When your data is stored in one unit but needs to be displayed in another, the `unit_conversion()` helper provides conversion factors for a wide range of measurement types. This is particularly useful with the `scale_by` argument in formatting functions, or when creating new columns with converted values.
 
The function takes `from` and `to` arguments specifying the source and target units. You can view all available conversions using `info_unit_conversions()`.

Here's an example converting obelisk masses from metric tons to grams, then displaying with SI prefixes:

```{r}
dplyr::tibble(
  obelisk = c(
    "Lateran Obelisk",
    "Vatican Obelisk",
    "Flaminio Obelisk",
    "Pantheon Obelisk"
  ),
  mass_ton = c(455, 331, 235, 30)
) |>
  gt() |>
  fmt_number_si(
    columns = mass_ton,
    unit = "g",
    decimals = 0,
    scale_by = unit_conversion(
      from = "mass.metric-ton",
      to = "mass.gram"
    )
  ) |>
  cols_label(
    obelisk = "Obelisk",
    mass_ton = "Mass"
  )
```

The `unit_conversion()` function returns the conversion factor (in this case, 1,000,000 grams per metric ton), which is then applied via `scale_by`. Combined with `fmt_number_si()`, the masses are displayed as `"455 Mg"` (455 megagrams), `"331 Mg"`, and so on. Note that this is exactly equivalent to the original metric ton values but expressed in the SI unit system.

When converting between area units, remember that `unit_conversion()` gives you the factor to multiply by when going from the source unit to the target. For the density conversion calculations (which have area in the denominator), you'll need to invert the factor:

```{r}
towny |>
  dplyr::slice_max(density_2021, n = 10) |>
  dplyr::select(name, population_2021, density_2021, land_area_km2) |>
  gt(rowname_col = "name") |>
  fmt_integer(columns = population_2021) |>
  fmt_number(
    columns = land_area_km2,
    decimals = 1,
    scale_by = unit_conversion(
      from = "area.square-kilometer",
      to = "area.square-mile"
    )
  ) |>
  fmt_number(
    columns = density_2021,
    decimals = 1,
    scale_by = 1 / unit_conversion(
      from = "area.square-kilometer",
      to = "area.square-mile"
    )
  ) |>
  cols_label(
    land_area_km2 = "Land Area,<br>sq. mi",
    population_2021 = "Population",
    density_2021 = "Density,<br>ppl / sq. mi",
    .fn = md
  )
```

Notice that for `land_area_km2`, we multiply by the conversion factor (converting km² to sq. mi), but for `density_2021` (which is people per km²), we divide by the conversion factor to get people per square mile.

The `unit_conversion()` helper can also be used with `cols_add()` to create new columns with converted values (see @sec-modifying-columns for a full treatment of `cols_add()` and `rows_add()`). However, temperature conversions are a special case: because they involve both scaling and an offset, `unit_conversion()` returns a **function** rather than a simple numeric factor. Here's an example adding Celsius columns to temperature data stored in Fahrenheit:

```{r}
dplyr::tibble(
  city = c("Phoenix", "Miami", "Seattle", "Minneapolis"),
  high_temp_f = c(107, 91, 75, 83),
  low_temp_f = c(82, 76, 54, 64)
) |>
  gt() |>
  cols_add(
    high_temp_c = unit_conversion(
      from = "temperature.fahrenheit",
      to = "temperature.celsius"
    )(high_temp_f),
    low_temp_c = unit_conversion(
      from = "temperature.fahrenheit",
      to = "temperature.celsius"
    )(low_temp_f)
  ) |>
  fmt_number(
    columns = ends_with("_c"),
    decimals = 1
  ) |>
  cols_move(columns = high_temp_c, after = high_temp_f) |>
  cols_label(
    city = "City",
    high_temp_f = "High (°F)",
    high_temp_c = "High (°C)",
    low_temp_f = "Low (°F)",
    low_temp_c = "Low (°C)"
  )
```

Notice that we call the returned function by appending `(high_temp_f)` after `unit_conversion(...)`. This is necessary because temperature conversion requires both scaling (multiplying by 5/9) and an offset (subtracting 32), so `unit_conversion()` returns a function that applies both operations. For most other unit conversions (length, mass, volume, area), the conversion is purely multiplicative and `unit_conversion()` returns a simple numeric factor that you can use directly with `*` or in `scale_by`.

## Formatting numbers to currencies and various other units

Beyond basic numeric formatting, **gt** provides specialized functions for common measurement contexts: currencies, data sizes, and parts-per quantities.

### `fmt_currency()`

Currency formatting goes beyond simply adding a symbol. It requires correct placement, appropriate decimal handling, and locale-aware conventions. The `fmt_currency()` function handles all of this with support for over 100 currencies.

Here is the function's signature:

```r
fmt_currency(
  data,
  columns = everything(),
  rows = everything(),
  currency = NULL,
  use_subunits = TRUE,
  decimals = NULL,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  accounting = FALSE,
  scale_by = 1,
  suffixing = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  placement = "left",
  incl_space = FALSE,
  system = c("intl", "ind"),
  locale = NULL
)
```

Let's format numeric values as Japanese Yen and the currency column with its specified currencies:

```{r}
exibble |>
  dplyr::select(num, currency) |>
  gt() |>
  fmt_currency(
    columns = num,
    currency = "JPY"
  ) |>
  fmt_currency(
    columns = currency,
    currency = "GBP"
  )
```

The Japanese Yen (JPY) displays without decimal places (as is conventional for that currency), while the British Pound (GBP) shows two decimal places. The `fmt_currency()` function automatically applies the correct conventions for each currency.

For European currencies where the symbol appears after the value with a space, use the `placement` and `incl_space` arguments:

```{r}
exibble |>
  dplyr::select(currency) |>
  gt() |>
  fmt_currency(
    currency = "EUR",
    placement = "right",
    incl_space = TRUE
  )
```

The Euro symbol now appears after the value, separated by a space (the convention used in many European countries).

When working with international data where different rows represent different currencies, the `from_column()` helper lets you specify currency codes dynamically:

```{r}
dplyr::tibble(
  country = c("United States", "Japan", "Germany", "United Kingdom"),
  price = c(29.99, 3500, 24.99, 19.99),
  currency_code = c("USD", "JPY", "EUR", "GBP")
) |>
  gt() |>
  fmt_currency(
    columns = price,
    currency = from_column("currency_code")
  ) |>
  cols_hide(columns = currency_code) |>
  cols_label(
    country = "Country",
    price = "Price"
  )
```

Each row is formatted with its appropriate currency: USD with a dollar sign and two decimals, JPY with a yen symbol and no decimals (as is conventional), EUR with a euro symbol, and GBP with a pound symbol. The `cols_hide()` call removes the currency code column since that information is now embedded in the formatted values.

To discover which currencies are available, use the `info_currencies()` function, which displays a **gt** table listing all supported currencies with their codes, symbols, and names:

```{r}
info_currencies()
```

The function supports over 100 currencies, specified by their three-letter ISO 4217 codes (like `"USD"`, `"EUR"`, `"GBP"`, `"JPY"`) or by common names (like `"dollar"`, `"euro"`, `"pound"`, `"yen"`). You can also create custom currency symbols using the `currency()` helper function for currencies not in the built-in list.

### `fmt_bytes()`

When presenting data sizes (file sizes, memory usage, network throughput) the `fmt_bytes()` function provides clear, human-readable formatting with appropriate unit suffixes.

Here is the function's signature:

```r
fmt_bytes(
  data,
  columns = everything(),
  rows = everything(),
  standard = c("decimal", "binary"),
  decimals = 1,
  n_sigfig = NULL,
  drop_trailing_zeros = TRUE,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  incl_space = TRUE,
  locale = NULL
)
```

Here's a simple example formatting file sizes from raw byte counts:

```{r}
dplyr::tibble(
  file = c("document.pdf", "image.png", "video.mp4", "database.sql"),
  size_bytes = c(245678, 1567890, 987654321, 5765432100)
) |>
  gt() |>
  fmt_bytes(columns = size_bytes)
```

The raw byte counts are transformed into readable sizes: kilobytes, megabytes, and gigabytes as appropriate. This automatic scaling makes the relative sizes immediately apparent.

The function supports both binary (powers of 1024) and decimal (powers of 1000) standards:

```{r}
dplyr::tibble(
  file = c("small.txt", "large.bin"),
  size = c(1536, 1073741824)
) |>
  gt() |>
  fmt_bytes(columns = size, standard = "decimal")
```

With `standard = "decimal"`, units follow the SI convention (KB = 1000 bytes), which is commonly used for storage device marketing.

### `fmt_partsper()`

For expressing concentrations, error rates, or other small proportions, `fmt_partsper()` provides formatting for parts-per-thousand (‰), parts-per-million (ppm), parts-per-billion (ppb), and parts-per-trillion (ppt).

Here is the function's signature:

```r
fmt_partsper(
  data,
  columns = everything(),
  rows = everything(),
  to_units = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq"),
  decimals = 2,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_values = TRUE,
  use_seps = TRUE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  incl_space = TRUE,
  locale = NULL
)
```

Let's format pollutant concentrations using parts-per notation:

```{r}
dplyr::tibble(
  pollutant = c("Carbon Monoxide", "Ozone", "Particulate Matter"),
  concentration = c(0.000009, 0.00000007, 0.000000025)
) |>
  gt() |>
  fmt_partsper(
    columns = concentration,
    to_units = "ppm"
  )
```

The tiny decimal values are now expressed as parts per million, a standard format for air quality measurements that immediately conveys the scale to domain experts.

## Translating numbers to other forms

Sometimes numeric data is better expressed in alternative forms. **gt** provides functions to convert numbers into indexed characters, Roman numerals, and spelled-out words.

### `fmt_index()`

The `fmt_index()` function converts integers to indexed characters. These sequences are commonly used for ordered lists.

Here is the function's signature:

```r
fmt_index(
  data,
  columns = everything(),
  rows = everything(),
  index_algo = c("repeat", "excel")
)
```

Let's convert numeric ranks to letter indices:

```{r}
dplyr::tibble(
  rank = 1:5,
  item = c("Apple", "Banana", "Cherry", "Date", "Elderberry")
) |>
  gt() |>
  fmt_index(columns = rank, case = "lower", pattern = "{x}.")
```

The numeric ranks are now expressed as uppercase letters, suitable for use in lists or references.

### `fmt_roman()`

Roman numerals remain common in certain contexts (like chapter numbers, copyright dates, and Super Bowl numberings). The `fmt_roman()` function handles the conversion.

Here is the function's signature:

```r
fmt_roman(
  data,
  columns = everything(),
  rows = everything(),
  case = c("upper", "lower"),
  pattern = "{x}"
)
```

Let's format chapter numbers as uppercase Roman numerals:

```{r}
dplyr::tibble(
  chapter = 1:5,
  title = c("Introduction", "Background", "Methods", "Results", "Discussion")
) |>
  gt() |>
  fmt_roman(columns = chapter, case = "upper")
```

Chapter numbers now appear as Roman numerals, lending a classical or formal appearance to the table.

### `fmt_spelled_num()`
 
For certain editorial contexts, numbers should be spelled out as words. The `fmt_spelled_num()` function handles this conversion.

Here is the function's signature:

```r
fmt_spelled_num(
  data,
  columns = everything(),
  rows = everything(),
  pattern = "{x}",
  locale = NULL
)
```

Let's spell out position numbers as words:

```{r}
dplyr::tibble(
  position = 1:5,
  name = c("Alice", "Bob", "Carol", "David", "Eve")
) |>
  gt() |>
  fmt_spelled_num(columns = position)
```

The positions are now expressed as words, following the editorial convention of spelling out small numbers.

The `locale` argument makes this function particularly powerful for multilingual documents as the spelled-out numbers are translated to the specified language:

```{r}
dplyr::tibble(
  number = 1:5,
  english = number,
  french = number,
  german = number,
  spanish = number
) |>
  gt() |>
  fmt_spelled_num(columns = english, locale = "en") |>
  fmt_spelled_num(columns = french, locale = "fr") |>
  fmt_spelled_num(columns = german, locale = "de") |>
  fmt_spelled_num(columns = spanish, locale = "es") |>
  cols_label(
    number = "Value",
    english = "English",
    french = "Français",
    german = "Deutsch",
    spanish = "Español"
  )
```

The same numbers are spelled out in four different languages: "one" in English becomes "un" in French, "eins" in German, and "uno" in Spanish. This locale-aware translation extends to larger numbers as well, correctly handling the grammatical and linguistic conventions of each language.

### `fmt_bins()`

When working with binned or interval data (such as histograms, age groups, or value ranges) the `fmt_bins()` function formats interval notation into clean, readable ranges.

Here is the function's signature:

```r
fmt_bins(
  data,
  columns = everything(),
  rows = everything(),
  sep = "--",
  fmt = NULL
)
```

Let's format age group intervals into readable ranges:

```{r}
dplyr::tibble(
  age_group = c("[0,18)", "[18,35)", "[35,50)", "[50,65)", "[65,Inf)"),
  count = c(150, 340, 280, 195, 120)
) |>
  gt() |>
  fmt_bins(columns = age_group) |>
  fmt_integer(columns = count)
```

The interval notation is transformed into readable ranges. The `[0,18)` becomes "0–18" (or similar), clearly communicating the bounds of each group.

### `fmt_tf()`

Logical values (`TRUE` and `FALSE`) can be formatted into more meaningful or visually appealing representations using `fmt_tf()`.

Here is the function's signature:

```r
fmt_tf(
  data,
  columns = everything(),
  rows = everything(),
  tf_style = "true-false",
  pattern = "{x}",
  locale = NULL
)
```

Let's convert logical values to more reader-friendly text:

```{r}
dplyr::tibble(
  feature = c("Feature A", "Feature B", "Feature C", "Feature D"),
  available = c(TRUE, FALSE, TRUE, TRUE)
) |>
  gt() |>
  fmt_tf(columns = available, tf_style = "yes-no")
```

The `TRUE` and `FALSE` values are replaced with `"Yes"` and `"No"`, which are more accessible to general readers. The `tf_style` argument offers several alternatives including checkmarks, circles, and other symbols. To see all available styles with visual previews, use the `info_tf_style()` function, which displays a reference table showing how each style renders.

## Common formatting options

Several formatting concepts apply across multiple `fmt_*()` functions. Understanding these common options will help you apply them consistently throughout your tables.

### Accounting notation

Several numeric formatting functions in **gt** share an `accounting` argument: `fmt_number()`, `fmt_integer()`, `fmt_percent()`, and `fmt_currency()`. When `accounting = TRUE`, negative values are displayed in parentheses rather than with a minus sign (a convention widely used in financial reporting and accounting documents).

```{r}
dplyr::tibble(
  item = c("Revenue", "Cost of Goods", "Operating Expenses", "Net Income"),
  amount = c(150000, -85000, -42000, 23000)
) |>
  gt() |>
  fmt_currency(
    columns = amount,
    currency = "USD",
    accounting = TRUE
  )
```

The negative values for "Cost of Goods" and "Operating Expenses" now appear wrapped in parentheses, `($85,000.00)` and `($42,000.00)`, rather than with leading minus signs. This formatting convention has deep roots in financial practice: parentheses are more visually distinct than a small minus sign, making it easier to scan a column and quickly identify debits or losses. Many accountants and financial analysts expect this notation, and using it in your tables signals professionalism and adherence to established conventions.

The accounting style works consistently across the numeric formatting functions:

```{r}
dplyr::tibble(
  metric = c("Growth Rate", "Margin", "Change"),
  value = c(0.125, -0.034, -0.089)
) |>
  gt() |>
  fmt_percent(
    columns = value,
    decimals = 1,
    accounting = TRUE
  )
```

Here, the negative percentages are displayed as `(3.4%)` and `(8.9%)` rather than `-3.4%` and `-8.9%`. This consistency across functions means you can apply accounting notation throughout a financial report, regardless of whether you're displaying raw numbers, currencies, or percentages.

### Significant figures

When presenting scientific or measured data, the number of decimal places isn't always the right way to express precision. Consider these three measurements: 0.00234, 1.52, and 1520. If we format all of them to two decimal places, we get 0.00, 1.52, and 1520.00. The first value loses all meaningful information, while the last gains spurious precision. What we often want instead is to express each value with a consistent number of *significant figures* (also called significant digits).

Significant figures are the digits in a number that carry meaningful information about its precision. They include all non-zero digits, zeros between non-zero digits, and trailing zeros after a decimal point. Leading zeros (those before the first non-zero digit) are not significant, they just indicate the position of the decimal point.

Several **gt** formatting functions support the `n_sigfig` argument: `fmt_number()`, `fmt_scientific()`, `fmt_engineering()`, and `fmt_bytes()`. When you specify `n_sigfig`, the function formats values to display exactly that many significant figures, which is often more appropriate than a fixed number of decimal places for data with varying magnitudes.

```{r}
dplyr::tibble(
  measurement = c("Trace element", "Minor component", "Major component"),
  concentration = c(0.00234, 1.52, 1520)
) |>
  gt() |>
  fmt_number(
    columns = concentration,
    n_sigfig = 3
  )
```

All three values now display with three significant figures: 0.00234, 1.52, and 1,520. The formatting adapts to each value's magnitude while maintaining consistent precision. This is precisely what scientists and engineers expect when reporting measured quantities: the number of significant figures communicates the precision of the measurement itself.

Let's contrast this with fixed decimal formatting:
 
```{r}
dplyr::tibble(
  measurement = c("Trace element", "Minor component", "Major component"),
  concentration = c(0.00234, 1.52, 1520)
) |>
  gt() |>
  fmt_number(
    columns = concentration,
    decimals = 2
  )
```

With `decimals = 2`, the trace element concentration rounds to 0.00 (losing all information), the minor component displays correctly as 1.52, and the major component shows as 1,520.00 (implying false precision to the hundredths place). The significant figures approach avoids both problems.

The `n_sigfig` argument is particularly valuable when:

- reporting scientific measurements where precision varies with magnitude
- presenting data from instruments with known precision limits  
- creating tables for technical or academic publications that follow significant figures conventions
- displaying values that span several orders of magnitude in the same column

When combined with scientific notation, significant figures provide clean, professional formatting for technical data:

```{r}
dplyr::tibble(
  quantity = c("Avogadro's number", "Planck's constant", "Speed of light"),
  value = c(6.02214076e23, 6.62607015e-34, 299792458)
) |>
  gt() |>
  fmt_scientific(
    columns = value,
    n_sigfig = 4
  )
```

Each physical constant is displayed with four significant figures in scientific notation, a format familiar to anyone who has read a physics textbook or scientific paper. The consistent precision across wildly different magnitudes (from 10^-34 to 10^23) demonstrates why significant figures are the preferred approach for scientific data.

### Decorating values with `pattern`

Nearly every formatting function in **gt** includes a `pattern` argument that allows you to wrap the formatted value in additional text. The default is `pattern = "{x}"`, where `{x}` is a placeholder that gets replaced by the formatted value. By modifying this pattern, you can add prefixes, suffixes, or surrounding text to your values without additional column manipulation.

```{r}
dplyr::tibble(
  item = c("Server A", "Server B", "Server C"),
  uptime = c(99.95, 99.12, 100.00)
) |>
  gt() |>
  fmt_number(
    columns = uptime,
    decimals = 2,
    pattern = "{x}%"
  )
```

The pattern `"{x}%"` appends a percent sign to each formatted number. While you could achieve the same result with `fmt_percent(scale_values = FALSE)`, the pattern approach is more general (you can add any text you like).

Patterns are particularly useful for adding units, context, or decoration:

```{r}
dplyr::tibble(
  dimension = c("Width", "Height", "Depth"),
  measurement = c(120.5, 85.0, 45.25)
) |>
  gt() |>
  fmt_number(
    columns = measurement,
    decimals = 1,
    pattern = "{x} cm"
  )
```

Here, each measurement is followed by " cm" to indicate the unit. The space before "cm" is included in the pattern, giving you precise control over spacing.

You can also place text before the value, or surround it entirely:

```{r}
dplyr::tibble(
  product = c("Widget", "Gadget", "Sprocket"),
  change = c(12.5, -3.2, 0.8)
) |>
  gt() |>
  fmt_number(
    columns = change,
    decimals = 1,
    force_sign = TRUE,
    pattern = "({x}%)"
  )
```

The pattern `"({x}%)"` wraps each value in parentheses and adds a percent sign, creating output like "(+12.5%)" and "(−3.2%)". Combined with `force_sign = TRUE`, this provides a compact way to display percentage changes.

The pattern argument works consistently across formatting functions. The `fmt_currency()`, `fmt_date()`, `fmt_scientific()` functions (and a few others) support it. This means you can add contextual text to any type of formatted value:

```{r}
dplyr::tibble(
  event = c("Project Start", "Milestone", "Deadline"),
  date = c("2024-01-15", "2024-06-30", "2024-12-31")
) |>
  gt() |>
  fmt_date(
    columns = date,
    date_style = "yMMMd",
    pattern = "Due: {x}"
  )
```

Each date is now prefixed with "Due: ", providing context directly within the cell. This approach keeps related information together without requiring additional columns or complex HTML formatting.

### Indian numbering system

Several **gt** formatting functions include a `system` argument that accepts either `"intl"` (international, the default) or `"ind"` (Indian). This controls how digit separators are placed in large numbers, a distinction that matters greatly when presenting data to audiences in South Asia.

In the international system, digits are grouped in threes: thousands, millions, billions, and so on. The number one billion is written as 1,000,000,000. In the Indian numbering system (also called the Vedic or South Asian system), the first group is three digits (thousands), but subsequent groups are two digits. This reflects the naming convention of lakhs (1,00,000 = 100 thousand) and crores (1,00,00,000 = 10 million).

| Value | International | Indian |
|------:|-------------:|-------:|
| 1,000 | 1,000 | 1,000 |
| 100,000 | 100,000 | 1,00,000 (1 lakh) |
| 10,000,000 | 10,000,000 | 1,00,00,000 (1 crore) |
| 1,000,000,000 | 1,000,000,000 | 1,00,00,00,000 (100 crore) |

Let's see both systems applied to population data:

```{r}
dplyr::tibble(
  city = c("Mumbai", "Delhi", "Bangalore", "Chennai"),
  population = c(20411000, 16787941, 8443675, 7088000)
) |>
  gt() |>
  cols_add(indian = population) |>
  fmt_integer(columns = population, system = "intl") |>
  fmt_integer(columns = indian, system = "ind") |>
  cols_label(
    population = "International",
    indian = "Indian"
  )
```

Mumbai's population of 20,411,000 in international notation becomes 2,04,11,000 in Indian notation (approximately 2 crore 4 lakh). For readers accustomed to the Indian system, this grouping is far more intuitive than the international format.

The `system` argument is available in `fmt_number()`, `fmt_integer()`, `fmt_percent()`, and `fmt_currency()`. When presenting financial data for Indian audiences, combining `system = "ind"` with Indian Rupee currency formatting creates familiar, readable output:

```{r}
dplyr::tibble(
  item = c("Revenue", "Expenses", "Profit"),
  amount = c(125750000, 98340000, 27410000)
) |>
  gt() |>
  fmt_currency(
    columns = amount,
    currency = "INR",
    system = "ind"
  )
```

The amounts are now displayed with Indian-style grouping and the Rupee symbol, making them immediately readable to anyone familiar with Indian financial notation. Revenue of ₹12,57,50,000 is easily parsed as "12 crore 57 lakh 50 thousand rupees."

### Locale-aware formatting

Many **gt** formatting functions include a `locale` argument that enables internationalization (i18n) of formatted output. When you specify a locale, **gt** automatically applies the appropriate conventions for that language and region: decimal separators, thousands separators, date formats, month and day names, and more.

Locales are specified using standard locale identifiers, typically a two-letter language code optionally followed by a region code: `"en"` for English, `"de"` for German, `"fr-CA"` for Canadian French, `"pt-BR"` for Brazilian Portuguese, and so on.

```{r}
dplyr::tibble(
  locale_code = c("en", "de", "fr", "es", "it"),
  language = c("English", "German", "French", "Spanish", "Italian"),
  value = rep(1234567.89, 5)
) |>
  gt() |>
  fmt_number(columns = value, rows = 1, decimals = 2, locale = "en") |>
  fmt_number(columns = value, rows = 2, decimals = 2, locale = "de") |>
  fmt_number(columns = value, rows = 3, decimals = 2, locale = "fr") |>
  fmt_number(columns = value, rows = 4, decimals = 2, locale = "es") |>
  fmt_number(columns = value, rows = 5, decimals = 2, locale = "it") |>
  cols_label(value = "Formatted Number")
```

The same numeric value appears differently in each locale. English uses a comma as the thousands separator and a period for decimals (1,234,567.89). German and Italian use a period for thousands and a comma for decimals (1.234.567,89). French uses a narrow non-breaking space for thousands and a comma for decimals (1 234 567,89). These are not arbitrary choices but rather they reflect the actual conventions used in those countries. Using the correct format signals respect for your international audience.

Rather than specifying `locale` in every formatting function call, you can set a default locale for the entire table in the `gt()` function:

```{r}
exibble |>
  dplyr::select(num, currency, date) |>
  dplyr::slice(1:4) |>
  gt(locale = "de") |>
  fmt_number(columns = num, decimals = 2) |>
  fmt_currency(columns = currency, currency = "EUR") |>
  fmt_date(columns = date, date_style = "yMMMd")
```

With `locale = "de"` set at the table level, all formatting functions inherit German conventions: numbers use period separators and comma decimals, the Euro symbol is placed according to German convention, and dates display German month abbreviations. Any formatting function can still override this default by specifying its own `locale` argument.

The functions that support the `locale` argument include: `fmt_number()`, `fmt_integer()`, `fmt_percent()`, `fmt_currency()`, `fmt_date()`, `fmt_time()`, `fmt_datetime()`, `fmt_duration()`, `fmt_spelled_num()`, and others. This comprehensive locale support makes **gt** well-suited for creating tables intended for international audiences or multilingual publications.

### Controlling when separators appear with `min_sep_threshold`

Several numeric formatting functions include a `min_sep_threshold` argument that controls when digit grouping separators (like commas in `1,000`) begin to appear. By default, separators are applied to numbers with four or more digits, but you can adjust this threshold to better match your data's context or your audience's expectations.

The `min_sep_threshold` value determines the *minimum number of digits in the integer part* required before separators are applied. A value of `1` (the default) applies separators starting at 4-digit numbers (1,000 and above). A value of `2` starts grouping at 5-digit numbers (10,000 and above), while `3` begins at 6-digit numbers (100,000 and above).

```{r}
dplyr::tibble(
  description = c("Hundreds", "Thousands", "Ten thousands", "Hundred thousands"),
  value = c(500, 5000, 50000, 500000)
) |>
  gt() |>
  cols_add(
    default_sep = value,
    threshold_2 = value,
    threshold_3 = value
  ) |>
  fmt_integer(columns = default_sep, min_sep_threshold = 1) |>
  fmt_integer(columns = threshold_2, min_sep_threshold = 2) |>
  fmt_integer(columns = threshold_3, min_sep_threshold = 3) |>
  cols_label(
    value = "Raw Value",
    default_sep = "Threshold 1 (default)",
    threshold_2 = "Threshold 2",
    threshold_3 = "Threshold 3"
  ) |>
  cols_hide(columns = value)
```

Notice how the separators appear at different magnitudes depending on the threshold. With the default `min_sep_threshold = 1`, the value 5,000 gets a comma. With `min_sep_threshold = 2`, that same value displays as 5000 (no separator), and the comma only appears at 50,000 and above. With `min_sep_threshold = 3`, even 50000 has no separator, as commas only begin at 500,000.

This argument is particularly useful when displaying data where smaller numbers are common and separators would add visual clutter:

```{r}
dplyr::tibble(
  product = c("Widget A", "Widget B", "Widget C", "Widget D"),
  units_sold = c(842, 1250, 3100, 15600),
  revenue = c(4210, 6250, 15500, 78000)
) |>
  gt() |>
  fmt_integer(columns = units_sold, min_sep_threshold = 2) |>
  fmt_currency(columns = revenue, currency = "USD", decimals = 0, min_sep_threshold = 2)
```

With `min_sep_threshold = 2`, the smaller unit counts (842, 1250, 3100) display without separators, keeping the column clean and easy to scan. Only 15,600 receives a separator. Similarly, the revenue column reserves separators for the larger values.

Note that if you specify a `locale`, the locale's conventions take precedence. Many locales have their own rules about minimum grouping digits based on CLDR (Common Locale Data Repository) data, and these will override your `min_sep_threshold` setting.

The `min_sep_threshold` argument is available in `fmt_number()`, `fmt_integer()`, `fmt_percent()`, `fmt_currency()`, and other numeric formatting functions.

## General-purpose formatting functions

Beyond the specialized formatters covered earlier, **gt** provides three general-purpose functions that handle cases where the built-in formatters either don't apply or where you need more flexibility.

### `fmt()`: creating custom formatters

When the built-in formatters don't meet your specific needs, the `fmt()` function provides a general-purpose mechanism for custom formatting. You supply your own transformation function that operates on the cell values. This is particularly valuable when you need domain-specific formatting logic, want to apply transformations that don't fit neatly into existing formatters, or need to integrate external formatting libraries.

Here is the function's signature:

```r
fmt(
  data,
  columns = everything(),
  rows = everything(),
  fns,
  pattern = "{x}"
)
```

The `fns` argument accepts a function that receives the column values as a vector and should return a character vector of the same length. Let's start with a simple example that adds decorative brackets around product codes:

```{r}
dplyr::tibble(
  item = c("Widget", "Gadget", "Sprocket"),
  code = c("WGT-001", "GDG-042", "SPR-099")
) |>
  gt() |>
  fmt(
    columns = code,
    fns = function(x) paste0("【", x, "】")
  )
```

The custom function wraps each code in decorative brackets. This approach offers unlimited flexibility as you can apply any R function to transform your cell values. Whether you need to apply regex substitutions, call external APIs, or implement complex business logic, `fmt()` gives you full control.

You can also combine `fmt()` with other **gt** functions for more sophisticated presentations. Here's an example where we format numeric values and then merge them with their corresponding units:

```{r}
dplyr::tibble(
  value = c(10.5, 20.3, 30.7),
  unit = c("kg", "lb", "oz")
) |>
  gt() |>
  fmt(
    columns = value,
    fns = function(x) {
      sprintf("%.1f", x)
    }
  ) |>
  cols_merge(columns = c(value, unit), pattern = "{1} {2}")
```

Here we format the numeric value using `sprintf()` for precise control over decimal places, then merge it with the unit column using `cols_merge()`. The result is a clean presentation where each measurement displays with its appropriate unit.

The power of `fmt()` lies in its generality. While the specialized formatters like `fmt_number()` and `fmt_currency()` handle common cases elegantly, `fmt()` serves as your escape hatch for everything else. Need to format phone numbers with specific regional conventions? Apply custom text transformations based on complex rules? Integrate with an external formatting library? The `fmt()` function makes all of this possible while still fitting naturally into **gt**'s formatting pipeline. Just remember that your custom function receives and should return character vectors, and you can leverage the full power of R's string manipulation capabilities.

### `fmt_auto()`: automatic formatting

When you want **gt** to make intelligent formatting decisions based on the data types and values in your columns, `fmt_auto()` provides automatic formatting. This is useful for quick data exploration or when you want sensible defaults without specifying each format individually.

Here is the function's signature:

```r
fmt_auto(
  data,
  columns = everything(),
  rows = everything(),
  locale = NULL
)
```

```{r}
exibble |>
  dplyr::select(num, char, currency, date) |>
  gt() |>
  fmt_auto()
```

The function examines each column and applies appropriate formatting: numbers get decimal formatting, dates are formatted in a readable style, and character columns are passed through unchanged.

### `fmt_passthrough()`: decoration without transformation

Sometimes you need to mark a column as "formatted" without actually changing its values, or you want to apply a pattern to values that don't need numeric or date formatting. The `fmt_passthrough()` function passes values through unchanged but allows you to use the `pattern` argument for decoration and control escaping behavior.

Here is the function's signature:

```r
fmt_passthrough(
  data,
  columns = everything(),
  rows = everything(),
  escape = TRUE,
  pattern = "{x}"
)
```

Let's use `fmt_passthrough()` with a pattern to add decorative text:

```{r}
dplyr::tibble(
  item = c("Widget", "Gadget", "Sprocket"),
  code = c("WGT-001", "GDG-042", "SPR-099")
) |>
  gt() |>
  fmt_passthrough(
    columns = code,
    pattern = "Code: {x}"
  )
```

The values pass through unchanged but gain the `"Code: "` prefix via the pattern.

An important feature of `fmt_passthrough()` is the `escape` argument. By default (`escape = TRUE`), text values are escaped for the output format. So HTML special characters like `<` and `>` are converted to `&lt;` and `&gt;`, and similar escaping occurs for special characters in LaTeX when working with that output format. However, when you set `escape = FALSE`, the text passes through without escaping, allowing you to include raw HTML or LaTeX markup directly in your cells:
 
```{r}
dplyr::tibble(
  item = c("Widget", "Gadget", "Sprocket"),
  styled = c(
    "<span style='color: red;'>Hot item</span>",
    "<em>Classic</em>",
    "<strong>Best seller</strong>"
  )
) |>
  gt() |>
  fmt_passthrough(columns = styled, escape = FALSE)
```

With `escape = FALSE`, the HTML tags render as styled text rather than appearing as literal `<span>` and `<em>` markup. This gives you an escape hatch for including arbitrary HTML (or LaTeX, when rendering to PDF) when **gt**'s built-in formatting functions don't cover your specific need. Use this capability sparingly (it ties your table to a specific output format) but it's invaluable when you need it.

## Summary

This chapter has covered the extensive suite of numeric formatting functions in **gt**. From the foundational `fmt_number()` and `fmt_integer()` to specialized formatters like `fmt_currency()`, `fmt_percent()`, `fmt_scientific()`, and `fmt_bytes()`, you now have the tools to present numeric data in virtually any format your tables require.

The key principles to remember:

- precision matters: choose decimal places thoughtfully. Too many creates clutter but too few loses important information. The `n_sigfig` argument offers an alternative approach when significant figures are more meaningful than fixed decimals.
- locale awareness: setting a locale (either globally in `gt()` or per-function) ensures your tables follow the numeric conventions your audience expects (decimal separators, digit grouping, and currency symbols all adapt automatically).
- patterns add context: The `pattern` argument lets you wrap formatted values in additional text, adding units, labels, or decorative elements without modifying the underlying data.
- conditional formatting: using the `rows` argument and helper functions like `from_column()`, you can apply different formatting to different subsets of your data.
- negative value handling: the `accounting` style, parentheses, and custom patterns give you multiple ways to present negative numbers appropriately for your context.

Numeric formatting is often the most visible aspect of table presentation (it's what readers look at first and remember longest). Getting it right transforms a wall of digits into information that communicates clearly.

In the next chapter, we turn to formatting functions for non-numeric data: dates, times, durations, text, URLs, images, flags, and icons. These formatters complete the picture, allowing you to handle any type of data that might appear in your tables.


---


# Formatting dates, text, and special values {#sec-formatting-dates-text}


Numbers may dominate most datasets, but tables come alive when they incorporate the full spectrum of data types. Dates tell us *when* something happened. Text provides names, descriptions, and categorical labels. URLs connect tables to the broader web. Images and icons add visual meaning that words and numbers alone cannot convey. Flags identify countries at a glance. Chemical formulas render with proper subscripts. This chapter explores the formatting functions that handle all of these non-numeric data types, transforming raw values into polished presentations.

The formatters covered here share a common philosophy with the numeric functions from the previous chapter: they operate on the underlying data without modifying it, they support locale-aware rendering where appropriate, and they integrate seamlessly into **gt** pipelines. But they also introduce capabilities unique to their data types. Date formatters must navigate the labyrinth of international conventions (is January 5th written as 1/5 or 5/1?). Text formatters can render Markdown, generate hyperlinks, or display email addresses. Image formatters embed graphics directly into cells. And special formatters like `fmt_flag()` and `fmt_icon()` bridge the gap between data and visual communication.

Consider a table of international sales data. The numeric columns benefit from the `fmt_*()` functions we've already learned. But the country codes: they're more meaningful as flag icons. Report dates need to follow the conventions of whoever is reading the table. And those product descriptions with markdown formatting should of course render properly rather than showing raw asterisks and brackets. This chapter gives you the tools to handle all such cases.

We'll start with temporal data (dates, times, and durations) where the challenge lies in choosing among dozens of valid formats for the same underlying value. From there, we move to text and URL formatting, including Markdown rendering. Then we explore the visual formatters that can embed images, country flags, and icons directly into your table cells. Finally, we cover specialized formatters for units, chemical formulas, and country names. By the end of this chapter, you'll have the complete toolkit for formatting any type of data that might appear in your tables.

## Date, time, and duration formats

Temporal data presents unique formatting challenges. The same date can be expressed in dozens of valid formats, and the choice depends on audience, locale, and context. **gt** provides `fmt_date()`, `fmt_time()`, `fmt_datetime()`, and `fmt_duration()` to handle these cases with support for 41 preset date styles and extensive localization.

### `fmt_date()`

The `fmt_date()` function formats date values using one of 41 preset styles. Input can be `Date` objects, `POSIXt` datetime objects, or character strings in ISO 8601 format.

Here is the function's signature:

```r
fmt_date(
  data,
  columns = everything(),
  rows = everything(),
  date_style = "iso",
  pattern = "{x}",
  locale = NULL
)
```

Let's format dates from the `exibble` dataset in "Month Day, Year" style:

```{r}
exibble |>
  dplyr::select(date, time) |>
  gt() |>
  fmt_date(
    columns = date,
    date_style = "month_day_year"
  )
```

The `date` column now displays in "Month Day, Year" format, a common style in American English contexts.

Different date styles serve different purposes:

```{r}
exibble |>
  dplyr::select(date) |>
  dplyr::slice(1:4) |>
  gt() |>
  cols_add(
    iso = date,
    full = date,
    compact = date
  ) |>
  fmt_date(columns = date, date_style = "wday_month_day_year") |>
  fmt_date(columns = iso, date_style = "iso") |>
  fmt_date(columns = full, date_style = "day_month_year") |>
  fmt_date(columns = compact, date_style = "yMd") |>
  cols_label(
    date = "Full (US)",
    iso = "ISO 8601",
    full = "Full (UK)",
    compact = "Compact"
  )
```

This table demonstrates four different date styles from the same source data. The "flexible" styles (like `"yMd"`) automatically adapt to the specified locale.

To explore all 41 available date styles, use `info_date_style()`, which displays an informative **gt** table showing each style's name, a description, and whether it's locale-flexible:

```{r}
info_date_style()
```

For reports that combine data from different regional sources, you can use `from_column()` to apply different date styles per row:

```{r}
dplyr::tibble(
  region = c("United States", "United Kingdom", "Japan", "Germany"),
  report_date = as.Date(c("2025-03-15", "2025-03-15", "2025-03-15", "2025-03-15")),
  date_format = c("month_day_year", "day_month_year", "yMd", "day_month_year")
) |>
  gt() |>
  fmt_date(
    columns = report_date,
    date_style = from_column("date_format")
  ) |>
  cols_hide(columns = date_format) |>
  cols_label(
    region = "Region",
    report_date = "Report Date"
  )
```

Each row displays the date in the format conventional for that region: "March 15, 2025" for the US, "15 March 2025" for the UK, and so on. This technique is valuable when creating localized reports or when displaying historical data that was originally recorded in different regional formats.

You can also use `from_column()` to switch locales, which affects how month and day names are rendered. When combined with flexible date styles (like `"yMMMd"` or `"yMMMEd"`), locales also change the *ordering* of date components to match regional conventions:

```{r}
dplyr::tibble(
  country = c("United States", "France", "Germany", "Japan", "China"),
  event_date = as.Date("2025-06-15"),
  locale_code = c("en_US", "fr", "de", "ja", "zh")
) |>
  gt() |>
  fmt_date(
    columns = event_date,
    date_style = "yMMMd",
    locale = from_column("locale_code")
  ) |>
  cols_hide(columns = locale_code) |>
  cols_label(
    country = "Country",
    event_date = "Event Date"
  )
```

Notice that it's not just translation: the US format puts the month before the day (`"Jun 15, 2025"`), while European locales put the day first (`"15 juin 2025"` in French). Asian locales typically use year-month-day order. The flexible date styles automatically adapt to each locale's conventions for both component ordering and separators.

### `fmt_time()`

Time formatting follows similar principles. The `fmt_time()` function formats input values to time values using one of 25 preset time styles. Input can be in the form of `POSIXt` (i.e., datetimes), character (must be in the ISO 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which always results in the formatting of `00:00:00`).

Here is the function's signature:

```r
fmt_time(
  data,
  columns = everything(),
  rows = everything(),
  time_style = "iso",
  pattern = "{x}",
  locale = NULL
)
```

Let's format times from the `exibble` dataset in 12-hour format:

```{r}
exibble |>
  dplyr::select(time) |>
  gt() |>
  fmt_time(
    columns = time,
    time_style = "h_m_p"
  )
```

The times now display in 12-hour format with AM/PM indicators, a common format for general audiences.

To see all available time styles, use `info_time_style()`:

```{r}
info_time_style()
```

Like date styles, some time styles are locale-flexible (adapting to 12-hour or 24-hour conventions based on the locale), while others produce fixed output regardless of locale.

### `fmt_datetime()`

When you have full datetime values, `fmt_datetime()` combines date and time formatting. This function offers two approaches: using preset styles for the date and time components separately, or using a custom `format` string for complete control over the output.

Here is the function's signature:

```r
fmt_datetime(
  data,
  columns = everything(),
  rows = everything(),
  date_style = "iso",
  time_style = "iso",
  sep = " ",
  format = NULL,
  tz = NULL,
  pattern = "{x}",
  locale = NULL
)
```

The simplest approach combines preset `date_style` and `time_style` values:

```{r}
exibble |>
  dplyr::select(datetime) |>
  gt() |>
  fmt_datetime(
    columns = datetime,
    date_style = "yMMMd",
    time_style = "Hm"
  )
```

The datetime column now shows both the date (in "Feb 29, 2000" style) and time (in 24-hour format), providing complete temporal information. The `sep` argument controls the separator between date and time (defaults to a single space).

#### Custom formatting with the `format` argument

For complete control over datetime output, the `format` argument accepts formatting strings in two different syntaxes: CLDR (Common Locale Data Repository) datetime patterns and `strptime` format codes. Both are powerful, but CLDR patterns offer better locale support and more formatting options.

*CLDR datetime patterns* use pattern characters that repeat to indicate output width. Here are some examples using a datetime of `"2018-07-04T22:05:09"`:

- `"EEEE, MMMM d, y"` → `"Wednesday, July 4, 2018"`
- `"MMM d, y 'at' h:mm a"` → `"Jul 4, 2018 at 10:05 PM"`
- `"y-MM-dd HH:mm"` → `"2018-07-04 22:05"`

The key CLDR pattern characters include:

```{r}

dplyr::tibble(
 Character = c("`y`", "`M`", "`d`", "`E`", "`H`", "`h`", "`m`", "`s`", "`a`"),
 Meaning = c("Year", "Month", "Day of month", "Day of week", "Hour (0-23)", "Hour (1-12)", "Minute", "Second", "AM/PM"),
 Examples = c('`y` → "2018", `yy` → "18"', '`M` → "7", `MM` → "07", `MMM` → "Jul", `MMMM` → "July"', '`d` → "4", `dd` → "04"', '`E` → "Wed", `EEEE` → "Wednesday"', '`H` → "22", `HH` → "22"', '`h` → "10", `hh` → "10"', '`m` → "5", `mm` → "05"', '`s` → "9", `ss` → "09"', '`a` → "PM"')
) |>
 gt() |>
 fmt_markdown(columns = c(Character, Examples))
```

Literal text can be included by surrounding it with single quotes:

```{r}
exibble |>
  dplyr::select(datetime) |>
  dplyr::slice(1:4) |>
  gt() |>
  fmt_datetime(
    columns = datetime,
    format = "EEEE, MMMM d, y 'at' h:mm a"
  )
```

**`strptime` format codes** use a `%` prefix for each component. The same datetime formatted with `strptime` codes:

- `"%A, %B %e, %Y"` → `"Wednesday, July 4, 2018"`
- `"%b %e, %Y at %I:%M %p"` → `"Jul 4, 2018 at 10:05 PM"`
- `"%Y-%m-%d %H:%M"` → `"2018-07-04 22:05"`

Common `strptime` codes include:

```{r}

dplyr::tibble(
  Code = c("`%Y`", "`%y`", "`%m`", "`%b`", "`%B`", "`%d`", "`%e`", "`%A`", "`%H`", "`%I`", "`%M`", "`%S`", "`%p`"),
  Meaning = c("4-digit year", "2-digit year", "Month number (zero-padded)", "Abbreviated month name", "Full month name", "Day (zero-padded)", "Day (space-padded)", "Full weekday name", "Hour 0-23", "Hour 1-12", "Minute", "Second", "AM/PM"),
  Example = c('"2018"', '"18"', '"07"', '"Jul"', '"July"', '"04"', '" 4"', '"Wednesday"', '"22"', '"10"', '"05"', '"09"', '"PM"')
) |>
  gt() |>
  fmt_markdown(columns = Code)
```

Here's the same friendly datetime format from before, now using `strptime` codes instead of CLDR patterns:

```{r}
exibble |>
  dplyr::select(datetime) |>
  dplyr::slice(1:4) |>
  gt() |>
  fmt_datetime(
    columns = datetime,
    format = "%A, %B %e, %Y at %I:%M %p"
  )
```

The output is nearly identical to the CLDR version. The `"%A"` gives the full weekday name, `"%B"` the full month name, `"%e"` the day without zero-padding, and `"%I:%M %p"` produces 12-hour time with AM/PM.

#### Working with time zones

The `tz` argument lets you convert datetimes to a specific time zone for display. This is particularly useful when your data is stored in UTC but you want to display it in local time:

```{r}
exibble |>
  dplyr::select(datetime) |>
  dplyr::slice(1:3) |>
  gt() |>
  fmt_datetime(
    columns = datetime,
    format = "EEEE, MMMM d, y 'at' h:mm a (zzzz)",
    tz = "America/Vancouver"
  )
```

The `"zzzz"` pattern character displays the full time zone name. You can use shorter variants like `"z"` (abbreviated) or `"Z"` (UTC offset).

#### CLDR vs strptime: which to choose?

CLDR patterns are generally preferred because they have:

1. better locale support, where patterns adapt to locale conventions automatically
2. more options: patterns for eras, quarters, flexible day periods ("in the afternoon"), and more
3. richer time zone display options

Use `strptime` when you need compatibility with R's base date formatting functions or when working with existing format strings from other code.

For a comprehensive reference of all CLDR pattern fields and `strptime` format codes, see @sec-appendix-datetime.

### `fmt_duration()`

For time intervals and durations, `fmt_duration()` converts numeric values (representing seconds or other units) into human-readable duration strings.

Here is the function's signature:

```r
fmt_duration(
  data,
  columns = everything(),
  rows = everything(),
  input_units = NULL,
  output_units = NULL,
  duration_style = c("narrow", "wide", "colon-sep", "iso"),
  trim_zero_units = TRUE,
  max_output_units = NULL,
  pattern = "{x}",
  locale = NULL
)
```

Let's format task durations from raw second values:

```{r}
dplyr::tibble(
  task = c("Backup", "Index rebuild", "Report generation"),
  duration_secs = c(45, 3661, 127)
) |>
  gt() |>
  fmt_duration(
    columns = duration_secs,
    input_units = "seconds"
  )
```

The raw second counts are transformed into readable durations like "1h 1m 1s", making the time requirements immediately clear.

The `duration_style` argument controls the output format:

```{r}
dplyr::tibble(
  task = c("Short task", "Medium task", "Long task"),
  seconds = c(90, 3725, 86520)
) |>
  gt() |>
  cols_add(
    narrow = seconds,
    wide = seconds,
    colon = seconds,
    iso = seconds
  ) |>
  fmt_duration(columns = narrow, input_units = "seconds", duration_style = "narrow") |>
  fmt_duration(columns = wide, input_units = "seconds", duration_style = "wide") |>
  fmt_duration(columns = colon, input_units = "seconds", duration_style = "colon-sep") |>
  fmt_duration(columns = iso, input_units = "seconds", duration_style = "iso") |>
  cols_hide(columns = seconds) |>
  cols_label(
    task = "Task",
    narrow = "Narrow",
    wide = "Wide",
    colon = "Colon-sep",
    iso = "ISO"
  )
```

Each style serves different purposes: `"narrow"` is compact, `"wide"` is more readable, `"colon-sep"` follows familiar clock notation (HH:MM:SS), and `"iso"` produces ISO 8601 duration format.

## Formatting with Markdown, creating links, adding images

Beyond numeric and temporal data, **gt** can format text as Markdown, create hyperlinks, and embed images directly in table cells.

### `fmt_markdown()`

The `fmt_markdown()` function interprets cell content as Markdown, rendering formatting, links, and other Markdown elements.

Here is the function's signature:

```r
fmt_markdown(
  data,
  columns = everything(),
  rows = everything(),
  md_engine = c("markdown", "commonmark")
)
```

Let's demonstrate various Markdown formatting options:

```{r}
dplyr::tibble(
  feature = c("**Bold text**", "*Italic text*", "`Code text`", "[Link](https://gt.rstudio.com)"),
  description = c("Emphasis", "Emphasis", "Monospace", "Hyperlink")
) |>
  gt() |>
  fmt_markdown(columns = feature)
```

The Markdown syntax in the `feature` column is now rendered as formatted text, allowing rich content within table cells.

### `fmt_url()`

For URL values, `fmt_url()` creates clickable hyperlinks.

Here is the function's signature:

```r
fmt_url(
  data,
  columns = everything(),
  rows = everything(),
  label = NULL,
  as_button = FALSE,
  button_fill = "auto",
  button_width = "auto",
  button_outline = "auto",
  show_underline = "auto",
  color = "auto"
)
```

Let's create a table of R package documentation links formatted as buttons:

```{r}
dplyr::tibble(
  package = c("gt", "dplyr", "ggplot2"),
  url = c(
    "https://gt.rstudio.com",
    "https://dplyr.tidyverse.org",
    "https://ggplot2.tidyverse.org"
  )
) |>
  gt() |>
  fmt_url(columns = url, as_button = TRUE)
```

The URLs are now displayed as styled buttons that readers can click to navigate to the linked pages.

### `fmt_email()`

Email addresses can be formatted as clickable "mailto:" links using `fmt_email()`.

Here is the function's signature:

```r
fmt_email(
  data,
  columns = everything(),
  rows = everything(),
  display_name = NULL,
  as_button = FALSE,
  button_fill = "auto",
  button_width = "auto",
  button_outline = "auto",
  show_underline = "auto",
  color = "auto"
)
```

Let's turn email addresses into clickable mailto links:

```{r}
dplyr::tibble(
  name = c("Alice Smith", "Bob Jones", "Carol White"),
  email = c("alice@example.com", "bob@example.com", "carol@example.com")
) |>
  gt() |>
  fmt_email(columns = email)
```

The email addresses become clickable links that will open the user's email client when clicked. This is particularly useful for contact directories or team rosters.

Here's a more complete example using the `peeps` dataset to create a contact directory with formatted email addresses and mailing addresses:

```{r}
peeps |>
  dplyr::filter(country == "AUS") |>
  dplyr::select(
    starts_with("name"),
    address, city, state_prov, postcode, country, email_addr
  ) |>
  dplyr::mutate(city = toupper(city)) |>
  gt(rowname_col = "name_family") |>
  tab_header(title = "Our Contacts in Australia") |>
  tab_stubhead(label = "Name") |>
  fmt_email(columns = email_addr) |>
  fmt_country(columns = country) |>
  cols_merge(
    columns = c(address, city, state_prov, postcode, country),
    pattern = "{1}<br>{2} {3} {4}<br>{5}"
  ) |>
  cols_merge(
    columns = c(name_family, name_given),
    pattern = "{1},<br>{2}"
  ) |>
  cols_label(
    address = "Mailing Address",
    email_addr = "Email"
  ) |>
  tab_style(
    style = cell_text(size = "x-small"),
    locations = cells_body(columns = address)
  ) |>
  opt_align_table_header(align = "left")
```

This example demonstrates how `fmt_email()` integrates with other **gt** functions to create a polished contact directory. The email addresses are clickable, while `cols_merge()` combines address components into a single formatted cell.

### `fmt_image()`

The `fmt_image()` function renders file paths as inline images.

Here is the function's signature:

```r
fmt_image(
  data,
  columns = everything(),
  rows = everything(),
  height = NULL,
  width = NULL,
  sep = " ",
  path = NULL,
  file_pattern = "{}",
  encode = TRUE
)
```
 
```{r}
dplyr::tibble(
  name = c("Image A", "Image B"),
  path = c("images/a.png", "images/b.png")
) |>
  gt() |>
  fmt_image(columns = path, height = 50)
```

This function is particularly powerful for creating visual catalogs or including small graphics within data tables.

## Flags and country formatting

When presenting international data, flags and country names can provide immediate visual recognition and context.

### `fmt_flag()`

The `fmt_flag()` function converts 2- or 3-letter ISO 3166-1 country codes into circular flag icons. The function seamlessly handles both uppercase and lowercase codes.

Here is the function's signature:

```r
fmt_flag(
  data,
  columns = everything(),
  rows = everything(),
  height = "1em",
  sep = " ",
  use_title = TRUE,
  locale = NULL
)
```

```{r}
countrypops |>
  dplyr::filter(year == 2021) |>
  dplyr::slice_max(population, n = 8) |>
  dplyr::select(country_code_2, country_name, population) |>
  gt() |>
  fmt_flag(columns = country_code_2) |>
  fmt_integer(columns = population) |>
  cols_label(
    country_code_2 = "",
    country_name = "Country",
    population = "Population (2021)"
  )
```

The two-letter country codes are replaced with their corresponding flag icons. Hovering over a flag shows the country name as a tooltip (controlled by `use_title = TRUE`, the default). This adds visual interest and makes it easier to quickly identify countries.

#### Controlling flag size

The `height` argument adjusts the size of flag icons. The default `"1em"` scales with the text size, but you can specify other CSS units:

```{r}
dplyr::tibble(
  country = c("US", "CN", "IN", "BR"),
  small = country,
  medium = country,
  large = country
) |>
  gt() |>
  fmt_flag(columns = small, height = "0.8em") |>
  fmt_flag(columns = medium, height = "1.5em") |>
  fmt_flag(columns = large, height = "2.5em") |>
  cols_label(
    country = "Code",
    small = "Small",
    medium = "Medium",
    large = "Large"
  ) |>
  cols_align(align = "center", columns = c(small, medium, large))
```

Different flag sizes can help establish visual hierarchy. Larger flags might be appropriate in header sections or key summary rows, while smaller flags work well in dense data tables.

#### Multiple flags per cell

The `fmt_flag()` function works well even when there are multiple country codes within the same cell. It parses comma-separated codes automatically, and when rendered to HTML, hovering over each flag icon displays a tooltip with the country name. The input must use commas as delimiters (with no spaces), while the `sep` argument controls the spacing between rendered flag icons in the output.

```{r}
dplyr::tibble(
  region = c("North America", "European Union (founders)", "BRICS", "Nordic Countries"),
  countries = c("US,CA,MX", "BE,FR,DE,IT,LU,NL", "BR,RU,IN,CN,ZA", "DK,FI,IS,NO,SE")
) |>
  gt() |>
  fmt_flag(columns = countries, sep = " ") |>
  cols_label(
    region = "Region/Group",
    countries = "Member Countries"
  ) |>
  cols_width(countries ~ px(300))
```

Multiple flags are displayed inline, making it easy to see country groupings or collaborations at a glance. The default `sep = " "` provides a single space between flags, but you can adjust this for tighter or looser spacing.

Here's another example that groups countries by population size, demonstrating how `fmt_flag()` handles dynamically aggregated country codes:

```{r}
countrypops |>
  dplyr::filter(year == 2021, population < 100000) |>
  dplyr::select(country_code_2, population) |>
  dplyr::mutate(population_class = cut(
    population,
    breaks = scales::breaks_pretty(n = 5)(population)
    )
  ) |>
  dplyr::group_by(population_class) |>
  dplyr::summarize(
    countries = paste0(country_code_2, collapse = ",")
  ) |>
  dplyr::arrange(desc(population_class)) |>
  gt() |>
  tab_header(title = "Countries with Small Populations") |>
  fmt_flag(columns = countries) |>
  fmt_bins(
    columns = population_class,
    fmt = ~ fmt_integer(., suffixing = TRUE)
  ) |>
  cols_label(
    population_class = "Population Range",
    countries = "Countries"
  ) |>
  cols_width(population_class ~ px(150))
```

This example uses `paste0()` with `collapse = ","` to aggregate country codes within each population bin, and `fmt_flag()` seamlessly renders all flags in each cell.

#### Localized tooltips

The `locale` argument controls the language used in the hover tooltips. This is especially useful when creating tables for international audiences:

```{r}
dplyr::tibble(
  code = c("JP", "KR", "CN", "TH"),
  flag_en = code,
  flag_ja = code,
  flag_ko = code
) |>
  gt() |>
  fmt_flag(columns = flag_en, locale = "en") |>
  fmt_flag(columns = flag_ja, locale = "ja") |>
  fmt_flag(columns = flag_ko, locale = "ko") |>
  cols_label(
    code = "Code",
    flag_en = "English Tooltip",
    flag_ja = "Japanese Tooltip",
    flag_ko = "Korean Tooltip"
  ) |>
  cols_align(align = "center", columns = c(flag_en, flag_ja, flag_ko))
```

When hovering over these flags, the country names appear in the specified language. The English column shows "Japan", the Japanese column shows "日本", and the Korean column shows "일본".

#### Merging flags into row labels

Flag icons can be merged into the stub column to create visually distinctive row labels:

```{r}
countrypops |>
  dplyr::filter(country_code_2 %in% c("BE", "NL", "LU")) |>
  dplyr::filter(year %% 10 == 0, year >= 2000) |>
  dplyr::select(country_name, country_code_2, year, population) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  dplyr::arrange(country_name) |>
  gt(rowname_col = "country_name") |>
  fmt_flag(columns = country_code_2) |>
  cols_merge(
    columns = c(country_name, country_code_2),
    pattern = "{2} {1}"
  ) |>
  fmt_integer() |>
  tab_header(title = "Benelux Population by Decade") |>
  tab_spanner(columns = everything(), label = "Year")
```

The stub now displays flag icons followed by country names, creating an elegant visual identifier for each row. This technique is particularly effective for country comparisons or regional analyses.

### `fmt_country()`

Conversely, if you have country codes but want to display full country names, use `fmt_country()`. This function accepts both 2-letter and 3-letter ISO 3166-1 country codes and converts them to full country names from the Unicode CLDR (Common Locale Data Repository).

Here is the function's signature:

```r
fmt_country(
  data,
  columns = everything(),
  rows = everything(),
  pattern = "{x}",
  sep = " ",
  locale = NULL
)
```

```{r}
countrypops |>
  dplyr::filter(year == 2021) |>
  dplyr::slice_max(population, n = 5) |>
  dplyr::select(country_code_3, population) |>
  gt() |>
  fmt_country(columns = country_code_3) |>
  fmt_integer(columns = population) |>
  cols_label(
    country_code_3 = "Country",
    population = "Population (2021)"
  )
```

The three-letter country codes are replaced with full country names.

The country names come from the Unicode CLDR (Common Locale Data Repository), where names are agreed upon by consensus. Furthermore, these names can be localized to any of 574 different locales via the `locale` argument.

Here's an example showing how the same country code resolves to different exonyms depending on the locale:

```{r}
dplyr::tibble(
  locale = c("en", "fr", "de", "it", "ja", "zh", "ko", "ar"),
  country = "DE"
) |>
  gt() |>
  fmt_country(columns = country, locale = from_column("locale")) |>
  cols_label(
    locale = "Locale",
    country = "Country Name"
  )
```

Each row shows "DE" (Germany) translated into the language specified by the locale column: English, French, German, Japanese, Chinese, Arabic, and Russian.

Here's a more comprehensive example using the `films` dataset. The `fmt_country()` function handles multiple comma-separated country codes per cell, which is common for international co-productions:

```{r}
films |>
  dplyr::filter(year == 1959) |>
  dplyr::select(
    title, run_time, director, countries_of_origin, imdb_url
  ) |>
  gt() |>
  tab_header(title = "Feature Films in Competition at the 1959 Festival") |>
  fmt_country(columns = countries_of_origin, sep = ", ") |>
  fmt_url(
    columns = imdb_url,
    label = fontawesome::fa("imdb", fill = "black")
  ) |>
  cols_merge(
    columns = c(title, imdb_url),
    pattern = "{1} {2}"
  ) |>
  cols_label(
    title = "Film",
    run_time = "Length",
    director = "Director",
    countries_of_origin = "Country"
  ) |>
  opt_vertical_padding(scale = 0.5) |>
  opt_horizontal_padding(scale = 2.5) |>
  opt_table_font(stack = "classical-humanist", weight = "bold") |>
  opt_stylize(style = 1, color = "gray") |>
  tab_options(heading.title.font.size = px(26))
```

Notice that `fmt_country()` can resolve historical country codes that no longer exist. Codes like `"SU"` (USSR), `"CS"` (Czechoslovakia), and `"YU"` (Yugoslavia) are properly resolved to their historical names, which is essential when working with archival data.

#### Localized country names

The `locale` argument enables country names to be displayed in different languages, making tables more accessible to international audiences:

```{r}
dplyr::tibble(
  code = c("JP", "DE", "BR", "IN", "ZA"),
  english = code,
  japanese = code,
  german = code
) |>
  gt() |>
  fmt_country(columns = english, locale = "en") |>
  fmt_country(columns = japanese, locale = "ja") |>
  fmt_country(columns = german, locale = "de") |>
  cols_label(
    code = "Code",
    english = "English",
    japanese = "日本語",
    german = "Deutsch"
  )
```

The same country codes are rendered in English, Japanese, and German. This is particularly useful for creating multilingual reports or tables intended for specific regional audiences.

#### Multiple countries per cell

When cells contain multiple comma-separated country codes, `fmt_country()` handles them automatically. The `sep` argument controls the separator between country names:

```{r}
dplyr::tibble(
  film = c("The Grand Budapest Hotel", "Amélie", "Run Lola Run"),
  countries = c("US,DE", "FR", "DE")
) |>
  gt() |>
  fmt_country(columns = countries, sep = " / ") |>
  cols_label(
    film = "Film",
    countries = "Production Countries"
  )
```

For films with co-production arrangements, multiple countries are displayed with a custom separator (here, " / "), making the relationships clear while maintaining readability.

#### Combining `fmt_flag()` and `fmt_country()`

Flag icons and country names work beautifully together. Here's how to combine them using `cols_merge()`:

```{r}
countrypops |>
  dplyr::filter(year == 2021) |>
  dplyr::slice_max(population, n = 8) |>
  dplyr::select(country_code_2, country_code_3, population) |>
  gt() |>
  fmt_flag(columns = country_code_2) |>
  fmt_country(columns = country_code_3) |>
  cols_merge(
    columns = c(country_code_2, country_code_3),
    pattern = "{1} {2}"
  ) |>
  fmt_integer(columns = population) |>
  cols_label(
    country_code_2 = "Country",
    population = "Population (2021)"
  )
```

The merged column now displays both the flag icon and the country name side by side, creating a visually rich and informative presentation. The flag provides instant visual recognition while the name ensures clarity.

## Icons in table cells

### `fmt_icon()`

For adding Font Awesome icons to table cells, `fmt_icon()` converts icon names to rendered icons.

Here is the function's signature:

```r
fmt_icon(
  data,
  columns = everything(),
  rows = everything(),
  height = "1em",
  sep = " ",
  stroke_color = NULL,
  stroke_width = NULL,
  stroke_alpha = NULL,
  fill_color = NULL,
  fill_alpha = NULL,
  margin_left = NULL,
  margin_right = NULL,
  v_adjust = NULL,
  a11y = c("semantic", "decorative", "none")
)
```

Let's add Font Awesome icons to represent different file types:

```{r}
dplyr::tibble(
  category = c("Documents", "Images", "Music", "Videos"),
  icon = c("file-alt", "image", "music", "video"),
  count = c(42, 18, 95, 12)
) |>
  gt() |>
  fmt_icon(columns = icon) |>
  fmt_integer(columns = count)
```

The icon names are replaced with the corresponding Font Awesome icons. This is useful for creating visual category indicators or status displays.

You can customize icon appearance with color options:

```{r}
dplyr::tibble(
  status = c("Success", "Warning", "Error", "Info"),
  icon = c("check-circle", "exclamation-triangle", "times-circle", "info-circle"),
  color = c("green", "orange", "red", "blue")
) |>
  gt() |>
  fmt_icon(columns = icon, fill_color = from_column("color")) |>
  cols_hide(columns = color)
```

Each icon is colored according to its status, creating an immediately recognizable visual language for status indicators.

To explore all available icons, use `info_icons()`:

```{r}
info_icons()
```

## Scientific and technical notation

### `fmt_units()`

Scientific and technical writing often requires properly formatted units with superscripts, subscripts, and special symbols. The `fmt_units()` function interprets a simple text notation and renders it with correct typography.

::: {.callout-note}
The units notation described here is the same notation used in column labels (see the section on [Incorporating units with **gt**'s units notation](02-table-components.qmd#incorporating-units-with-gts-units-notation) in @sec-table-components). That section provides additional details on Greek letters, automatic symbol conversions, chemical formulas, and text formatting options.
:::

Here is the function's signature:

```r
fmt_units(
  data,
  columns = everything(),
  rows = everything(),
  pattern = "{x}"
)
```

Let's format a table of physical quantities with their SI units:

```{r}
dplyr::tibble(
  quantity = c("Acceleration", "Energy", "Pressure", "Density"),
  unit = c("m/s^2", "kg*m^2/s^2", "N/m^2", "kg/m^3")
) |>
  gt() |>
  fmt_units(columns = unit)
```

The unit strings are rendered with proper formatting: exponents become superscripts, the asterisk becomes a multiplication dot, and the slash indicates division. This notation follows the conventions of scientific typesetting without requiring HTML or LaTeX markup in your data.

The units notation uses a simple but expressive syntax. Here are the key elements:

```{r}

dplyr::tibble(
  Notation = c("`^`", "`_`", "`*`", "`/`", "`()`", "`{{}}`", "`-`"),
  Meaning = c("Superscript (exponent)", "Subscript", "Multiplication (·)", "Division (per)", "Grouping", "Subscript text", "Minus in exponent"),
  `Example Input` = c("`m^2`", "`x_0`", "`kg*m`", "`m/s`", "`J/(kg*K)`", "`x_{{avg}}`", "`m^-1`"),
  `Renders As` = c("m²", "x₀", "kg·m", "m/s", "J/(kg·K)", "x<sub>avg</sub>", "m⁻¹")
) |>
  gt() |>
  fmt_markdown(columns = c(Notation, `Example Input`)) |>
  fmt_markdown(columns = `Renders As`)
```

These elements can be combined to express complex units:

```{r}
dplyr::tibble(
  notation = c("m/s^2", "kg*m^2/s^2", "W/(m^2*K)", "mol^-1", "m^3/(kg*s^2)"),
  description = c(
    "Acceleration", 
    "Energy (Joules)", 
    "Heat transfer coefficient",
    "Per mole",
    "Gravitational constant units"
  )
) |>
  gt() |>
  fmt_units(columns = notation) |>
  cols_move(columns = description, after = notation) |>
  cols_label(notation = "Rendered Unit", description = "Physical Quantity")
```

The notation is intuitive for anyone familiar with scientific writing. You write units almost as you would speak them. So "meters per second squared" becomes `m/s^2`, and "watts per square meter kelvin" becomes `W/(m^2*K)`.

The unit notation supports a rich syntax for complex expressions:

```{r}
dplyr::tibble(
  quantity = c("Heat capacity", "Thermal conductivity", "Viscosity"),
  unit = c("J/(kg*K)", "W/(m*K)", "kg/(m*s)")
) |>
  gt() |>
  fmt_units(columns = unit)
```

Parentheses group terms correctly, ensuring the denominator is rendered as a single unit. This creates publication-ready unit formatting directly from simple text notation.

### `fmt_chem()`

Chemical formulas require specific formatting: subscripts for atom counts, superscripts for charges, and proper handling of isotopes and reactions. The `fmt_chem()` function interprets chemistry notation and renders it correctly.

Here is the function's signature:

```r
fmt_chem(
  data,
  columns = everything(),
  rows = everything(),
  pattern = "{x}"
)
```

The chemistry notation that **gt** uses should be intuitive for anyone familiar with chemical formulas. Here's a comprehensive reference:

```{r}

dplyr::tibble(
  category = c(
    rep("CHEMICAL FORMULAS", 4),
    rep("CHARGES", 5),
    rep("STOICHIOMETRY", 3),
    rep("NUCLIDES/ISOTOPES", 5),
    rep("VARIABLES ITALICIZED", 5),
    rep("GREEK CHARACTERS", 2),
    rep("PRECIPITATES AND GASES", 2),
    rep("ADDITION COMPOUNDS", 2),
    rep("CHEMICAL REACTIONS", 3),
    rep("BONDS", 2)
  ),
  input = c(
    "CH3O2", "(NH4)2S", "Ca3(PO4)2", "Sb2O3",
    "H+", "[AgCl2]-", "CrO4^2-", "CO3^2-", "Y^99+",
    "0.5 H2O", "2H2O2", "2 H2O",
    "^{230}_{90}Th+", "^65Cu^{2+}", "^27_14Si13", "^{0}_{-1}n^{-}", "^0_-1n-",
    "NO_x", "Fe^n+", "x Na(NH4)HPO4", "*n* H2O", "*n*-C5H12",
    ":delta: ^13C", ":mu:-Cl",
    "SO4^2- + Ba^2+ -> BaSO4 v", "A v B (v) -> B ^ B (^)",
    "KCr(SO4)2 * 12 H2O", "KCl . MgCl2 . 6 H2O",
    "2CH3OH -> CH3OCH3 + H2O", "O3 -> O(^1D) + O2", "H2(g) + I2(g) <=> 2HI (g)",
    "C6H5-CHO", "CH3CH=CH2"
  ),
  output = input
) |>
  gt(groupname_col = "category") |>
  tab_header(title = md("Formatting with `fmt_chem()`")) |>
  fmt_chem(columns = output) |>
  tab_options(column_labels.hidden = TRUE) |>
  tab_style(
    style = cell_text(font = google_font(name = "IBM Plex Mono")),
    locations = cells_body(columns = input)
  ) |>
  tab_style(
    style = cell_text(font = google_font(name = "IBM Plex Serif")),
    locations = list(cells_row_groups(), cells_body(columns = output))
  ) |>
  tab_style(
    style = cell_text(size = "smaller"),
    locations = cells_row_groups()
  ) |>
  tab_style(
    style = cell_fill(color = "gray97"),
    locations = cells_body(columns = input)
  ) |>
  tab_style(
    style = cell_borders(sides = "right", color = "gray92", weight = px(2)),
    locations = cells_body(columns = input)
  ) |>
  cols_width(everything() ~ px(265)) |>
  opt_align_table_header(align = "left")
```

Let's see basic formula formatting in action:

```{r}
dplyr::tibble(
  name = c("Water", "Sulfuric acid", "Glucose", "Calcium carbonate"),
  formula = c("H2O", "H2SO4", "C6H12O6", "CaCO3")
) |>
  gt() |>
  fmt_chem(columns = formula)
```

The numbers in the formulas become subscripts, transforming `"H2O"` into the properly typeset `"H₂O"`. This is essential for any table presenting chemical data.

Ionic compounds and charges are handled elegantly:

```{r}
dplyr::tibble(
  ion = c("Hydroxide", "Sulfate", "Ammonium", "Phosphate", "Iron(III)"),
  formula = c("OH^-", "SO4^2-", "NH4^+", "PO4^3-", "Fe^3+")
) |>
  gt() |>
  fmt_chem(columns = formula)
```

Charges are rendered as superscripts with the appropriate sign, creating properly formatted ionic formulas suitable for scientific publication.

For isotope notation (common in nuclear chemistry and radiochemistry) the function supports full nuclide representation:

```{r}
dplyr::tibble(
  isotope = c("Carbon-14", "Uranium-235", "Thorium-227", "Deuterium"),
  notation = c("^14_6C", "^235_92U", "^{227}_{90}Th", "^2_1H")
) |>
  gt() |>
  fmt_chem(columns = notation)
```

The mass number appears as a superscript and the atomic number as a subscript, positioned before the element symbol: the standard convention for nuclide notation.

Chemical reactions can be expressed with various arrow styles:

```{r}
dplyr::tibble(
  reaction_type = c(
    "Forward reaction",
    "Reversible reaction", 
    "Equilibrium",
    "Equilibrium (forward favored)"
  ),
  reaction = c(
    "2H2 + O2 -> 2H2O",
    "N2 + 3H2 <--> 2NH3",
    "CH3COOH + H2O <=> CH3COO^- + H3O^+",
    "HCl + H2O <=>> Cl^- + H3O^+"
  )
) |>
  gt() |>
  fmt_chem(columns = reaction)
```

Each arrow type has a specific meaning in chemistry: `->` for irreversible reactions, `<-->` for reversible reactions, `<=>` for equilibrium, and `<=>>` or `<<=>` for equilibria that favor one direction.

Hydrates and addition compounds use the centered dot notation:

```{r}
dplyr::tibble(
  name = c(
    "Copper(II) sulfate pentahydrate",
    "Magnesium sulfate heptahydrate",
    "Chrome alum"
  ),
  formula = c(
    "CuSO4 . 5 H2O",
    "MgSO4 . 7 H2O",
    "KCr(SO4)2 . 12 H2O"
  )
) |>
  gt() |>
  fmt_chem(columns = formula)
```

The period surrounded by spaces becomes a centered dot (·), the standard notation for waters of hydration and other addition compounds.

## Summary

This chapter has explored the formatting functions that handle non-numeric data: the dates, times, text, URLs, images, and special elements that bring tables to life beyond raw numbers.

The key capabilities we've covered:

- temporal formatting: `fmt_date()`, `fmt_time()`, and `fmt_datetime()` provide 41 date styles and 25 time styles, with full locale support for international audiences. Custom formatting through CLDR patterns or `strptime` codes gives you complete control when preset styles aren't enough. The `fmt_duration()` function transforms raw seconds into human-readable time spans.
- text and links: `fmt_markdown()` renders rich text formatting within cells, while `fmt_url()` and `fmt_email()` create clickable links that connect your tables to external resources.
- visual elements: `fmt_image()` embeds graphics directly in cells, `fmt_flag()` converts country codes to instantly recognizable flag icons, and `fmt_icon()` adds Font Awesome icons for status indicators and categorical markers.
- scientific notation: `fmt_units()` renders physical units with proper superscripts and subscripts, while `fmt_chem()` handles chemical formulas, isotopes, and reaction equations with publication-ready typography.
- country handling: `fmt_flag()` and `fmt_country()` work together to present international data with visual clarity, supporting localized country names and tooltips.

Together with the numeric formatters from the previous chapter, you now have a complete toolkit for transforming raw data values into polished, meaningful presentations. But formatting is just the first stage of **gt**'s rendering pipeline.

The next chapter introduces **substitution** and **text transformation** functions. These operate *after* formatting, allowing you to replace specific values (like missing data or zeros) with alternative text, and to transform the final string representation of cell values. This three-stage pipeline (format, substitute, transform) gives you precise control over exactly how every value appears in your finished table.


---


# Substitution and text transformation {#sec-substitution-transformation}


After formatting functions have processed your data, two additional stages allow you to refine the presentation further: **substitution** and **text transformation**. These stages operate on formatted values, giving you fine-grained control over how specific values appear in your final table.

The three-stage rendering pipeline works as follows:

1. **Formatting** (`fmt_*()` functions) converts raw values to formatted strings
2. **Substitution** (`sub_*()` functions) replaces specific values with alternative text
3. **Text transformation** (`text_*()` functions) modifies the final string representation

Each stage builds on the previous one, allowing you to progressively refine your table's presentation.

## Substitution functions

Substitution functions replace specific values with alternative text or symbols. This is particularly useful for handling missing data, zero values, and extreme values that need special treatment.

### `sub_missing()`

Missing values (`NA`) are common in real-world data, but displaying `"NA"` in a table is often undesirable. The `sub_missing()` function replaces missing values with more meaningful or visually appropriate text.

Here is the function's signature:

```r
sub_missing(
  data,
  columns = everything(),
  rows = everything(),
  missing_text = "---"
)
```

Let's replace missing values in the `exibble` dataset with em-dashes:

```{r}
exibble |>
  dplyr::select(num, char, currency) |>
  gt() |>
  sub_missing(columns = everything())
```

The `NA` values are now displayed as em-dashes (the `"---"` default for `missing_text` signifies an em dash), a common typographic convention for missing data that's cleaner than displaying `"NA"`.

You can customize the replacement text for different contexts:

```{r}
exibble |>
  dplyr::select(num, char, currency) |>
  gt() |>
  sub_missing(columns = num, missing_text = "N/A") |>
  sub_missing(columns = char, missing_text = "(none)") |>
  sub_missing(columns = currency, missing_text = "---")
```

Different columns now display their missing values differently: numeric columns show `"N/A"`, character columns show `"(none)"`, and currency columns show an em-dash. This contextual approach can make your tables more intuitive.

The `rows` argument lets you target specific rows:

```{r}
exibble |>
  dplyr::select(row, num, char) |>
  gt() |>
  sub_missing(
    columns = everything(),
    rows = row %in% c("row_1", "row_2"),
    missing_text = "pending"
  ) |>
  sub_missing(
    columns = everything(),
    missing_text = "---"
  )
```

This applies different substitutions based on row context, with early rows showing `"pending"` and others showing an em-dash.

### `sub_zero()`

Zero values sometimes represent "no data" or "not applicable" rather than a meaningful quantity. The `sub_zero()` function replaces zeros with alternative text.

Here is the function's signature:

```r
sub_zero(
  data,
  columns = everything(),
  rows = everything(),
  zero_text = "nil"
)
```

Let's replace zero counts with a hyphen for clearer presentation:

```{r}
dplyr::tibble(
  category = c("A", "B", "C", "D", "E"),
  count = c(42, 0, 17, 0, 8)
) |>
  gt() |>
  sub_zero(columns = count, zero_text = "–")
```

The zero counts are replaced with hyphens, making it immediately clear that these represent "none" rather than a meaningful zero value.

Different contexts might call for different zero representations:

```{r}
dplyr::tibble(
  product = c("Widget A", "Widget B", "Widget C"),
  in_stock = c(150, 0, 75),
  on_order = c(0, 200, 0)
) |>
  gt() |>
  fmt_integer() |>
  sub_zero(columns = in_stock, zero_text = "Out of stock") |>
  sub_zero(columns = on_order, zero_text = "-")
```

The `in_stock` column shows a descriptive message for zeros, while `on_order` uses a simple dash. This helps readers quickly understand the significance of each zero.

### `sub_small_vals()`
  
Very small values can be difficult to display meaningfully, especially when they approach the limits of measurement precision. The `sub_small_vals()` function replaces values below a threshold with "less than" statements.

Here is the function's signature:

```r
sub_small_vals(
  data,
  columns = everything(),
  rows = everything(),
  threshold = 0.01,
  small_pattern = "<{x}",
  sign = ""
)
```

Let's apply this to concentration data where some measurements fall below the reliable detection limit. We'll use `fmt_partsper()` to express concentrations in parts-per-million (ppm):

```{r}
dplyr::tibble(
  measurement = c("Sample A", "Sample B", "Sample C", "Sample D"),
  concentration = c(0.5, 0.008, 0.0002, 0.15)
) |>
  gt() |>
  fmt_partsper(columns = concentration, to_units = "ppm") |>
  sub_small_vals(columns = concentration, threshold = 0.01)
```

Values below `0.01` are replaced with `"<0.01"`, acknowledging their presence without implying false precision. This is standard practice in scientific and analytical reporting. The `fmt_partsper()` function formats the values with the appropriate `"ppm"` unit suffix.

The `small_pattern` argument customizes the replacement format. Here's an example with parts-per-billion measurements, common in environmental testing:

```{r}
dplyr::tibble(
  analyte = c("Lead", "Mercury", "Cadmium", "Arsenic"),
  level_ppb = c(2.5, 0.003, 0.0001, 1.2)
) |>
  gt() |>
  fmt_partsper(columns = level_ppb, to_units = "ppb") |>
  sub_small_vals(
    columns = level_ppb, 
    threshold = 0.01,
    small_pattern = "< LOD"
  )
```

Here, values below the threshold are replaced with `"< LOD"` (i.e., below the limit of detection), which is a common term in analytical chemistry. The combination of `fmt_partsper()` with `sub_small_vals()` creates professional-looking scientific tables where detectable values show their ppb concentration and undetectable values display the appropriate notation.

Beyond scientific applications, `sub_small_vals()` is useful anywhere that very small numbers might confuse readers or imply misleading precision (such as rounding percentages near zero, financial reports with negligible amounts, or survey results with tiny response rates). The function helps maintain honesty about data precision while keeping tables readable.

### `sub_large_vals()`

Similarly, extremely large values might need special handling, especially when they exceed a meaningful display range. The `sub_large_vals()` function caps values above a threshold.

Here is the function's signature:

```r
sub_large_vals(
  data,
  columns = everything(),
  rows = everything(),
  threshold = 1E12,
  large_pattern = ">={x}",
  sign = ""
)
```

Let's create a table where we cap the display of values that exceed a meaningful threshold:

```{r}
dplyr::tibble(
  metric = c("Normal", "High", "Very High", "Extreme"),
  value = c(500, 50000, 500000, 5000000)
) |>
  gt() |>
  fmt_number(columns = value) |>
  sub_large_vals(columns = value, threshold = 100000)
```

Values exceeding 100,000 are replaced with `"≥1e+05"` (scientific notation for the threshold), indicating they're beyond the displayed scale. This is useful for tables where exact values above a certain point aren't meaningful. Note that the threshold value in the replacement text uses scientific notation by default.

The `large_pattern` argument lets you customize the replacement text. This is particularly useful when scientific notation isn't appropriate for your audience, or when domain-specific terminology (like "exceeds range" or "> max") would be more meaningful:

```{r}
dplyr::tibble(
  test = c("Control", "Test A", "Test B", "Test C"),
  response = c(85, 120, 9999, 145)
) |>
  gt() |>
  fmt_integer(columns = response) |>
  sub_large_vals(
    columns = response,
    threshold = 1000,
    large_pattern = "> max"
  )
```

Values above the threshold show "> max", indicating they exceeded the measurement range. This approach is common in laboratory reports, sensor data displays, and any context where instruments have a defined upper limit.

The `sub_large_vals()` function is particularly useful for handling outliers that would otherwise distort a reader's perception of the data, or for privacy purposes where exact large values shouldn't be disclosed (e.g., displaying salaries above a threshold as "≥$200,000"). Combined with `sub_small_vals()`, you have complete control over how extreme values at both ends of the spectrum are presented.

### `sub_values()`

For custom value replacements that go beyond missing, zero, or threshold-based substitutions, `sub_values()` provides flexible pattern matching. You can match specific values, use functions to identify cells for replacement, or work with vectors of values to replace. This is your go-to tool when the other substitution functions don't cover your use case.

Here is the function's signature:

```r
sub_values(
  data,
  columns = everything(),
  rows = everything(),
  values = NULL,
  fn = NULL,
  replacement = NULL
)
```

There are several patterns for using this function, depending on whether you want to match exact values, apply conditional logic, or replace multiple values at once.

#### Replacing specific values

The simplest use of `sub_values()` is replacing exact value matches. You specify the `values` to look for and the `replacement` text to use. This is good when adding visual indicators or expanding abbreviations.

Let's decorate status values with emoji indicators:

```{r}
dplyr::tibble(
  status = c("active", "inactive", "pending", "archived"),
  count = c(10, 5, 3, 2)
) |>
  gt() |>
  sub_values(
    columns = status,
    values = "inactive",
    replacement = "⏸ inactive"
  ) |>
  sub_values(
    columns = status,
    values = "archived",
    replacement = "📁 archived"
  )
```

The `"inactive"` and `"archived"` values now display with appropriate emoji indicators, making status categories immediately visually distinct. The `"active"` and `"pending"` values pass through unchanged since we didn't specify replacements for them.

#### Using a function for conditional replacement

For more complex matching logic, you can supply a function via the `fn` argument. This function receives each cell value and should return `TRUE` for values that need replacement. This enables conditional logic that would be difficult to express with simple value matching.

Let's flag scores that fall below an acceptable threshold:

```{r}
dplyr::tibble(
  product = c("Alpha", "Beta", "Gamma", "Delta"),
  score = c(92, 45, 78, 38)
) |>
  gt() |>
  sub_values(
    columns = score,
    fn = function(x) x < 50,
    replacement = "⚠️ Below threshold"
  )
```

The function-based approach evaluates each cell value against the condition `x < 50`. Beta (`45`) and Delta (`38`) both fail this check, so they're replaced with a warning indicator. This technique is invaluable for quality control dashboards or any table where certain values need to be called out based on thresholds.

#### Multiple value replacement

The `values` argument can accept a vector of values to match, all of which will be replaced with the same `replacement` text. This is useful for grouping related values or collapsing categories.

Let's group weekend days together:

```{r}
dplyr::tibble(
  day = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
  hours = c(8, 8, 8, 8, 8, 0, 0)
) |>
  gt() |>
  sub_values(
    columns = day,
    values = c("Sat", "Sun"),
    replacement = "Weekend"
  )
```

Both Saturday and Sunday are replaced with `"Weekend"`, effectively collapsing these two categories into one. This technique is helpful when detailed values in your data need to be presented at a higher level of abstraction.

The `sub_values()` function is the most versatile of the substitution functions. While `sub_missing()`, `sub_zero()`, `sub_small_vals()`, and `sub_large_vals()` each handle specific common cases, `sub_values()` handles everything else. Use it to expand abbreviations, add visual indicators to specific categories, flag values that meet custom criteria, or recode categorical data for clearer presentation. The function-based matching via `fn` is particularly powerful as you can implement any logic that returns `TRUE` or `FALSE`, from simple threshold checks to complex pattern matching or even lookups against external reference data.

## Text transformation functions

Text transformation functions operate on the final string representation of cell values, after formatting and substitution have been applied. They provide powerful tools for pattern-based modifications and conditional text changes.

### `text_replace()`

For targeted string replacements using regular expressions, `text_replace()` finds and replaces patterns within cell text. Unlike the substitution functions that replace entire cell values, `text_replace()` can modify specific portions of text within a cell while leaving the rest intact.

Here is the function's signature:

```r
text_replace(
  data,
  locations,
  pattern,
  replacement
)
```

Let's standardize product descriptions by replacing a prefix:

```{r}
dplyr::tibble(
  description = c(
    "Model ABC-123",
    "Model DEF-456", 
    "Model GHI-789"
  )
) |>
  gt() |>
  text_replace(
    locations = cells_body(columns = description),
    pattern = "Model ",
    replacement = "Type: "
  )
```

All occurrences of `"Model "` are replaced with `"Type: "`, transforming the presentation without modifying the source data. This is particularly useful when you need to adapt terminology for different audiences or standardize inconsistent naming conventions.

#### Using regular expressions

The `pattern` argument supports full regular expression syntax, enabling powerful pattern matching and capture groups for sophisticated text manipulations.

Let's restructure product codes to make variant identifiers more readable:

```{r}
dplyr::tibble(
  code = c("SKU-001-A", "SKU-002-B", "SKU-003-C"),
  name = c("Widget", "Gadget", "Sprocket")
) |>
  gt() |>
  text_replace(
    locations = cells_body(columns = code),
    pattern = "-([A-Z])$",
    replacement = " (Variant \\1)"
  )
```

The regex pattern `"-([A-Z])$"` matches a hyphen followed by a capital letter at the end of the string. The parentheses create a capture group around the letter. The replacement string uses `\\1` to reference that captured group, transforming `"SKU-001-A"` into `"SKU-001 (Variant A)"`. This technique is invaluable for reformatting coded data into human-readable labels.

#### Applying to multiple locations

The `locations` argument accepts any of **gt**'s `cells_*()` helper functions, allowing you to target specific parts of the table. You can apply text replacements to the body, stub, column labels, or other table components.

Let's shorten the row labels in the stub column:

```{r}
exibble |>
  dplyr::select(row, char) |>
  dplyr::slice(1:4) |>
  gt(rowname_col = "row") |>
  text_replace(
    locations = cells_stub(),
    pattern = "row_",
    replacement = "R"
  )
```

The transformation applies to the stub column, shortening row labels from `"row_1"` to `"R1"`. This makes the table more compact while maintaining the row identification. The same technique works with `cells_column_labels()`, `cells_title()`, and other location helpers.

### `text_case_when()`

For conditional text replacements based on complex logic, `text_case_when()` evaluates expressions and applies different replacements based on the results. This function mirrors the logic of `dplyr::case_when()` but operates on the text representation of cell values after formatting.

Here is the function's signature:

```r
text_case_when(
  data,
  .default = NULL,
  .locations = cells_body(),
  ...
)
```

The function uses a formula syntax where the left side is a condition and the right side is the replacement. The variable `x` represents the current cell value. Conditions are evaluated in order, and the first matching condition determines the replacement.

Let's decorate letter grades with star indicators:

```{r}
dplyr::tibble(
  student = c("Alice", "Bob", "Carol", "David", "Eve"),
  grade = c("A", "B", "A+", "C", "F")
) |>
  gt() |>
  text_case_when(
    x == "A+" ~ "★★ A+",
    x == "A" ~ "★ A",
    x == "F" ~ "✗ F",
    .default = NULL,
    .locations = cells_body(columns = grade)
  )
```

Different grades receive different decorations based on conditional logic: A+ gets double stars, A gets a single star, and F gets an X mark. The `.default = NULL` setting is important: it ensures unmatched values (B and C in this case) pass through unchanged rather than being replaced with a default value. Without this, unmatched values would display as `NULL`.

#### Numeric comparisons in text

Even though text transformations operate on strings (after formatting has been applied), you can extract numeric values and perform comparisons. This requires converting the text back to numbers, which may involve removing formatting characters like currency symbols or thousands separators.

Let's add trend indicators based on the underlying values:

```{r}
dplyr::tibble(
  metric = c("Revenue", "Costs", "Profit", "Tax"),
  value = c(100000, 75000, 25000, 5000)
) |>
  gt() |>
  fmt_currency(columns = value, currency = "USD") |>
  text_case_when(
    as.numeric(gsub("[^0-9.]", "", x)) >= 50000 ~ paste0("📈 ", x),
    as.numeric(gsub("[^0-9.]", "", x)) < 10000 ~ paste0("📉 ", x),
    .default = NULL,
    .locations = cells_body(columns = value)
  )
```

The `gsub("[^0-9.]", "", x)` pattern strips everything except digits and decimal points, allowing `as.numeric()` to convert the formatted currency string back to a number. Values at or above $50,000 get an upward trend indicator, while values below $10,000 get a downward indicator. Values in between pass through unchanged. This technique lets you add visual cues based on numeric thresholds even after formatting has been applied.

#### Multiple conditions

You can chain as many conditions as needed. Each formula is evaluated in order, and the first matching condition wins.

Let's transform terse status codes into user-friendly labels with appropriate icons:

```{r}
dplyr::tibble(
  task = c("Design", "Development", "Testing", "Deployment"),
  status = c("done", "in_progress", "not_started", "blocked")
) |>
  gt() |>
  text_case_when(
    x == "done" ~ "✅ Complete",
    x == "in_progress" ~ "🔄 In Progress",
    x == "not_started" ~ "⏳ Pending",
    x == "blocked" ~ "🚫 Blocked",
    .default = NULL,
    .locations = cells_body(columns = status)
  )
```

Each status value is transformed into a more descriptive, emoji-decorated representation. This pattern is useful for project management dashboards, where coded statuses need to be presented in a visually scannable way. The emoji indicators provide instant recognition, while the expanded text ensures clarity.

### `text_case_match()`

For simpler one-to-one replacements without complex conditions, `text_case_match()` provides a cleaner syntax similar to `dplyr::case_match()`. While `text_case_when()` allows arbitrary conditions, `text_case_match()` is optimized for direct value-to-replacement mappings.

Here is the function's signature:

```r
text_case_match(
  data,
  .default = NULL,
  .replace = NULL,
  .locations = cells_body(),
  ...
)
```

Let's expand single-character availability codes into readable labels:

```{r}
dplyr::tibble(
  feature = c("API", "Dashboard", "Reports", "Settings"),
  available = c("Y", "N", "Y", "P")
) |>
  gt() |>
  text_case_match(
    "Y" ~ "✓ Yes",
    "N" ~ "✗ No",
    "P" ~ "◐ Partial",
    .default = NULL,
    .locations = cells_body(columns = available)
  )
```

Single-character codes are expanded to readable values with visual indicators. The syntax is more concise than `text_case_when()` because you don't need to write `x ==` for each condition. For simple value matching like this, `text_case_match()` is the cleaner choice.

#### Partial replacements with `.replace`

By default, `text_case_match()` replaces the entire cell value. Setting `.replace = "partial"` changes this behavior to only replace the matched portion, leaving the rest of the cell text intact.

Let's replace a filename prefix with an icon while keeping the actual filename:

```{r}
dplyr::tibble(
  item = c("file_report.pdf", "file_data.csv", "file_image.png"),
  size = c("2.5 MB", "150 KB", "4.1 MB")
) |>
  gt() |>
  text_case_match(
    "file_" ~ "📄 ",
    .replace = "partial",
    .locations = cells_body(columns = item)
  )
```

Instead of replacing the entire cell value, only the matched portion (`"file_"`) is replaced with the document emoji. The rest of the filename (`"report.pdf"`, etc.) is preserved. This technique is excellent for adding visual indicators to coded prefixes or suffixes without losing the identifying information.

#### Multiple matches in sequence

You can specify multiple match patterns, each with its own replacement. When using `.replace = "partial"`, all matching patterns are replaced within each cell.

Let's replace country codes with flag emojis while keeping the city codes:

```{r}
dplyr::tibble(
  code = c("US-CA", "UK-LN", "DE-BE", "FR-PA"),
  sales = c(15000, 12000, 9500, 11000)
) |>
  gt() |>
  text_case_match(
    "US" ~ "🇺🇸",
    "UK" ~ "🇬🇧", 
    "DE" ~ "🇩🇪",
    "FR" ~ "🇫🇷",
    .replace = "partial",
    .locations = cells_body(columns = code)
  ) |>
  fmt_currency(columns = sales, currency = "USD")
```

The two-letter country codes at the beginning of each cell are replaced with their corresponding flag emojis, while the hyphen and city codes that follow are preserved. This creates visually appealing location identifiers that are both scannable (via the flags) and informative (via the city codes).

### `text_transform()`

For maximum flexibility, `text_transform()` applies arbitrary functions to cell text. This is the most powerful (and most flexible) of the text transformation tools. While the other text functions provide convenient shortcuts for common patterns, `text_transform()` lets you write custom R functions that can perform any text manipulation.

Here is the function's signature:

```r
text_transform(
  data,
  locations,
  fn
)
```

The `fn` argument accepts a function that takes a character vector of cell values and returns a transformed character vector of the same length.

#### Basic transformations

Simple transformations can leverage existing R functions for text manipulation.

Let's fix the capitalization of names stored in lowercase:

```{r}
dplyr::tibble(
  name = c("john smith", "mary jones", "bob wilson")
) |>
  gt() |>
  text_transform(
    locations = cells_body(columns = name),
    fn = function(x) tools::toTitleCase(x)
  )
```

The names are transformed to title case using R's built-in `tools::toTitleCase()` function. This corrects the formatting of the source data for display without modifying the original data. You could use any text function here: `toupper()`, `tolower()`, `stringr::str_to_sentence()`, or your own custom function.

#### Complex transformations

For more sophisticated manipulations, you can write multi-step transformation functions that parse, modify, and reassemble text.

Let's restructure hyphenated product codes into a more readable format:

```{r}
dplyr::tibble(
  product = c("widget-standard", "gadget-premium", "sprocket-basic"),
  price = c(29.99, 49.99, 19.99)
) |>
  gt() |>
  text_transform(
    locations = cells_body(columns = product),
    fn = function(x) {
      parts <- strsplit(x, "-")
      sapply(parts, function(p) {
        paste0(
          tools::toTitleCase(p[1]), 
          " (", 
          toupper(p[2]), 
          ")"
        )
      })
    }
  ) |>
  fmt_currency(columns = price, currency = "USD")
```

This transformation function does several things: it splits each product string on the hyphen, capitalizes the product name using title case, converts the tier to uppercase, and reassembles them with the tier in parentheses. The result transforms `"widget-standard"` into `"Widget (STANDARD)"`. This kind of structural reformatting would be difficult with the other text functions.

#### Conditional formatting with external data

The transformation function can access variables from the enclosing environment, allowing you to make decisions based on data that isn't in the cell being transformed.

Let's add performance indicators to region names based on whether they met their sales targets:

```{r}
sales_data <- dplyr::tibble(
  region = c("North", "South", "East", "West"),
  sales = c(150000, 85000, 120000, 95000),
  target = c(100000, 100000, 100000, 100000)
)

sales_data |>
  gt() |>
  fmt_currency(columns = c(sales, target), currency = "USD") |>
  text_transform(
    locations = cells_body(columns = region),
    fn = function(x) {
      # Access the original data to make decisions
      ifelse(
        sales_data$sales > sales_data$target,
        paste0("✅ ", x),
        paste0("⚠️ ", x)
      )
    }
  )
```

The transformation function references `sales_data$sales` and `sales_data$target` from outside the function to determine which indicator to add to each region name. North and East exceeded their targets (getting check marks), while South and West fell short (getting warning indicators). This technique is powerful for adding cross-column conditional formatting.

#### Transforming multiple columns together

You can apply the same transformation to multiple columns by specifying them in the `locations` argument.

Let's complete partial email addresses by adding the domain:

```{r}
dplyr::tibble(
  first = c("John", "Mary", "Bob"),
  last = c("Smith", "Jones", "Wilson"),
  email = c("jsmith", "mjones", "bwilson")
) |>
  gt() |>
  text_transform(
    locations = cells_body(columns = email),
    fn = function(x) paste0(x, "@company.com")
  )
```

The email usernames are transformed into complete email addresses by appending the domain. This is a simple but practical example of how `text_transform()` can complete partial data for display purposes. You could extend this to apply different domains based on department, format phone numbers, or any other text augmentation task.

## Combining stages effectively

The power of **gt**'s rendering pipeline comes from combining formatting, substitution, and transformation stages. Here's a comprehensive example:

```{r}
dplyr::tibble(
  product = c("alpha_widget", "beta_gadget", "gamma_sprocket", "delta_tool"),
  status = c("active", "discontinued", "active", "pending"),
  stock = c(150, 0, NA, 25),
  price = c(29.99, 19.99, 0.001, 49.99)
) |>
  gt() |>
  # Stage 1: Formatting
  fmt_integer(columns = stock) |>
  fmt_currency(columns = price, currency = "USD") |>
  # Stage 2: Substitution
  sub_missing(columns = stock, missing_text = "N/A") |>
  sub_zero(columns = stock, zero_text = "Out of stock") |>
  sub_small_vals(columns = price, threshold = 1, small_pattern = "Call for price") |>
  # Stage 3: Text transformation
  text_transform(
    locations = cells_body(columns = product),
    fn = function(x) {
      x <- gsub("_", " ", x)
      tools::toTitleCase(x)
    }
  ) |>
  text_case_match(
    "active" ~ "🟢 Active",
    "discontinued" ~ "🔴 Discontinued",
    "pending" ~ "🟡 Pending",
    .locations = cells_body(columns = status)
  )
```

This example demonstrates all three stages working together:

1. formatting: numbers are formatted as integers and currency
2. substitution: missing values, zeros, and small values receive special treatment
3. transformation: product names are cleaned up and status values are decorated

Each stage builds on the previous one, creating a polished final presentation from raw data.

## Summary

This chapter has explored the second and third stages of **gt**'s rendering pipeline: substitution and text transformation. These functions operate *after* formatting, giving you fine-grained control over how specific values appear in your finished tables.

The key concepts to remember:

- substitution functions (`sub_*()`) replace specific values with alternative text. Use `sub_missing()` for `NA` values, `sub_zero()` for zeros, `sub_small_vals()` and `sub_large_vals()` for extreme values, and `sub_values()` for custom replacement logic.
- text transformation functions (`text_*()`) modify the final string representation of cell values. The `text_transform()` function provides maximum flexibility with custom functions, while `text_case_when()` and `text_case_match()` offer convenient pattern-based transformations.
- the three-stage pipeline (format → substitute → transform) processes values in a defined order, ensuring predictable results. Each stage sees the output of the previous stage.
- location targeting allows you to apply transformations precisely where needed, using the same `cells_*()` helper functions used throughout **gt**.

Together with the formatting functions from *Chapters 3 and 4*, you now have complete control over how every value in your table is rendered. Missing data can display meaningful placeholders. Extreme values can receive special treatment. Text can be cleaned, decorated, or transformed programmatically.

The next chapter shifts focus from cell values to table structure, exploring the `cols_*()` functions that let you modify columns themselves: their labels, widths, alignment, ordering, visibility, and even merging multiple columns into one.


---


# Modifying columns {#sec-modifying-columns}


While formatting functions operate on the values *within* cells, sometimes we need to modify the structure and arrangement of the columns themselves. The **gt** package provides a comprehensive set of `cols_*()` functions that allow us to relabel columns, set their widths, control alignment, reorder their positions, hide and reveal them, and even merge data from multiple columns into a single column. These operations are essential for transforming raw data into polished, presentation-ready tables.

In this chapter, we'll explore each of these column modification functions in detail. We'll see how `cols_label()` and `cols_label_with()` allow us to create human-readable column headers, how `cols_width()` and `cols_align()` give us control over the visual presentation, how the `cols_move*()` family lets us rearrange columns, how `cols_hide()` and `cols_unhide()` manage column visibility, and finally how the `cols_merge*()` functions allow us to combine data from multiple columns into single, information-rich cells.

## Labels, widths, alignments

The column labels in a **gt** table serve as the reader's guide to understanding the data. By default, **gt** uses the column names from your data frame, which are often abbreviated, in snake_case, or otherwise not ideal for presentation purposes. Similarly, the default column widths and alignments may not always be optimal for your particular data. This section covers the functions that give you fine-grained control over these presentational aspects.

### `cols_label()`
 
The `cols_label()` function is your primary tool for assigning human-readable labels to columns. It accepts a set of column-label pairs, where you provide the column name (or use tidyselect) and the label you'd like to assign.

Here is the function's signature:

```r
cols_label(
 data,
 ...,
 .list = list2(...),
 .fn = NULL,
 .process_units = TRUE
)
```

Let's create a table using a subset of the `gtcars` dataset and give the columns more descriptive labels:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, mpg_c, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_label(
   mfr = "Manufacturer",
   model = "Model",
   year = "Year",
   hp = "Horsepower",
   mpg_c = "MPG (City)",
   msrp = "Price (USD)"
 )
```

The resulting table is immediately more readable. Where `mfr` might leave readers guessing, "Manufacturer" communicates clearly. The transformation from `mpg_c` to "MPG (City)" not only spells out the abbreviation but also clarifies that this is the city fuel economy figure (as opposed to highway). These small touches make a substantial difference in how quickly readers can interpret the data.

You can also use the `md()` and `html()` helper functions to add formatting to your labels. This is particularly useful for adding units, subscripts, or other stylistic touches:
 
```{r}
sp500 |>
 dplyr::slice(1:5) |>
 dplyr::select(date, open, high, low, close, volume) |>
 gt() |>
 cols_label(
   date = "Date",
   open = md("**Open**"),
   high = md("*High*"),
   low = md("*Low*"),
   close = md("**Close**"),
   volume = html("Volume<br><small>(shares)</small>")
 )
```

In this table, we've used Markdown formatting to make the "Open" and "Close" labels bold (arguably the most important prices for traders), while "High" and "Low" appear in italics. The volume label demonstrates the power of using raw HTML: the `<br>` creates a line break and `<small>` renders the unit clarification in a smaller font size. This kind of rich formatting in column labels can guide the reader's attention and provide additional context without cluttering the data cells themselves.

For columns with measurement units, **gt** supports a convenient notation using curly braces. When `.process_units = TRUE` (the default), text within `{{...}}` is automatically formatted as units:

```{r}
exibble |>
 dplyr::select(num, currency) |>
 dplyr::slice(1:4) |>
 gt() |>
 cols_label(
   num = "Value {{m/s^2}}",
   currency = "Amount {{USD}}"
 )
```

The units notation provides a clean, consistent way to display measurement units. Notice how `m/s^2` is rendered with proper superscript formatting for the exponent (this happens automatically when using the double-curly-brace syntax). The result is scientifically accurate notation without requiring you to write HTML or Markdown.

### `cols_label_with()`

When you need to apply a transformation function to multiple column labels at once, `cols_label_with()` is the more efficient approach. Rather than specifying each label individually, you provide a function that will be applied to the selected column names.

Here is the function's signature:

```r
cols_label_with(
 data,
 columns = everything(),
 fn
)
```

A common use case is converting snake_case column names to Title Case:

```{r}
towny |>
 dplyr::select(name, population_2021, density_2021, land_area_km2) |>
 dplyr::slice_head(n = 5) |>
 gt() |>
 cols_label_with(
   columns = everything(),
   fn = ~ gsub("_", " ", .x) |> tools::toTitleCase()
 )
```

The anonymous function (specified using the `~` syntax) performs two operations: first, `gsub("_", " ", .x)` replaces all underscores with spaces, and then `tools::toTitleCase()` capitalizes the first letter of each word. The result transforms `population_2021` into "Population 2021" and `land_area_km2` into "Land Area Km2". This approach is far more efficient than manually specifying labels for each column, especially when dealing with datasets that have many columns following consistent naming conventions.

You can also be selective about which columns to transform. Here, we use `starts_with()` to only modify certain columns:

```{r}
gtcars |>
 dplyr::select(mfr, model, hp, hp_rpm, trq, trq_rpm) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_label(
   mfr = "Manufacturer",
   model = "Model"
 ) |>
 cols_label_with(
   columns = starts_with(c("hp", "trq")),
   fn = ~ toupper(gsub("_", " ", .x))
 )
```

Here we combine two approaches: explicit labeling with `cols_label()` for the `mfr` and `model` columns (which need specific human-friendly names), and programmatic labeling with `cols_label_with()` for the performance-related columns. The `starts_with()` selector targets only columns beginning with "hp" or "trq", converting them to uppercase with spaces. This results in labels like "HP", "HP RPM", "TRQ", and "TRQ RPM", which are appropriate for technical specifications where abbreviations are standard.

The `cols_label_with()` function is particularly powerful when combined with custom functions. For example, you could create a function that looks up labels from a data dictionary or applies domain-specific formatting rules.

### `cols_width()`

The `cols_width()` function allows you to explicitly set the widths of one or more columns. This is especially useful when you want consistent column sizing across tables, when dealing with long text that might cause awkward wrapping, or when certain columns deserve more visual prominence.

Here is the function's signature:

```r
cols_width(
 data,
 ...,
 .list = list2(...)
)
```

The width values can be specified using the `px()` helper for pixel values or `pct()` for percentages. Let's see a basic example:

```{r}
exibble |>
 dplyr::select(char, fctr, date, time) |>
 dplyr::slice(1:4) |>
 gt() |>
 cols_width(
   char ~ px(150),
   fctr ~ px(100),
   date ~ px(120),
   time ~ px(100)
 )
```

By setting explicit pixel widths, we ensure that the columns maintain consistent sizing regardless of the content they contain. The `char` column receives the most space at 150 pixels since character data often varies in length, while `fctr` and `time` are narrower at 100 pixels. This explicit control prevents the table from looking unbalanced when some cells contain much more content than others.

Using percentage-based widths ensures that columns scale proportionally with the table's overall width:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_label(
   mfr = "Manufacturer",
   model = "Model",
   year = "Year",
   hp = "HP",
   msrp = "Price"
 ) |>
 cols_width(
   mfr ~ pct(20),
   model ~ pct(35),
   year ~ pct(10),
   hp ~ pct(10),
   msrp ~ pct(25)
 )
```

With percentage-based widths totaling 100%, the columns will proportionally fill the available table width. The `model` column receives the largest share (35%) since car model names tend to be longer, while `year` and `hp` get just 10% each since they contain short numeric values. This approach is particularly valuable for responsive layouts where the table width may vary depending on the viewing context.

You can use tidyselect helpers to apply widths to multiple columns at once:

```{r}
towny |>
 dplyr::select(name, starts_with("population"), starts_with("density")) |>
 dplyr::slice_head(n = 5) |>
 gt() |>
 cols_width(
   name ~ px(200),
   starts_with("population") ~ px(120),
   starts_with("density") ~ px(100)
 )
```

The `starts_with()` helper elegantly handles all population columns and all density columns with single rules, assigning 120 pixels to each population column and 100 pixels to each density column. This is considerably more maintainable than specifying widths for each column individually, and it automatically accommodates any new columns that might be added to the dataset later (provided they follow the same naming convention).

### `cols_align()`

By default, **gt** automatically aligns columns based on their data types: numeric columns are right-aligned and text columns are left-aligned. The `cols_align()` function lets you override this behavior when needed.

Here is the function's signature:

```r
cols_align(
 data,
 align = c("auto", "left", "center", "right"),
 columns = everything()
)
```

Let's see how to center-align specific columns:

```{r}
exibble |>
 dplyr::select(char, num, currency, date) |>
 dplyr::slice(1:4) |>
 gt() |>
 cols_align(
   align = "center",
   columns = c(char, date)
 )
```

In this table, the `char` and `date` columns are now center-aligned, while `num` and `currency` retain their default right-alignment. Notice how the center alignment affects only the body cells; the column labels remain in their default positions. Centering text columns can create a more balanced visual appearance, though it may reduce readability for longer text values (so use this technique judiciously).

You might want to center all columns for a more symmetrical appearance, particularly in summary tables:

```{r}
gtcars |>
 dplyr::count(mfr, name = "n_models") |>
 dplyr::arrange(desc(n_models)) |>
 dplyr::slice_head(n = 8) |>
 gt() |>
 cols_label(
   mfr = "Manufacturer",
   n_models = "Number of Models"
 ) |>
 cols_align(
   align = "center",
   columns = everything()
 )
```

For this summary table showing model counts by manufacturer, center alignment creates a clean, symmetrical presentation. Since the table has only two columns and relatively short values in each, center alignment works well. The `everything()` selector applies the alignment to all columns in one call, keeping the code concise.

For numeric values that benefit from decimal alignment, **gt** offers `cols_align_decimal()`. This function aligns values along their decimal points, making it easier to compare values across rows:

```{r}
dplyr::tibble(
 item = c("Widget A", "Widget B", "Widget C", "Total"),
 price = c(1.5, 24.99, 199.00, 225.49),
 quantity = c(100, 50, 5, 155)
) |>
 gt() |>
 cols_align_decimal(columns = price)
```

The `price` column now has its values aligned on the decimal point, making it easy to compare prices at a glance. Without decimal alignment, the varying number of digits before the decimal would make visual comparison more difficult. This is especially valuable in financial tables, scientific data, or any context where precise numeric comparison matters.


## Moving columns

The order in which columns appear can significantly impact how readers interpret and navigate a table. While you could reorder columns in your source data before passing it to `gt()`, the `cols_move*()` functions provide a convenient way to rearrange columns as part of your table-building pipeline. This is especially useful when the order that makes sense for analysis differs from the order that works best for presentation.

### `cols_move_to_start()`

The `cols_move_to_start()` function moves one or more columns to the beginning of the column series (i.e., to the left side of the table).

Here is the function's signature:

```r
cols_move_to_start(
 data,
 columns
)
```

Let's say we have a dataset where we want to emphasize certain columns by placing them first:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, bdy_style, hp, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_move_to_start(columns = msrp)
```

The `msrp` column (which originally appeared last in our selection) now leads the table. If price is the primary point of interest for our readers, placing it first ensures they see that information immediately. The remaining columns maintain their relative order, simply shifted one position to the right.

You can move multiple columns at once. They will appear in the order you specify:

```{r}
exibble |>
 dplyr::select(-row, -group) |>
 dplyr::slice(1:4) |>
 gt() |>
 cols_move_to_start(columns = c(date, time, datetime))
```

All three temporal columns now appear at the beginning of the table, in the order we specified: `date`, then `time`, then `datetime`. This reorganization groups related information together, which is often more logical for the reader than the arbitrary order that might result from the original data structure.

### `cols_move_to_end()`

Conversely, `cols_move_to_end()` moves columns to the end of the column series (i.e., to the right side of the table). This is often useful for placing less important columns or summary columns at the end.

Here is the function's signature:

```r
cols_move_to_end(
 data,
 columns
)
```

In the following example, we move the identifying columns to the end so that the numeric data appears first:

```{r}
sp500 |>
 dplyr::select(date, open, high, low, close, volume) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_move_to_end(columns = date)
```

By moving `date` to the end, the numeric trading data (open, high, low, close, volume) takes center stage. This arrangement might be preferred when the focus is on price movements rather than the specific dates (perhaps in a context where readers already know the time period being examined).

Multiple columns can be moved together:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, trq, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_move_to_end(columns = c(mfr, model))
```

Now the numeric specifications (`year`, `hp`, `trq`, `msrp`) appear first, followed by the identifying information (`mfr`, `model`). This layout prioritizes the data over the labels, a presentation choice that might suit analytical contexts where readers are comparing specifications across vehicles.

### `cols_move()`

For more precise control over column placement, `cols_move()` allows you to position columns after a specified reference column.

Here is the function's signature:

```r
cols_move(
 data,
 columns,
 after
)
```

This function is particularly useful when you want to group related columns together:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, hp_rpm, trq, trq_rpm, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_move(
   columns = msrp,
   after = model
 )
```

The `msrp` column is now positioned immediately after `model`, giving readers the price information right alongside the vehicle identification. The `after` argument specifies the reference column; the moved column(s) will appear directly to its right. This flexibility is valuable when you need to interleave columns rather than simply push them to the start or end.

Here's another example where we reorder columns to group performance metrics together:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, mpg_c, mpg_h, hp, trq) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_move(
   columns = c(hp, trq),
   after = year
 )
```

Both `hp` and `trq` have been moved to follow `year`, grouping the power-related metrics together. The fuel economy columns (`mpg_c`, `mpg_h`) now appear at the end. By thoughtfully arranging columns, you help readers understand the logical structure of your data. In this case, suggesting a grouping of identity information, power metrics, and efficiency metrics.

Using tidyselect helpers with `cols_move()` can be quite powerful for organizing tables with many columns:

```{r}
towny |>
 dplyr::select(name, latitude, longitude, starts_with("population"), starts_with("density")) |>
 dplyr::slice_head(n = 5) |>
 gt() |>
 cols_move(
   columns = starts_with("density"),
   after = name
 )
```

The `starts_with("density")` selector captures all density-related columns and positions them immediately after `name`. The original column order placed population columns before density columns, but now density comes first. When working with wide datasets that have many similarly-named columns, tidyselect helpers make reorganization straightforward and your code more resilient to future changes in the underlying data.


## Hiding columns

There are situations where you want to retain columns in your data for reference or for use in calculations, but you don't want them to appear in the rendered table. The `cols_hide()` function makes columns invisible while keeping them available for other **gt** operations. This is particularly useful when you need a column's data for conditional formatting, merging operations, or calculations, but displaying that column would clutter the table.

### `cols_hide()`

The `cols_hide()` function takes one or more columns and hides them from the table display. The columns remain part of the underlying **gt** object and can still be referenced in other function calls.

Here is the function's signature:

```r
cols_hide(
 data,
 columns
)
```

Let's create a table where we use a column for sorting but don't want to display it:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, msrp) |>
 dplyr::arrange(desc(hp)) |>
 dplyr::slice(1:8) |>
 gt() |>
 cols_hide(columns = year)
```

The table displays the top 8 cars by horsepower, but the `year` column is no longer visible. We retain the data in our pipeline (and could use it for other operations like conditional formatting), but it doesn't appear in the rendered output. This is cleaner than removing the column entirely from the source data, especially when the column might be needed for other purposes.

A common use case is hiding columns that have been merged into other columns. When you use `cols_merge()` (discussed later), the source columns remain in the table unless explicitly hidden:

```{r}
exibble |>
 dplyr::select(char, fctr, num, currency) |>
 dplyr::slice(1:4) |>
 gt() |>
 cols_hide(columns = c(fctr, currency))
```

Only `char` and `num` remain visible; `fctr` and `currency` are hidden. The data is still present in the **gt** object, but it simply isn't rendered. This technique is particularly useful when you want to keep auxiliary data available for reference while presenting a simplified view to the reader.

You can use tidyselect helpers to hide multiple related columns:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, hp_rpm, trq, trq_rpm, mpg_c, mpg_h) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_hide(columns = ends_with("_rpm"))
```

The `ends_with("_rpm")` selector hides both `hp_rpm` and `trq_rpm` in a single statement. The table shows horsepower and torque values without the RPM figures (perhaps the RPM data is too technical for a general audience, or it's being reserved for a more detailed companion table). Either way, the data remains accessible within the **gt** object should you need it.

### `cols_unhide()`

The `cols_unhide()` function reverses the hiding operation, making previously hidden columns visible again. This is useful in programmatic contexts where you might conditionally show or hide columns, or when you've inherited a **gt** table object and want to reveal certain columns.

Here is the function's signature:

```r
cols_unhide(
 data,
 columns
)
```

Let's demonstrate a workflow where we hide and then selectively unhide columns:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, trq, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_hide(columns = c(year, hp, trq)) |>
 cols_unhide(columns = hp)
```

We first hide three columns (`year`, `hp`, `trq`), then selectively reveal `hp`. The result is a table showing `mfr`, `model`, `hp`, and `msrp` (with `year` and `trq` remaining hidden). This pattern demonstrates the composability of **gt** operations: you can hide broadly and then unhide specifically, which can be useful when building tables programmatically or when adapting templates for different contexts.

The `cols_unhide()` function is particularly valuable when working with functions that return **gt** tables. You can receive a table, inspect which columns are hidden, and then unhide specific ones as needed. This follows the general **gt** philosophy that table construction operations should be reversible and composable.


## Merging column data together

One of the more powerful column modification capabilities in **gt** is the ability to merge data from multiple columns into a single column. This is achieved through the `cols_merge*()` family of functions. Merging is useful when you want to present related information together in a compact format (for example, combining a value with its uncertainty, showing a range from two values, or displaying a count alongside its percentage).

It's important to understand that when columns are merged, the data from the source columns is combined into a target column. The source columns are not automatically hidden; you typically want to use `cols_hide()` afterward if you don't want the source columns to remain visible. However, some of the specialized merge functions handle this automatically.

### `cols_merge()`

The `cols_merge()` function provides a flexible way to combine values from multiple columns using a pattern string. The pattern uses column indices (e.g., `{1}`, `{2}`) to reference the columns being merged.

Here is the function's signature:

```r
cols_merge(
 data,
 columns,
 rows = everything(),
 hide_columns = columns[-1],
 pattern = NULL,
 sep = " "
)
```

Let's combine manufacturer and model into a single column:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_merge(
   columns = c(mfr, model),
   pattern = "{1} {2}"
 ) |>
 cols_label(mfr = "Vehicle")
```

The manufacturer and model names are now combined into a single "Vehicle" column, with values like "Ford GT" and "Ferrari 458 Speciale". The `{1}` and `{2}` placeholders in the pattern refer to the first and second columns specified, respectively. Notice that the `model` column has been automatically hidden (the default behavior), leaving us with a cleaner four-column table.

The pattern string is quite flexible. You can include any literal text between the placeholders:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_merge(
   columns = c(model, year),
   pattern = "{1} ({2})"
 ) |>
 cols_label(model = "Model (Year)")
```

Now each cell in the `model` column contains the model name followed by the year in parentheses, such as `"GT (2017)"` or `"458 Speciale (2015)"`. The parentheses are literal characters in the pattern, demonstrating how you can embed any formatting you need. This is a common convention for displaying names with supplementary information.

You can merge more than two columns:

```{r}
gtcars |>
 dplyr::select(mfr, model, year, hp, msrp) |>
 dplyr::slice(1:5) |>
 gt() |>
 cols_merge(
   columns = c(mfr, model, year),
   pattern = "{1} {2}, {3}"
 ) |>
 cols_label(mfr = "Vehicle Information")
```

All three identifying pieces of information (manufacturer, model, and year) are now combined into a single column, producing entries like "Ford GT, 2017". This aggressive consolidation reduces the table from five columns to three, creating a more compact presentation when the identifying information is secondary to the numeric data.

Note that by default, `cols_merge()` hides all columns except the first one specified in `columns`. If you want to retain visibility of certain columns, you can adjust the `hide_columns` argument.

### `cols_merge_uncert()`

When presenting scientific or statistical data, it's common to show a value along with its uncertainty (e.g., error bounds). The `cols_merge_uncert()` function is specifically designed for this purpose, creating nicely formatted value ± uncertainty presentations.

Here is the function's signature:

```r
cols_merge_uncert(
 data,
 col_val,
 col_uncert,
 rows = everything(),
 sep = " +/- ",
 autohide = TRUE
)
```

Let's create a dataset with values and their uncertainties:

```{r}
measurements <- dplyr::tibble(
 sample = c("A", "B", "C", "D"),
 value = c(12.4, 8.7, 15.2, 10.1),
 uncertainty = c(0.3, 0.2, 0.5, 0.4)
)

measurements |>
 gt() |>
 cols_merge_uncert(
   col_val = value,
   col_uncert = uncertainty
 ) |>
 cols_label(value = "Measurement")
```

Each measurement now displays with its associated uncertainty using the conventional ± notation: "12.4 ± 0.3", "8.7 ± 0.2", and so on. This format is standard in scientific literature and immediately communicates both the measured value and its precision. The `uncertainty` column has been automatically hidden thanks to the `autohide = TRUE` default.

The function uses ` ± ` as the default separator, which is standard notation for uncertainties. By default, `autohide = TRUE` means the uncertainty column is automatically hidden after merging.

You can also use asymmetric uncertainties by providing two uncertainty columns in `col_uncert`:

```{r}
asymmetric_data <- dplyr::tibble(
 experiment = c("Trial 1", "Trial 2", "Trial 3"),
 result = c(50.2, 48.9, 51.5),
 lower_bound = c(2.1, 1.8, 2.5),
 upper_bound = c(3.2, 2.4, 3.1)
)

asymmetric_data |>
 gt() |>
 cols_merge_uncert(
   col_val = result,
   col_uncert = c(lower_bound, upper_bound)
 ) |>
 cols_label(result = "Result")
```

When uncertainties differ above and below the measured value, providing two uncertainty columns produces asymmetric notation like "50.2 (+3.2/−2.1)". This format accurately represents situations where error bounds are not symmetric (common in fields like particle physics, astrophysics, and certain statistical analyses where confidence intervals are naturally asymmetric).

### `cols_merge_range()`

The `cols_merge_range()` function combines two columns that represent the bounds of a range (e.g., minimum and maximum values) into a single column with appropriate range notation.

Here is the function's signature:

```r
cols_merge_range(
 data,
 col_begin,
 col_end,
 rows = everything(),
 sep = NULL,
 autohide = TRUE,
 locale = NULL
)
```

This function is exceedingly useful for displaying ranges like price ranges, temperature ranges, or date ranges:

```{r}
price_ranges <- dplyr::tibble(
  product = c("Basic", "Standard", "Premium", "Enterprise"),
  min_price = c(9.99, 29.99, 79.99, 199.99),
  max_price = c(19.99, 49.99, 149.99, 499.99)
)

price_ranges |>
  gt() |>
  cols_merge_range(
    col_begin = min_price,
    col_end = max_price
  ) |>
  cols_label(min_price = "Price Range") |>
  fmt_currency(columns = min_price, decimals = 2)
```

Each product tier now shows its price range in a single column with values like "$9.99–$19.99". The en-dash (–) separator is the typographically correct character for ranges, and `cols_merge_range()` uses it by default. By applying `fmt_currency()` to the target column, both the minimum and maximum values in each cell receive currency formatting.

Note that when you apply formatting functions like `fmt_currency()`, you should apply them to the target column (the first column in the merge operation) for the formatting to take effect on the merged result.

Here's another example using the `gtcars` dataset to show horsepower ranges by manufacturer:

```{r}
gtcars |>
 dplyr::group_by(mfr) |>
 dplyr::summarize(
   min_hp = min(hp),
   max_hp = max(hp),
   n_models = n(),
   .groups = "drop"
 ) |>
 dplyr::slice_head(n = 8) |>
 gt() |>
 cols_merge_range(
   col_begin = min_hp,
   col_end = max_hp
 ) |>
 cols_label(
   mfr = "Manufacturer",
   min_hp = "Horsepower Range",
   n_models = "Models"
 )
```

This summary table shows the range of horsepower values for each manufacturer's lineup, presented as entries like "245–647" for Audi or "562–691" for Ferrari. At a glance, readers can see which manufacturers offer broader or narrower performance ranges. The compact range notation conveys the same information as two separate columns but in a more digestible format.

### `cols_merge_n_pct()`

A very common table pattern is showing counts alongside their percentages. The `cols_merge_n_pct()` function automates this, creating entries like "150 (25.0%)" from separate count and percentage columns.

Here is the function's signature:

```r
cols_merge_n_pct(
 data,
 col_n,
 col_pct,
 rows = everything(),
 autohide = TRUE
)
```

Let's create a frequency table showing counts and percentages:

```{r}
gtcars |>
 dplyr::count(bdy_style, name = "n") |>
 dplyr::mutate(pct = n / sum(n) * 100) |>
 gt() |>
 cols_merge_n_pct(
   col_n = n,
   col_pct = pct
 ) |>
 cols_label(
   bdy_style = "Body Style",
   n = "Count (Percentage)"
 )
```

The table now shows entries like "coupe: 18 (34.62%)" and "sedan: 12 (23.08%)", communicating both the raw count and its proportion of the total. This dual presentation helps readers understand both the absolute frequency and relative importance of each category. The function automatically formats the percentage and wraps it in parentheses, following the conventional notation used in statistical and research publications.

This function is particularly useful for survey results, categorical summaries, and any situation where you want to show both absolute and relative frequencies:

```{r}
towny |>
 dplyr::mutate(
   size_category = dplyr::case_when(
     population_2021 >= 100000 ~ "Large",
     population_2021 >= 20000 ~ "Medium",
     TRUE ~ "Small"
   )
 ) |>
 dplyr::count(size_category, name = "count") |>
 dplyr::mutate(percentage = count / sum(count) * 100) |>
 dplyr::arrange(desc(count)) |>
 gt() |>
 cols_merge_n_pct(
   col_n = count,
   col_pct = percentage
 ) |>
 cols_label(
   size_category = "Municipality Size",
   count = "Count (Pct)"
 )
```

This categorical summary of Ontario municipalities shows how many fall into each size category along with the percentage. We can immediately see that "Small" municipalities dominate the dataset while "Large" municipalities are relatively rare. The merged format prevents the table from becoming unwieldy with separate count and percentage columns, while still conveying the complete picture.

The `cols_merge_n_pct()` function handles the formatting of the percentage values and applies appropriate parentheses automatically, creating a clean and professional appearance for your frequency tables.

## Adding columns and rows

While the previous sections focused on modifying existing columns, **gt** also provides functions to add entirely new columns and rows directly within the table-building pipeline. This allows you to perform calculations and add data without returning to **dplyr** or modifying your source data frame.

### `cols_add()`

The `cols_add()` function works similarly to `dplyr::mutate()`, allowing you to create new columns based on expressions involving existing columns. This is particularly useful for calculated fields, unit conversions, or derived values.

Here is the function's signature:

```r
cols_add(
  .data,
  ...,
  .before = NULL,
  .after = NULL
)
```

Let's create a table that calculates population density from existing columns:

```{r}
towny |>
  dplyr::select(name, population_2021, land_area_km2) |>
  dplyr::filter(population_2021 > 100000) |>
  dplyr::slice_max(population_2021, n = 8) |>
  gt() |>
  cols_add(
    density = population_2021 / land_area_km2
  ) |>
  fmt_integer(columns = population_2021) |>
  fmt_number(columns = c(land_area_km2, density), decimals = 1) |>
  cols_label(
    name = "Municipality",
    population_2021 = "Population",
    land_area_km2 = "Area (km²)",
    density = "Density (per km²)"
  )
```

The `density` column is calculated directly in the **gt** pipeline, dividing population by land area. This keeps the calculation close to where it's displayed, making the table code more self-contained and easier to understand.

You can add multiple columns in a single call, and use the `.before` or `.after` arguments to position them:

```{r}
gtcars |>
  dplyr::select(mfr, model, hp, mpg_c, mpg_h) |>
  dplyr::slice(1:6) |>
  gt() |>
  cols_add(
    mpg_avg = (mpg_c + mpg_h) / 2,
    hp_per_mpg = hp / mpg_avg,
    .after = mpg_h
  ) |>
  fmt_number(columns = c(mpg_avg, hp_per_mpg), decimals = 1) |>
  cols_label(
    mfr = "Make",
    model = "Model",
    hp = "HP",
    mpg_c = "City MPG",
    mpg_h = "Hwy MPG",
    mpg_avg = "Avg MPG",
    hp_per_mpg = "HP/MPG"
  )
```

Here we calculate an average MPG from city and highway figures, then compute a horsepower-to-efficiency ratio. Both new columns are placed after the highway MPG column using `.after = mpg_h`.

The `cols_add()` function is also useful for adding constant values or flags:

```{r}
exibble |>
  dplyr::select(char, num, currency) |>
  dplyr::slice(1:4) |>
  gt() |>
  cols_add(
    status = c("Active", "Pending", "Active", "Closed"),
    reviewed = TRUE,
    .before = char
  ) |>
  cols_label(
    status = "Status",
    reviewed = "Reviewed",
    char = "Item",
    num = "Value",
    currency = "Amount"
  ) |>
  fmt_tf(columns = reviewed, tf_style = "check-mark")
```

You can even start with an empty table and build it up entirely through `cols_add()`:

```{r}
dplyr::tibble() |>
  gt() |>
  cols_add(
    product = c("Widget", "Gadget", "Sprocket"),
    price = c(29.99, 49.99, 19.99),
    quantity = c(100, 50, 200)
  ) |>
  cols_add(
    total = price * quantity
  ) |>
  fmt_currency(columns = c(price, total)) |>
  fmt_integer(columns = quantity)
```

This approach can be useful when building tables programmatically or when the table structure itself is part of the computation.

### `rows_add()`

Just as `cols_add()` adds columns, `rows_add()` adds new rows to your table. This is useful for inserting summary rows, spacer rows, or additional data points directly in the **gt** pipeline.

Here is the function's signature:

```r
rows_add(
  .data,
  ...,
  .list = list2(...),
  .before = NULL,
  .after = NULL,
  .n_empty = NULL
)
```

Let's add a row to a simple table:

```{r}
dplyr::tibble(
  item = c("Apples", "Oranges", "Bananas"),
  quantity = c(50, 30, 45),
  price = c(1.20, 0.95, 0.65)
) |>
  gt() |>
  rows_add(
    item = "Grapes",
    quantity = 25,
    price = 2.50
  ) |>
  fmt_currency(columns = price) |>
  fmt_integer(columns = quantity)
```

The new row is added at the bottom by default. You can use `.before` or `.after` to position it elsewhere:

```{r}
dplyr::tibble(
  rank = 1:3,
  name = c("Alice", "Bob", "Carol"),
  score = c(95, 87, 82)
) |>
  gt() |>
  rows_add(
    rank = 2,
    name = "New Entry",
    score = 90,
    .after = 1
  ) |>
  fmt_integer()
```

The new row is inserted after row 1, pushing the original rows 2 and 3 down. Note that you'll need to handle any renumbering or reordering logic yourself; `rows_add()` simply inserts the data.

You can add multiple rows at once by providing vectors:

```{r}
dplyr::tibble(
  category = c("Electronics"),
  sales = c(15000)
) |>
  gt() |>
  rows_add(
    category = c("Clothing", "Food", "Books"),
    sales = c(8500, 12000, 3200)
  ) |>
  fmt_currency(columns = sales, currency = "USD", decimals = 0) |>
  cols_label(
    category = "Category",
    sales = "Q4 Sales"
  )
```

The `.n_empty` argument lets you add blank rows, which can be useful for visual spacing:

```{r}
dplyr::tibble(
  section = c("Introduction", "Methods"),
  page = c(1, 15)
) |>
  gt() |>
  rows_add(
    section = "Results",
    page = 32,
    .after = 2
  ) |>
  rows_add(
    .n_empty = 1,
    .after = 2
  ) |>
  sub_missing(missing_text = "") |>
  cols_label(
    section = "Section",
    page = "Page"
  )
```

Like `cols_add()`, you can build a table from scratch using `rows_add()`:

```{r}
dplyr::tibble(
  time = lubridate::POSIXct(),
  event = character(0)
) |>
  gt() |>
  rows_add(
    time = lubridate::ymd_hms("2024-01-15 09:30:00"),
    event = "Meeting started"
  ) |>
  rows_add(
    time = lubridate::ymd_hms("2024-01-15 10:45:00"),
    event = "Break"
  ) |>
  rows_add(
    time = lubridate::ymd_hms("2024-01-15 11:00:00"),
    event = "Meeting resumed"
  ) |>
  fmt_datetime(columns = time, date_style = "yMd", time_style = "Hm")
```

This pattern of starting with an empty structure and incrementally adding rows is useful for building tables programmatically, such as logging events or accumulating results in an interactive application.

Both `cols_add()` and `rows_add()` integrate seamlessly with other **gt** functions. You can format, style, label, and otherwise manipulate the added columns and rows just like any other part of the table. This makes them powerful tools for keeping your table logic contained within the **gt** pipeline rather than scattered across data manipulation steps.

## Summary

This chapter has covered the comprehensive set of functions that modify table structure at the column and row level. These functions transform raw data into polished, presentation-ready table elements.

The key capabilities we've explored:

- column labels: `cols_label()` assigns human-readable labels, with support for Markdown, HTML, and units notation. `cols_label_with()` applies transformations programmatically across multiple columns.
- column dimensions: `cols_width()` controls column widths using pixels, percentages, or content-based sizing. `cols_align()` and `cols_align_decimal()` ensure proper alignment for readability.
- column arrangement: the `cols_move*()` family repositions columns, while `cols_hide()` and `cols_unhide()` control visibility without removing data.
- column merging: `cols_merge()` combines multiple columns using flexible patterns. Specialized variants like `cols_merge_uncert()`, `cols_merge_range()`, and `cols_merge_n_pct()` handle common merge scenarios with appropriate formatting.
- adding columns and rows: `cols_add()` creates new columns from expressions, enabling calculated fields and derived values directly in the **gt** pipeline. `rows_add()` inserts new rows, useful for additional data points or spacer rows.

These structural modifications work alongside the formatting and styling functions you've already learned. A typical workflow might involve formatting values, then adjusting column labels, setting appropriate widths, reordering columns for logical flow, and merging related information.

The next chapter explores summary rows and columns, which extend table structure vertically and horizontally with computed aggregations. You'll learn to add totals, averages, and other statistics that help readers understand your data at a glance.


---


# Summary rows and columns {#sec-summary-rows-columns}


Tables often need more than just raw data. They frequently require summary statistics that help readers understand the data at a glance: totals, averages, minimums, maximums, and other aggregations. In **gt**, we have powerful tools for adding these summaries both vertically (as summary rows) and horizontally (as summary columns).

The summary functions in **gt** address a common frustration in table-making: the disconnect between calculating summary statistics and presenting them elegantly. In many workflows, you might calculate means and totals in your data manipulation code, then manually position them in your table, style them differently from the data rows, and hope nothing breaks when the data changes. The **gt** approach is different. Summary rows and columns are computed from the table data itself, positioned automatically, and can be styled and formatted independently of the body data. When your underlying data changes, the summaries update automatically.

This chapter covers three primary functions: `summary_rows()` for adding summaries within row groups, `grand_summary_rows()` for adding summaries across the entire table, and `summary_columns()` for adding computed columns that aggregate across rows. We'll also cover `extract_summary()`, which lets you pull out summary data for use elsewhere. Together, these functions provide a complete toolkit for building tables that don't just present data but help readers understand it.

## The role of summary rows in tables

Before diving into the mechanics of creating summary rows, it's worth considering when and why you might use them. Summary rows serve several distinct purposes.

First, they provide context. A column of sales figures means more when you can see the total at the bottom. A list of response times becomes interpretable when you know the average. Summary rows transform raw data into information by providing reference points.

Second, they enable comparison. When data is organized into groups, summary rows for each group allow readers to compare not just individual values but aggregate performance. How does this quarter compare to last quarter? How does the East region compare to the West? Summary rows answer these questions at a glance.

Third, they support verification. In financial and accounting contexts, totals serve as check figures. Readers (and auditors) expect to see them, and their presence signals that the table has been carefully prepared.

Finally, they reduce cognitive load. Rather than requiring readers to mentally calculate averages or identify maximums, summary rows do the work for them. This is especially valuable when tables will be scanned quickly rather than studied carefully.

The **gt** package supports two types of summary rows: group summaries (created with `summary_rows()`) that appear within or alongside each row group, and grand summaries (created with `grand_summary_rows()`) that summarize the entire table. Both types can include multiple summary statistics, can be positioned at the top or bottom of their respective sections, and can be formatted independently of the body data.

## Adding group-level summaries with `summary_rows()`

The `summary_rows()` function adds summary rows to row groups in your table. This requires that your table actually has row groups, which you typically create by specifying a `groupname_col` in `gt()` or by using `tab_row_group()`. The summary rows appear within each group, providing statistics calculated from just that group's data.

Let's start with a practical example. We'll use the `sp500` dataset, which contains daily stock market data, and create a table with weekly row groups:

```{r}
sp500 |>
  filter(date >= "2015-01-05" & date <= "2015-01-16") |>
  arrange(date) |>
  mutate(week = paste0("W", strftime(date, format = "%V"))) |>
  select(-adj_close, -volume) |>
  gt(
    rowname_col = "date",
    groupname_col = "week"
  ) |>
  summary_rows(
    fns = list("min", "max", "mean"),
    fmt = ~ fmt_number(., decimals = 2, use_seps = FALSE)
  )
```

This table shows daily stock prices grouped by week, with minimum, maximum, and mean values calculated for each week. The summary rows appear at the bottom of each group by default, clearly labeled with the function names.

### Specifying aggregation functions

The `fns` argument is where you tell `summary_rows()` what statistics to calculate. There are several ways to specify aggregation functions, ranging from simple to highly customized.

The simplest approach is to provide function names as quoted strings:

```{r}
sp500 |>
  filter(date >= "2015-01-05" & date <= "2015-01-09") |>
  select(date, open, high, low, close) |>
  gt(rowname_col = "date") |>
  tab_row_group(label = "First Week", rows = everything()) |>
  summary_rows(
    fns = list("min", "max", "sum"),
    fmt = ~ fmt_number(., decimals = 2)
  )
```

For convenience, **gt** automatically adds `na.rm = TRUE` to common aggregation functions when you specify them as strings. This applies to `"min"`, `"max"`, `"mean"`, `"median"`, `"sd"`, and `"sum"`. This saves you from writing out the full expression every time.

When you need more control, you can use formula syntax. The right-hand side (RHS) of the formula contains the aggregation expression, where `.` represents the column data:

```{r}
sp500 |>
  filter(date >= "2015-01-05" & date <= "2015-01-09") |>
  select(date, open, close) |>
  gt(rowname_col = "date") |>
  tab_row_group(label = "First Week", rows = everything()) |>
  summary_rows(
    fns = list(
      range = ~ max(.) - min(.),
      avg = ~ mean(., na.rm = TRUE)
    ),
    fmt = ~ fmt_number(., decimals = 2)
  )
```

The named list elements become both the ID and the label for each summary row. In this example, we calculate a custom range statistic (the difference between maximum and minimum) alongside the average.

For maximum flexibility, you can provide a double-sided formula where the left-hand side (LHS) specifies the ID and label:

```{r}
sp500 |>
  filter(date >= "2015-01-05" & date <= "2015-01-09") |>
  select(date, open, close) |>
  gt(rowname_col = "date") |>
  tab_row_group(label = "First Week", rows = everything()) |>
  summary_rows(
    fns = list(
      list(id = "daily_range", label = md("**Daily Range**")) ~ max(.) - min(.),
      list(id = "average", label = md("*Average*")) ~ mean(., na.rm = TRUE)
    ),
    fmt = ~ fmt_number(., decimals = 2)
  )
```

This approach lets you use different values for the row's ID (used for targeting in other functions like `tab_style()`) and its label (displayed in the table). The label can include Markdown formatting via `md()` or HTML via `html()`.

### Targeting specific columns

By default, `summary_rows()` calculates aggregations for all columns. This is rarely what you want, especially when your table includes non-numeric columns or columns where aggregation doesn't make sense.

The `columns` argument lets you specify which columns should receive summary calculations:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum", "mean"),
    fmt = ~ fmt_number(., decimals = 1)
  )
```

You can use any tidyselect expression in `columns`:

```{r}
exibble |>
  select(group, num, currency, char) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = where(is.numeric),
    fns = list("sum"),
    fmt = ~ fmt_number(., decimals = 1)
  )
```

Using `where(is.numeric)` ensures that only numeric columns receive summary calculations, even if the table structure changes later.

### Targeting specific groups

Sometimes you only want summary rows for certain groups, not all of them. The `groups` argument controls which row groups receive summaries:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    groups = "grp_a",
    columns = c(num, currency),
    fns = list("sum"),
    fmt = ~ fmt_number(., decimals = 1)
  )
```

This adds a sum row only to `grp_a`, leaving `grp_b` without summaries. The `groups` argument accepts group IDs as strings, vectors of strings, or tidyselect helpers like `starts_with()` or `matches()`.

### Positioning summary rows

By default, summary rows appear at the bottom of each group. The `side` argument lets you place them at the top instead:

```{r}
countrypops |>
  filter(country_code_2 %in% c("BR", "RU", "IN", "CN")) |>
  filter(year %in% c(2000, 2010, 2020)) |>
  select(country_name, year, population) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  gt(rowname_col = "country_name") |>
  tab_row_group(label = "BRIC Nations", rows = everything()) |>
  summary_rows(
    fns = list(label = md("**TOTAL**"), id = "total", fn = "sum"),
    fmt = ~ fmt_integer(.),
    side = "top"
  )
```

Placing totals at the top is common in financial reporting, where readers want to see the bottom line first. The summary row appears before the detail rows, inviting readers to drill down into the components.

### Formatting summary values

The `fmt` argument accepts formatting expressions that control how summary values appear. You can use any **gt** formatting function:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum", "mean"),
    fmt = list(
      ~ fmt_number(., decimals = 0, use_seps = TRUE),
      ~ fmt_currency(., currency = "USD")
    )
  )
```

When you provide a list of formatting expressions, they're applied in order to the summary rows. In this example, the sum row uses `fmt_number()` and the mean row uses `fmt_currency()`.

You can also target specific columns within the formatting expression:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum"),
    fmt = ~ fmt_number(., columns = num, decimals = 1) |>
           fmt_currency(columns = currency, currency = "EUR")
  )
```

For group-specific formatting, use a two-sided formula where the LHS identifies the group:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum"),
    fmt = list(
      "grp_a" ~ fmt_number(., decimals = 0),
      "grp_b" ~ fmt_number(., decimals = 2)
    )
  )
```

This technique is useful when groups have different precision requirements. Perhaps one group contains whole-number counts while another contains measurements that warrant decimal places. The two-sided formula syntax keeps these formatting rules close to the summary definition, making the code easier to maintain.

### Handling missing values

When aggregation produces `NA` values (for example, when all values in a column are `NA`), the `missing_text` argument controls what appears in the cell:

```{r}
dplyr::tibble(
  group = c("A", "A", "B", "B"),
  value = c(1, 2, NA, NA)
) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = value,
    fns = list("mean"),
    missing_text = "No data"
  )
```

The default `missing_text` is `"---"`, which provides a visual placeholder that clearly indicates the absence of a calculable value (an em dash).

## Adding table-level summaries with `grand_summary_rows()`

While `summary_rows()` operates on individual row groups, `grand_summary_rows()` calculates aggregations across all data in the table, regardless of grouping. Grand summary rows typically appear at the very bottom (or top) of the table, providing overall totals or averages.

```{r}
sp500 |>
  filter(date >= "2015-01-05" & date <= "2015-01-16") |>
  arrange(date) |>
  mutate(week = paste0("W", strftime(date, format = "%V"))) |>
  select(-adj_close, -volume) |>
  gt(
    rowname_col = "date",
    groupname_col = "week"
  ) |>
  summary_rows(
    fns = list("min", "max"),
    fmt = ~ fmt_number(., decimals = 2, use_seps = FALSE)
  ) |>
  grand_summary_rows(
    columns = c(open, high, low, close),
    fns = list(
      list(id = "grand_min", label = "Overall Min") ~ min(.),
      list(id = "grand_max", label = "Overall Max") ~ max(.),
      list(id = "grand_avg", label = "Overall Avg") ~ mean(.)
    ),
    fmt = ~ fmt_number(., decimals = 2, use_seps = FALSE)
  )
```

This table now has both group-level summaries (min and max for each week) and grand summaries (overall min, max, and average for the entire period). The grand summary rows span all groups, summarizing the complete dataset.

### Arguments and usage

The `grand_summary_rows()` function shares most of its arguments with `summary_rows()`:

- `columns`: Which columns to aggregate (defaults to all)
- `fns`: Aggregation expressions (same syntax as `summary_rows()`)
- `fmt`: Formatting expressions
- `side`: `"bottom"` (default) or `"top"`
- `missing_text`: Text for `NA` values (default: `"---"`)

The key difference is that `grand_summary_rows()` has no `groups` argument, since it always operates on all data.

```{r}
countrypops |>
  filter(country_code_2 %in% c("BE", "NL", "LU")) |>
  filter(year %% 10 == 0) |>
  select(country_name, year, population) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  gt(rowname_col = "country_name") |>
  tab_header(title = "Populations of the Benelux Countries") |>
  tab_spanner(columns = everything(), label = "Year") |>
  fmt_integer() |>
  grand_summary_rows(
    fns = list(label = "TOTALS", id = "totals", fn = "sum"),
    fmt = ~ fmt_integer(.),
    side = "top"
  ) |>
  tab_style(
    locations = cells_grand_summary(),
    style = cell_fill(color = "lightblue")
  )
```

In this example, the grand summary row appears at the top of the table (a common convention for totals) and is styled with a light blue background to distinguish it from the data rows.

### Referencing other columns in aggregations

A powerful but often overlooked feature of summary rows is the ability to reference other columns within an aggregation formula. This is particularly useful when you need to compute a summary that depends on values from multiple columns, such as a weighted average or a ratio that must be calculated from totals rather than averaged directly.

Let's consider a sales dataset where each row shows units sold and total profit for a product. If you want the grand summary to show the overall profit per unit, you cannot simply average the per-unit profits from each row (that would give incorrect results if the rows have different unit volumes). Instead, you need to sum all profits and divide by the sum of all units. The `fns` argument allows you to write aggregation expressions that reference any column in the table data, not just the column being summarized.

```{r}
dplyr::tibble(
  product = c("Widget", "Gadget", "Sprocket", "Gizmo", "Doodad"),
  units = c(150, 280, 95, 420, 175),
  profit = c(4500, 11200, 3325, 12600, 6125)
) |>
  dplyr::mutate(profit_per_unit = profit / units) |>
  gt(rowname_col = "product") |>
  fmt_integer(columns = units) |>
  fmt_currency(columns = c(profit, profit_per_unit)) |>
  cols_label(
    units = "Units Sold",
    profit = "Total Profit",
    profit_per_unit = "Profit/Unit"
  ) |>
  grand_summary_rows(
    columns = units,
    fns = list(label = md("**TOTAL**"), id = "totals", fn = "sum"),
    fmt = ~ fmt_integer(.)
  ) |>
  grand_summary_rows(
    columns = c(profit, profit_per_unit),
    fns = list(label = md("**TOTAL**"), id = "totals", fn = "sum"),
    fmt = ~ fmt_currency(.)
  ) |>
  grand_summary_rows(
    columns = profit_per_unit,
    fns = list(label = md("**TOTAL**"), id = "totals") ~ sum(profit) / sum(units),
    fmt = ~ fmt_currency(.)
  ) |>
  tab_style(
    locations = cells_grand_summary(),
    style = cell_fill(color = "lightgray")
  )
```

This example demonstrates several techniques worth noting. First, we call `grand_summary_rows()` three times, but all calls use the same `id = "totals"`. This produces a single summary row in the table, not three separate rows. By splitting the aggregation across multiple calls, we can apply different logic to different columns while maintaining a unified row label.
  
Second, each call uses its own formatting: `fmt_integer()` for the units column, and `fmt_currency()` for the profit and profit-per-unit columns. This flexibility is essential when a single summary row must display values with fundamentally different formats.

Third, the `profit_per_unit` summary uses a custom formula that references the `profit` and `units` columns directly. The expression `sum(profit) / sum(units)` calculates the correct weighted profit per unit across all products (totaling `"$37,750"` profit divided by 1,120 units gives `"$33.71"` per unit), rather than averaging the individual ratios (which would incorrectly give `"$33.04"`).

This technique works in both `summary_rows()` and `grand_summary_rows()`. Within a group summary, the column references resolve to just that group's data. Within a grand summary, they resolve to the entire table's data. This makes it straightforward to compute derived statistics like weighted averages, ratios of totals, or any calculation that requires multiple columns.

### Combining group and grand summaries

Many real-world tables require multiple levels of aggregation. A financial report might show subtotals for each department and a grand total for the entire organization. A sales analysis might present regional summaries alongside company-wide figures. A scientific study might report group means as well as overall statistics. In these situations, you need both `summary_rows()` and `grand_summary_rows()` working together.

The key to making multi-level summaries work is visual differentiation. When readers encounter two or three types of summary rows in a single table, they need clear cues to distinguish subtotals from grand totals from data rows. This typically means using different background colors, text weights, or indentation levels for each type. Without such differentiation, the hierarchy becomes confusing and the summaries lose their communicative value.

The following example demonstrates this pattern with population data for two groups of countries:

```{r}
countrypops |>
  filter(
    country_code_2 %in% c("BR", "RU", "IN", "CN", "FR", "DE", "IT", "GB")
  ) |>
  filter(year %% 10 == 0) |>
  select(country_name, year, population) |>
  tidyr::pivot_wider(names_from = year, values_from = population) |>
  gt(rowname_col = "country_name") |>
  tab_row_group(
    label = md("*BRIC*"),
    rows = c("Brazil", "Russia", "India", "China"),
    id = "bric"
  ) |>
  tab_row_group(
    label = md("*Big Four*"),
    rows = c("France", "Germany", "Italy", "United Kingdom"),
    id = "big4"
  ) |>
  row_group_order(groups = c("bric", "big4")) |>
  tab_stub_indent(rows = everything()) |>
  tab_header(title = "Populations of the BRIC and Big Four Countries") |>
  tab_spanner(columns = everything(), label = "Year") |>
  fmt_number(n_sigfig = 3, suffixing = TRUE) |>
  summary_rows(
    fns = list(label = md("**Subtotal**"), id = "subtotal", fn = "sum"),
    fmt = ~ fmt_number(., n_sigfig = 3, suffixing = TRUE),
    side = "bottom"
  ) |>
  grand_summary_rows(
    fns = list(label = md("**GRAND TOTAL**"), id = "grand_total", fn = "sum"),
    fmt = ~ fmt_number(., n_sigfig = 3, suffixing = TRUE)
  ) |>
  tab_style(
    locations = cells_summary(),
    style = cell_fill(color = "lightgray")
  ) |>
  tab_style(
    locations = cells_grand_summary(),
    style = list(
      cell_fill(color = "steelblue"),
      cell_text(color = "white")
    )
  )
```

This table shows populations for two groups of countries (BRIC and Big Four), with subtotals for each group and a grand total for all countries combined. The styling distinguishes the different types of summary rows, making the table's structure immediately clear.

## Adding summary columns with `summary_columns()`
 
While summary rows aggregate data vertically (down columns), summary columns aggregate data horizontally (across rows). The `summary_columns()` function computes row-wise aggregations and adds them as new columns to your table. This is useful when you want to show totals, averages, or other statistics that combine values from multiple columns within each row.

```{r}
exibble |>
  select(row, num, currency) |>
  gt(rowname_col = "row") |>
  summary_columns(
    columns = c(num, currency),
    fns = ~ sum(., na.rm = TRUE),
    new_col_names = "total",
    new_col_labels = md("**Total**")
  )
```

This adds a `total` column that sums the `num` and `currency` values for each row. The new column appears on the right side of the table by default and can be formatted, styled, and manipulated like any other column.

### Specifying aggregation functions

The `fns` argument works similarly to the summary row functions, but the aggregation happens across columns rather than down rows. This horizontal aggregation is particularly useful for time-series data where columns represent periods (months, quarters, years) and you want to show totals or averages for each row. It's also valuable when columns represent categories or components that naturally sum to a meaningful whole.

Unlike summary rows, which aggregate many observations into fewer summary values, summary columns preserve the row structure while adding derived values. Each row in your original data still appears in the output; you're simply enriching it with computed statistics. This makes summary columns ideal for dashboards and reports where readers want to see both the details and the row-level summaries side by side.

```{r}
dplyr::tibble(
  product = c("Widget", "Gadget", "Sprocket"),
  q1_sales = c(150, 200, 175),
  q2_sales = c(180, 190, 160),
  q3_sales = c(200, 210, 190),
  q4_sales = c(220, 205, 210)
) |>
  gt(rowname_col = "product") |>
  summary_columns(
    columns = ends_with("_sales"),
    fns = list(
      ~ sum(.),
      ~ mean(.)
    ),
    new_col_names = c("annual_total", "quarterly_avg"),
    new_col_labels = c("Annual Total", "Quarterly Avg")
  ) |>
  fmt_number(columns = quarterly_avg, decimals = 1)
```

You can add multiple summary columns at once by providing a list of functions. Each function generates a separate column, and you can specify names and labels for each.

### Custom aggregation expressions

Simple aggregations like sums and means cover many use cases, but sometimes you need calculations that involve multiple columns in more complex ways. Perhaps you want to compute a percentage change between two columns, calculate a ratio, or apply a formula that references specific column positions. The bracket notation in `summary_columns()` makes this possible.

When you write `.[1]`, `.[2]`, and so on in your formula, you're referring to the columns in the order they appear in your `columns` argument. This positional reference system lets you build arbitrarily complex expressions. The trade-off is readability: bracket notation is concise but can be cryptic if you're not careful. For complex calculations, consider adding a comment in your code explaining what each position represents.

```{r}
countrypops |>
  arrange(country_name, year) |>
  group_by(country_name, country_code_2) |>
  summarize(
    pop_1960 = first(population),
    pop_2024 = last(population),
    years = n(),
    .groups = "drop"
  ) |>
  filter(!is.na(pop_1960), !is.na(pop_2024)) |>
  slice_max(pop_2024 - pop_1960, n = 5) |>
  select(country_name, pop_1960, pop_2024, years) |>
  gt(rowname_col = "country_name") |>
  summary_columns(
    columns = c(pop_1960, pop_2024, years),
    fns = ~ (.[2] - .[1]) / (.[3] - 1),
    new_col_names = "avg_annual_change",
    new_col_labels = md("**Avg. Annual Change**")
  ) |>
  fmt_integer() |>
  cols_label(
    pop_1960 = "1960 Pop.",
    pop_2024 = "2024 Pop.",
    years = "Years"
  )
```

In this expression, `.[1]` refers to the first selected column (`pop_1960`), `.[2]` to the second (`pop_2024`), and `.[3]` to the third (`years`). This allows complex calculations that reference multiple columns.

### Formatting summary columns

Summary columns often require different formatting than the source columns they're derived from. A column of quarterly sales figures might use integer formatting, but the average of those quarters might warrant one decimal place. A column showing year-over-year change might need percentage formatting even when the source columns are raw numbers. The `fmt` argument lets you apply formatting to the new column immediately, without a separate formatting step.

This inline formatting is particularly convenient because it keeps the summary column's definition self-contained. Everything about the column (what it calculates, what it's called, and how it's displayed) is specified in a single function call. This makes the code easier to read and maintain, especially when you're creating multiple summary columns with different formatting requirements.

```{r}
dplyr::tibble(
  item = c("Revenue", "Expenses", "Profit"),
  jan = c(10000, 8000, 2000),
  feb = c(12000, 8500, 3500),
  mar = c(11000, 8200, 2800)
) |>
  gt(rowname_col = "item") |>
  summary_columns(
    columns = c(jan, feb, mar),
    fns = ~ mean(.),
    new_col_names = "avg",
    new_col_labels = "Q1 Average",
    fmt = ~ fmt_currency(., currency = "USD", decimals = 0)
  ) |>
  fmt_currency(columns = c(jan, feb, mar), currency = "USD", decimals = 0)
```

The summary column displays the Q1 average for each row, formatted as currency to match the source columns. By handling the formatting within `summary_columns()`, the new column integrates seamlessly with the rest of the table. Readers see consistent dollar formatting across all columns, whether they contain original data or computed summaries.

## Styling summary rows

Summary rows can be styled like any other table element using `tab_style()`. The location helper functions `cells_summary()` and `cells_grand_summary()` target summary rows specifically.

### Styling all summary rows

Summary rows serve a different purpose than data rows, and that difference should be visible. Readers scanning a table need to immediately distinguish totals and averages from individual observations. Without visual differentiation, summary rows blend into the data, and readers may misinterpret aggregated values as additional data points.

The most common styling choices for summary rows include background fills (light gray is a classic choice), bold text, borders above or below the row, and italic styling for certain types of summaries like averages. The goal is distinction without distraction: the styling should set summary rows apart without overwhelming the table's visual hierarchy.

To apply uniform styling to all summary rows across all groups, use `cells_summary()` without any filtering arguments:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum", "mean"),
    fmt = ~ fmt_number(., decimals = 1)
  ) |>
  tab_style(
    locations = cells_summary(),
    style = list(
      cell_fill(color = "lightgray"),
      cell_text(weight = "bold")
    )
  )
```

The gray background and bold text make the summary rows immediately identifiable. This blanket styling approach works well when all summary rows serve the same purpose and deserve equal visual weight.

### Targeting specific summary rows

You can target specific summary rows by their ID using the `rows` argument in `cells_summary()`:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list(
      list(id = "total", label = "Total") ~ sum(., na.rm = TRUE),
      list(id = "average", label = "Average") ~ mean(., na.rm = TRUE)
    ),
    fmt = ~ fmt_number(., decimals = 1)
  ) |>
  tab_style(
    locations = cells_summary(rows = "total"),
    style = cell_fill(color = "lightblue")
  ) |>
  tab_style(
    locations = cells_summary(rows = "average"),
    style = cell_text(style = "italic")
  )
```

By assigning IDs to summary rows in the `fns` argument, you gain precise control over their styling. Here, totals receive a blue background to signal their importance as definitive figures, while averages use italic text to suggest they're derived statistics rather than absolute values. This kind of semantic styling helps readers interpret the numbers correctly.

### Targeting specific groups and columns

The `cells_summary()` function accepts `groups` and `columns` arguments for precise targeting:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum"),
    fmt = ~ fmt_number(., decimals = 1)
  ) |>
  tab_style(
    locations = cells_summary(
      groups = "grp_a",
      columns = currency
    ),
    style = cell_fill(color = "lightgreen")
  )
```

This level of precision is useful when you want to highlight specific values (perhaps a particularly important group, a column that exceeded targets, or a combination that warrants the reader's attention). The `cells_summary()` helper accepts any combination of `groups`, `columns`, and `rows` arguments, giving you fine-grained control over exactly which cells receive styling.

### Styling grand summary rows

Grand summary rows use the `cells_grand_summary()` location helper:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  grand_summary_rows(
    columns = c(num, currency),
    fns = list(
      list(id = "grand_total", label = md("**Grand Total**")) ~ sum(., na.rm = TRUE)
    ),
    fmt = ~ fmt_number(., decimals = 1)
  ) |>
  tab_style(
    locations = cells_grand_summary(),
    style = list(
      cell_fill(color = "navy"),
      cell_text(color = "white", weight = "bold")
    )
  )
```

The dark background with white text creates strong visual emphasis appropriate for a grand total (the single most important number in many tables). Like `cells_summary()`, the `cells_grand_summary()` helper accepts `columns` and `rows` arguments for more targeted styling when needed.

## Adding footnotes to summary rows

Footnotes can be attached to summary rows using `tab_footnote()` with the appropriate location helpers:

```{r}
exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list(
      list(id = "avg", label = "Average") ~ mean(., na.rm = TRUE)
    ),
    fmt = ~ fmt_number(., decimals = 2)
  ) |>
  tab_footnote(
    footnote = "Arithmetic mean excluding missing values",
    locations = cells_summary(
      groups = everything(),
      columns = num,
      rows = "avg"
    )
  )
```

The footnote appears on every "Average" row across all groups, clarifying the calculation method. This is particularly important for summary statistics where multiple calculation methods exist (arithmetic vs. geometric mean, sample vs. population standard deviation) or where the handling of missing values affects interpretation. Footnotes on summary rows serve the same documentary purpose as footnotes elsewhere in the table, providing essential context without cluttering the display.

## Extracting summary data with `extract_summary()`

Sometimes you need to access the computed summary values programmatically, rather than just displaying them in a table. The `extract_summary()` function retrieves summary data from a **gt** table as a list of data frames.
 
```{r}
gt_table <- exibble |>
  select(group, num, currency) |>
  gt(groupname_col = "group") |>
  summary_rows(
    columns = c(num, currency),
    fns = list("sum", "mean"),
    fmt = ~ fmt_number(., decimals = 2)
  ) |>
  grand_summary_rows(
    columns = c(num, currency),
    fns = list("sum"),
    fmt = ~ fmt_number(., decimals = 2)
  )

extract_summary(gt_table)
```

The returned list contains one data frame per row group (including a `"::grand_summary"` element for grand summaries if present). Each data frame includes the row names, group information, and the formatted summary values.

This is useful for:

- Reusing summary calculations in other analyses
- Creating custom visualizations of summary data  
- Validating that summaries are calculated correctly
- Building composite tables from multiple sources

## Practical examples

The techniques covered in this chapter come together most clearly in real-world scenarios. The following examples demonstrate how summary rows and columns can be combined to create tables that serve specific professional purposes. Each example illustrates different aspects of the summary system and shows how formatting and styling choices reinforce the table's communicative goals.

### Financial statement with subtotals

Financial statements are perhaps the most natural application for summary rows. Accountants and financial analysts expect to see subtotals for logical groupings (revenue, expenses, assets, liabilities) along with grand totals that tie everything together. The following example creates a simplified income statement that demonstrates these conventions.

```{r}
dplyr::tibble(
  category = c(
    "Revenue", "Revenue", "Revenue",
    "Expenses", "Expenses", "Expenses", "Expenses"
  ),
  item = c(
    "Product Sales", "Service Revenue", "Licensing",
    "Cost of Goods", "Salaries", "Marketing", "Operations"
  ),
  amount = c(500000, 150000, 75000, -180000, -220000, -45000, -80000)
) |>
  gt(
    rowname_col = "item",
    groupname_col = "category"
  ) |>
  fmt_currency(columns = amount, currency = "USD", accounting = TRUE) |>
  summary_rows(
    fns = list(
      list(id = "subtotal", label = md("*Subtotal*")) ~ sum(.)
    ),
    fmt = ~ fmt_currency(., currency = "USD", accounting = TRUE)
  ) |>
  grand_summary_rows(
    fns = list(
      list(id = "net_income", label = md("**Net Income**")) ~ sum(.)
    ),
    fmt = ~ fmt_currency(., currency = "USD", accounting = TRUE)
  ) |>
  tab_style(
    locations = cells_summary(),
    style = cell_text(style = "italic")
  ) |>
  tab_style(
    locations = cells_grand_summary(),
    style = list(
      cell_fill(color = "lightgray"),
      cell_text(weight = "bold")
    )
  ) |>
  tab_header(
    title = "Income Statement",
    subtitle = "Fiscal Year 2024"
  )
```

Notice how accounting notation (parentheses for negative values) is applied consistently to both the data rows and the summary rows. The subtotals use italic styling to distinguish them from line items, while the grand total (Net Income) receives bold text and a background fill to mark it as the bottom line. This visual hierarchy guides readers from detail to summary.

### Sales report with multiple statistics

Business reports often need to show both detailed breakdowns and summary statistics. This example combines `summary_columns()` for row-wise totals and averages with `grand_summary_rows()` for column-wise company totals. The result is a table that answers multiple questions at once: How did each region perform? What were the quarterly trends? What's the company-wide picture?

```{r}
dplyr::tibble(
  region = rep(c("North", "South", "East", "West"), each = 3),
  quarter = rep(c("Q1", "Q2", "Q3"), 4),
  sales = c(
    120, 135, 142,
    98, 105, 118,
    156, 148, 162,
    88, 95, 102
  )
) |>
  tidyr::pivot_wider(names_from = quarter, values_from = sales) |>
  gt(rowname_col = "region") |>
  summary_columns(
    columns = c(Q1, Q2, Q3),
    fns = list(~ sum(.), ~ mean(.)),
    new_col_names = c("total", "avg"),
    new_col_labels = c("Total", "Avg"),
    fmt = ~ fmt_number(., decimals = 0)
  ) |>
  grand_summary_rows(
    columns = c(Q1, Q2, Q3, total, avg),
    fns = list(
      list(id = "company_total", label = "Company Total") ~ sum(.)
    ),
    fmt = ~ fmt_number(., decimals = 0)
  ) |>
  tab_spanner(label = "Quarters", columns = c(Q1, Q2, Q3)) |>
  tab_spanner(label = "Summary", columns = c(total, avg)) |>
  tab_header(title = "Regional Sales Report")
```

The use of column spanners (`"Quarters"` and `"Summary"`) helps readers understand the table's structure at a glance. The summary columns on the right provide immediate context for each region's performance, while the grand summary row at the bottom gives the company-wide view. A manager scanning this table can quickly identify that East is the top-performing region and that sales have been trending upward across quarters.

### Scientific data with statistical summaries

Scientific publications typically require summary statistics like means, standard deviations, and sample sizes for experimental data. This example shows how `summary_rows()` can present multiple statistics for each treatment group, formatted appropriately for each measure.

```{r}
set.seed(23)

dplyr::tibble(
  treatment = rep(c("Control", "Treatment A", "Treatment B"), each = 4),
  replicate = rep(1:4, 3),
  response = c(
    rnorm(4, mean = 10, sd = 2),
    rnorm(4, mean = 15, sd = 2),
    rnorm(4, mean = 13, sd = 2)
  )
) |>
  gt(
    rowname_col = "replicate",
    groupname_col = "treatment"
  ) |>
  fmt_number(columns = response, decimals = 2) |>
  summary_rows(
    columns = response,
    fns = list(
      list(id = "mean", label = "Mean") ~ mean(.),
      list(id = "sd", label = "SD") ~ sd(.),
      list(id = "n", label = "n") ~ length(.)
    ),
    fmt = list(
      ~ fmt_number(., decimals = 2),
      ~ fmt_number(., decimals = 2),
      ~ fmt_integer(.)
    )
  ) |>
  tab_style(
    locations = cells_summary(),
    style = cell_fill(color = "lightyellow")
  ) |>
  tab_header(
    title = "Experimental Results",
    subtitle = "Response variable by treatment group"
  )
```

Each treatment group receives the same three summary statistics, formatted according to their nature: means and standard deviations show two decimal places, while sample sizes appear as integers. The light yellow background on summary rows distinguishes them from the raw data, making it easy for readers to find the statistics they need. This format is common in scientific papers and lab reports, where reviewers expect to see both the underlying data and its statistical summary.

These three examples illustrate the versatility of **gt**'s summary system. Whether you're preparing financial reports, business analyses, or scientific publications, the same core functions adapt to meet domain-specific conventions and reader expectations.

## Summary

The summary functions in **gt** provide a comprehensive system for adding aggregated data to your tables:

- `summary_rows()` adds summary rows within each row group, useful for subtotals and group-level statistics
- `grand_summary_rows()` adds summary rows that aggregate across the entire table, useful for overall totals and grand statistics
- `summary_columns()` adds computed columns that aggregate across rows, useful for row totals and row-wise calculations
- `extract_summary()` retrieves summary data for use outside the table

All three summary functions share a consistent interface with the `fns` argument for specifying aggregations, the `fmt` argument for formatting results, and the `side` argument for positioning. Summary elements can be styled and annotated using the standard **gt** functions with the `cells_summary()` and `cells_grand_summary()` location helpers.

By separating the calculation of summaries from their presentation, **gt** ensures that your tables remain reproducible and maintainable. When data changes, summaries update automatically. When you need different formatting, you can adjust it without recalculating. This approach embodies the **gt** philosophy: express your intent clearly, and let the package handle the details.


---


# Table styling and options {#sec-table-styling-options}


The visual appearance of a **gt** table has a tremendous impact on how effectively it communicates its data. While a table may contain valuable information, poor aesthetic choices can obscure important patterns or make comparisons difficult. Conversely, styling decisions such as selective use of color, appropriate typography, judicious borders, and effective spacing can transform raw data into a compelling visual narrative.
 
This chapter explores the rich set of tools **gt** provides for controlling the aesthetic dimensions of tables. We begin with data-driven coloring, where cell colors communicate quantitative relationships. We then examine precision styling through `tab_style()`, which permits targeted modifications to any table location. The `tab_options()` function opens up a vast landscape of global table settings, while various `opt_*()` convenience functions provide quick access to commonly desired configurations. Finally, we explore interactive HTML tables, which offer readers additional ways to explore and understand tabular data.

These aesthetic controls exist not merely for decoration but to enhance comprehension. Color can highlight extremes or encode continuous variables. Typography establishes hierarchy and improves readability. Borders delineate structure. Padding affects density and scannability. Understanding how these elements work together (and knowing when restraint serves better than embellishment) is essential for creating truly effective display tables.

## Coloring data according to their values

Color represents one of the most powerful visual channels available for encoding data. When applied thoughtfully to table cells, background colors can reveal patterns, highlight outliers, and provide an immediate sense of magnitude that numbers alone cannot convey. The human visual system is good at perceiving color gradients and categorical distinctions, making data coloring an effective technique for enhancing table comprehension.

The `data_color()` function in **gt** provides sophisticated mechanisms for mapping data values to colors. It supports multiple coloring methods (numeric interpolation, binning, quantiles, and categorical factors) and offers extensive palette options ranging from built-in R palettes to the rich collections available through viridis and RColorBrewer packages, as well as the vast selection accessible via the paletteer package. The function also handles practical concerns like automatic text recoloring for accessibility and flexible targeting of specific cells.

### `data_color()`

The `data_color()` function performs cell colorization based on the data values themselves. This is fundamentally different from static styling; the colors emerge from and communicate the underlying data.

**Function Signature**

```r
data_color(
  data,
  columns = everything(),
  rows = everything(),
  direction = c("column", "row"),
  target_columns = NULL,
  method = c("auto", "numeric", "bin", "quantile", "factor"),
  palette = NULL,
  domain = NULL,
  bins = 8,
  quantiles = 4,
  levels = NULL,
  ordered = FALSE,
  na_color = NULL,
  alpha = NULL,
  reverse = FALSE,
  fn = NULL,
  apply_to = c("fill", "text"),
  autocolor_text = TRUE,
  contrast_algo = c("apca", "wcag"),
  autocolor_light = "#FFFFFF",
  autocolor_dark = "#000000"
)
```

The simplest invocation colors the entire table using default settings:

```{r}
exibble |>
  gt() |>
  data_color()
```

This basic example applies the default R color palette to all columns. Numeric columns receive continuous color interpolation while character and factor columns use categorical coloring. Notice how the text color automatically adjusts for contrast where dark text appears on light backgrounds and vice versa.

For more targeted and meaningful coloring, we typically specify the columns, method, and palette:

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-01" & date <= "2015-01-15") |>
  dplyr::select(date, open, high, low, close) |>
  gt() |>
  fmt_currency(columns = c(open, high, low, close), decimals = 2) |>
  data_color(
    columns = c(open, high, low, close),
    method = "numeric",
    palette = "RdYlGn",
    domain = c(1990, 2090)
  )
```

In this table of S&P 500 data, we apply a red-yellow-green palette to the price columns. The `domain` argument explicitly sets the value range for color mapping, ensuring consistent coloring across all four columns. Red indicates lower prices while green indicates higher values. This color scheme immediately reveals the relative position of each value within the specified range.

The `method` argument determines how values map to colors. The `"numeric"` method provides linear interpolation, ideal for continuous data. The `"bin"` method groups values into discrete categories:
 
```{r}
countrypops |>
  dplyr::filter(country_name == "United States", year >= 2000) |>
  dplyr::select(year, population) |>
  gt() |>
  fmt_integer(columns = population) |>
  data_color(
    columns = population,
    method = "bin",
    palette = "Blues",
    bins = 5
  )
```

Here, the U.S. population values are grouped into five bins, each receiving a distinct shade of blue. This method is useful when you want to emphasize categorical differences rather than continuous gradation. The boundaries are determined automatically based on the data range.

The `"quantile"` method ensures equal numbers of observations in each color category, which can reveal distributional patterns that `"bin"` might obscure:

```{r}
gtcars |>
  dplyr::select(mfr, model, hp, mpg_c) |>
  dplyr::slice_head(n = 12) |>
  gt() |>
  data_color(
    columns = hp,
    method = "quantile",
    palette = "viridis",
    quantiles = 4
  )
```

With quartile coloring, each of the four colors appears in roughly equal frequency, regardless of how the actual values are distributed. This is particularly valuable for skewed distributions where numeric or bin methods might concentrate most observations in a single color.

For categorical data, the `"factor"` method maps distinct values to distinct colors:

```{r}
gtcars |>
  dplyr::select(mfr, model, drivetrain, hp) |>
  dplyr::slice_head(n = 10) |>
  gt() |>
  data_color(
    columns = drivetrain,
    method = "factor",
    palette = c("rwd" = "#E69F00", "awd" = "#56B4E9", "4wd" = "#009E73")
  )
```

This example demonstrates explicit color assignment using a named vector. Each drivetrain type receives its specified color, providing complete control over the categorical mapping.

The `target_columns` argument enables indirect coloring, where one column's values determine another column's colors:

```{r}
countrypops |>
  dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA")) |>
  dplyr::filter(year %% 10 == 0, year >= 1970) |>
  dplyr::select(country_name, year, population) |>
  dplyr::mutate(color_indicator = "") |>
  gt(groupname_col = "country_name") |>
  fmt_integer(columns = population) |>
  data_color(
    columns = population,
    target_columns = color_indicator,
    method = "numeric",
    palette = "plasma",
    domain = c(0, 1.5e9)
  ) |>
  cols_label(
    year = "Year",
    population = "Population",
    color_indicator = ""
  ) |>
  cols_width(color_indicator ~ px(30))
```

The population values drive the coloring, but the colors appear in the separate `color_indicator` column. This technique creates a visual "legend" column that displays the color scale while keeping the numeric values unobscured.

Row-wise coloring analyzes values across rows rather than down columns:

```{r}
sza |>
  dplyr::filter(latitude == 30 & tst <= "1100") |>
  dplyr::select(-latitude) |>
  dplyr::filter(!is.na(sza)) |>
  tidyr::pivot_wider(names_from = tst, values_from = sza, names_sort = TRUE) |>
  gt(rowname_col = "month") |>
  data_color(
    direction = "row",
    palette = "YlOrRd",
    na_color = "white"
  ) |>
  sub_missing(missing_text = "")
```

With `direction = "row"`, each row's color scale is computed independently. This reveals patterns within rows (how solar zenith angles vary through the day for each month) rather than comparing the same time across months.

For maximum control, you can supply a custom color-mapping function via the `fn` argument:

```{r}
towny |>
  dplyr::select(name, population_2021) |>
  dplyr::slice_max(population_2021, n = 10) |>
  gt() |>
  fmt_integer(columns = population_2021) |>
  data_color(
    columns = population_2021,
    fn = scales::col_numeric(
      palette = "Greens",
      domain = c(0, 3e6),
      na.color = "gray"
    )
  )
```

Using `scales::col_numeric()` directly provides access to additional options not exposed through `data_color()`'s simplified interface. You can also write entirely custom functions for specialized coloring logic.

## Adding style to various locations

Beyond data-driven coloring, tables often require targeted stylistic modifications to emphasize particular elements, establish visual hierarchy, or simply improve readability. **gt** provides a comprehensive styling system built around the `tab_style()` function and its companion helper functions. This system offers precise control over text properties, background fills, and borders at any table location.

The styling approach in **gt** separates concerns into three components: *what* styles to apply (the `cell_*()` helpers), *where* to apply them (the `cells_*()` location helpers), and *how* to combine them (`tab_style()` itself). This separation provides both flexibility and clarity, allowing complex styling specifications to remain readable and maintainable.

### `tab_style()` and the `cell_*()` style helpers

The `tab_style()` function serves as the primary mechanism for applying custom styles to **gt** tables. It takes two main arguments: `style` (what styling to apply) and `locations` (where to apply it).

**Function Signature**

```r
tab_style(data, style, locations)
```

Three helper functions define the possible style modifications:

**`cell_text()` Signature**

```r
cell_text(
  color = NULL,
  font = NULL,
  size = NULL,
  align = NULL,
  v_align = NULL,
  style = NULL,
  weight = NULL,
  stretch = NULL,
  decorate = NULL,
  transform = NULL,
  whitespace = NULL,
  indent = NULL
)
```

**`cell_fill()` Signature**

```r
cell_fill(color = "#D3D3D3", alpha = NULL)
```

**`cell_borders()` Signature**

```r
cell_borders(
  sides = "all",
  color = "#000000",
  style = "solid",
  weight = px(1)
)
```

Let's explore these through progressively complex examples:

```{r}
exibble |>
  dplyr::select(num, char, currency) |>
  gt() |>
  fmt_number(columns = num, decimals = 2) |>
  fmt_currency(columns = currency) |>
  tab_style(
    style = cell_text(weight = "bold", color = "navy"),
    locations = cells_body(columns = num, rows = num > 1000)
  )
```

This simple example applies bold navy text to numeric values exceeding 1000. The `cells_body()` helper targets specific cells using column and row specifications. Rows can be specified by index, name, or logical expression.

Multiple style properties combine naturally within `cell_text()`:

```{r}
exibble |>
  dplyr::select(char, fctr, date) |>
  gt() |>
  tab_style(
    style = cell_text(
      size = px(14),
      style = "italic",
      transform = "uppercase"
    ),
    locations = cells_body(columns = char)
  )
```

Here we simultaneously modify font size, apply italics, and transform text to uppercase. The combination creates a distinct visual treatment for the character column.

When you need multiple style types (text, fill, borders), combine them in a list:

```{r}
sp500 |>
  dplyr::filter(date >= "2015-12-01" & date <= "2015-12-15") |>
  dplyr::select(date, open, close) |>
  gt() |>
  fmt_currency(columns = c(open, close)) |>
  tab_style(
    style = list(
      cell_fill(color = "#90EE90"),
      cell_text(weight = "bold")
    ),
    locations = cells_body(rows = close > open)
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "#FFB6C1"),
      cell_text(weight = "bold")
    ),
    locations = cells_body(rows = close < open)
  )
```

This stock market example highlights "up" days (close > open) in green and "down" days in pink. Each `tab_style()` call combines a fill color with bold text, and the row expression determines which rows receive each treatment.

The `cell_borders()` helper adds border styling:

```{r}
towny |>
  dplyr::filter(csd_type == "city") |>
  dplyr::select(name, population_2021, land_area_km2) |>
  dplyr::slice_max(population_2021, n = 5) |>
  gt() |>
  fmt_integer(columns = population_2021) |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  tab_style(
    style = cell_borders(
      sides = c("left", "right"),
      color = "steelblue",
      weight = px(3)
    ),
    locations = cells_body(columns = population_2021)
  )
```

Heavy left and right borders visually separate the population column, drawing attention to these key figures.

Location helpers extend beyond body cells to all table components:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp, mpg_c) |>
  dplyr::slice_head(n = 6) |>
  gt() |>
  tab_header(
    title = "Select Performance Vehicles",
    subtitle = "Horsepower and fuel economy comparison"
  ) |>
  tab_style(
    style = cell_fill(color = "black"),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_text(color = "white"),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_fill(color = "gray90"),
    locations = cells_column_labels()
  )
```

The dark title bar with light text creates strong visual hierarchy, while the subtle gray column labels establish a secondary level.

The complete set of location helpers includes:

- `cells_title()`: table title and subtitle
- `cells_stubhead()`: the stubhead cell
- `cells_column_spanners()`: column spanner labels
- `cells_column_labels()`: individual column labels
- `cells_row_groups()`: row group labels
- `cells_stub()`: stub (row label) cells
- `cells_body()`: main table body cells
- `cells_summary()`: group summary row cells
- `cells_grand_summary()`: grand summary row cells
- `cells_footnotes()`: footnote text
- `cells_source_notes()`: source note text

Each helper accepts arguments appropriate to its context and `cells_body()` takes `columns` and `rows`, while `cells_column_labels()` takes just `columns`.

### `tab_style_body()`

The `tab_style_body()` function provides a specialized interface for styling body cells based on their values. While `tab_style()` requires explicit location specifications, `tab_style_body()` lets you target cells through value matching, pattern matching, or custom functions.

**Function Signature**

```r
tab_style_body(
  data,
  style,
  columns = everything(),
  rows = everything(),
  values = NULL,
  pattern = NULL,
  fn = NULL,
  targets = "cell",
  extents = "body"
)
```

Target specific values directly:

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_style_body(
    style = cell_fill(color = "orange"),
    values = c(49.95, 33.33)
  )
```

The `values` argument searches the entire table body for exact matches, styling any cell containing those precise values. This is particularly useful when highlighting specific reference values or flagging particular codes.

For text pattern matching, use the `pattern` argument with regular expressions:

```{r}
exibble |>
  dplyr::select(char, fctr, row) |>
  gt() |>
  tab_style_body(
    style = cell_text(color = "darkgreen", weight = "bold"),
    pattern = "^a"
  )
```

Any cell content beginning with `"a"` receives the specified styling. Regular expressions provide powerful pattern-matching capabilities for text-based targeting.

The `fn` argument offers maximum flexibility through custom functions:

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_style_body(
    columns = where(is.numeric),
    style = cell_fill(color = "lightblue"),
    fn = function(x) !is.na(x) && x > 0 && x < 100
  )
```

The function receives each cell value and returns `TRUE` for cells that should be styled. Here, we highlight positive numeric values under `100`.

Styling `NA` values is a common use case:

```{r}
exibble |>
  gt() |>
  tab_style_body(
    style = cell_text(color = "red", style = "italic"),
    fn = function(x) is.na(x)
  ) |>
  sub_missing(missing_text = "Missing")
```

The `targets` argument extends styling beyond individual cells to entire rows or columns:

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_style_body(
    style = cell_fill(color = "lightyellow"),
    values = 49.95,
    targets = "row"
  )
```

When `targets = "row"`, finding the value `49.95` causes the entire row to be highlighted, not just that specific cell. This is invaluable for drawing attention to rows meeting specific criteria.

The `extents` argument controls whether row/column styling extends into the stub:

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_style_body(
    style = cell_fill(color = "lightblue"),
    values = 49.95,
    targets = "row",
    extents = c("body", "stub")
  )
```

Including `"stub"` in `extents` means the row label also receives the styling, creating visual continuity across the entire row.

### `opt_stylize()`

For quick, coordinated table styling without manually specifying colors and borders, `opt_stylize()` offers six pre-designed style themes in six color variations.

**Function Signature**

```r
opt_stylize(data, style = 1, color = "blue", add_row_striping = TRUE)
```

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  summary_rows(
    groups = "grp_a",
    columns = c(num, currency),
    fns = c("min", "max")
  ) |>
  tab_header(
    title = "Example Table with opt_stylize()",
    subtitle = "Using style 1 with blue color theme"
  ) |>
  opt_stylize(style = 1, color = "blue")
```

Style `1` with blue coloring provides a clean, professional appearance with subtle header coloring and alternating row stripes.

Let's compare several style variations:

```{r}
exibble |>
  dplyr::select(num, char, currency, date) |>
  gt() |>
  tab_header(title = "Style 3, Pink") |>
  opt_stylize(style = 3, color = "pink")
```

```{r}
exibble |>
  dplyr::select(num, char, currency, date) |>
  gt() |>
  tab_header(title = "Style 6, Cyan") |>
  opt_stylize(style = 6, color = "cyan")
```

The six styles progress from subtle (style `1`) to more visually prominent (style `6`), with increasing color application to headers, row groups, and summary rows. Available colors are: `"blue"`, `"cyan"`, `"pink"`, `"green"`, `"red"`, and `"gray"`.

The `add_row_striping` argument controls whether alternating row colors appear:

```{r}
towny |>
  dplyr::select(name, population_2021, density_2021) |>
  dplyr::slice_max(population_2021, n = 8) |>
  gt() |>
  fmt_integer() |>
  opt_stylize(style = 4, color = "green", add_row_striping = FALSE)
```

Disabling row striping produces a cleaner look for smaller tables where the striping may seem excessive.

## A smorgasbord of table options to choose from

While the styling functions we've examined so far provide targeted control over specific elements, **gt** also offers comprehensive global configuration through `tab_options()`. This function exposes dozens of parameters governing every aspect of table appearance (from fonts and colors to borders, padding, and even output-format-specific settings).

The scope of `tab_options()` can feel overwhelming at first, but the parameters follow a consistent naming convention: `component.property.subproperty`. Understanding this structure makes the function navigable and reveals the systematic nature of **gt**'s design. Additionally, several `opt_*()` convenience functions provide shortcuts for commonly used option combinations.

### `tab_options()`

The `tab_options()` function modifies the global settings of a **gt** table. Its parameter list is extensive, covering table dimensions, fonts, colors, borders, and padding for every table component.

**Function Signature (Selected Parameters)**

```r
tab_options(
  data,
  # Table-level settings
  table.width = NULL,
  table.layout = NULL,
  table.align = NULL,
  table.background.color = NULL,
  table.font.names = NULL,
  table.font.size = NULL,
  table.font.color = NULL,
  table.border.top.style = NULL,
  table.border.top.width = NULL,
  table.border.top.color = NULL,
  
  # Heading settings  
  heading.background.color = NULL,
  heading.align = NULL,
  heading.title.font.size = NULL,
  heading.padding = NULL,
  
  # Column labels settings
  column_labels.background.color = NULL,
  column_labels.font.size = NULL,
  column_labels.font.weight = NULL,
  column_labels.border.top.style = NULL,
  column_labels.border.bottom.style = NULL,
  
  # Row group settings
  row_group.background.color = NULL,
  row_group.font.weight = NULL,
  row_group.padding = NULL,
  
  # Table body settings
  table_body.hlines.style = NULL,
  table_body.hlines.color = NULL,
  table_body.vlines.style = NULL,
  data_row.padding = NULL,
  
  # Stub settings
  stub.background.color = NULL,
  stub.font.weight = NULL,
  stub.border.style = NULL,
  
  # Summary row settings
  summary_row.background.color = NULL,
  grand_summary_row.background.color = NULL,
  
  # Footer settings
  footnotes.font.size = NULL,
  footnotes.padding = NULL,
  source_notes.font.size = NULL,
  
  # Row striping
  row.striping.background_color = NULL,
  row.striping.include_table_body = NULL,
  
  # Container settings (HTML)
  container.width = NULL,
  container.height = NULL,
  
  # And many more...
)
```

Let's begin with foundational table-level options:

```{r}
exibble |>
  dplyr::select(num, char, currency, date) |>
  gt() |>
  tab_header(
    title = "Customized Table Appearance",
    subtitle = "Demonstrating table-level options"
  ) |>
  tab_options(
    table.width = pct(100),
    table.background.color = "ivory",
    table.font.size = px(14),
    table.border.top.style = "solid",
    table.border.top.width = px(3),
    table.border.top.color = "darkblue"
  )
```

This example sets the table to full width, applies an ivory background, establishes a base font size, and adds a prominent top border. The `px()` and `pct()` helper functions ensure proper unit specification.

Heading and column label options control the table's top regions:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp, mpg_c) |>
  dplyr::slice_head(n = 8) |>
  gt() |>
  tab_header(
    title = "High-Performance Vehicles",
    subtitle = "Selected specifications"
  ) |>
  tab_options(
    heading.background.color = "steelblue",
    heading.title.font.size = px(20),
    heading.subtitle.font.size = px(14),
    heading.padding = px(10),
    column_labels.background.color = "lightsteelblue",
    column_labels.font.weight = "bold",
    column_labels.padding = px(8)
  )
```

The coordinated blues in the heading and column labels create a cohesive header region. Note how padding adjustments affect the visual weight of these areas.

Body and stub settings control the main data presentation:

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_options(
    table_body.hlines.color = "gray90",
    row_group.background.color = "gray95",
    row_group.font.weight = "bold",
    stub.background.color = "gray98",
    stub.font.weight = "bold",
    data_row.padding = px(4)
  )
```

This configuration emphasizes row group labels and the stub while lightening the horizontal lines between rows. The reduced padding (`data_row.padding = px(4)`) creates a much more compact presentation.

For LaTeX output, specific options (`latex.*`) control document integration:

```r
# LaTeX-specific options (not evaluated)
gt_table |>
  tab_options(
    latex.use_longtable = TRUE,
    latex.header_repeat = TRUE,
    latex.tbl.pos = "h"
  )
```

These settings enable multi-page tables with repeating headers and control float positioning.

### `opt_table_font()`

The `opt_table_font()` function provides a streamlined way to set fonts across the entire table, including support for Google Fonts and system font stacks.

**Function Signature**

```r
opt_table_font(
  data,
  font = NULL,
  stack = NULL,
  size = NULL,
  weight = NULL,
  style = NULL,
  color = NULL,
  add = TRUE
)
```

Using a Google Font:

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-01") |>
  dplyr::slice_head(n = 8) |>
  dplyr::select(date, open, high, low, close) |>
  gt() |>
  fmt_currency(columns = c(open, high, low, close)) |>
  opt_table_font(
    font = list(
      google_font(name = "IBM Plex Sans"),
      "Helvetica", "Arial", "sans-serif"
    )
  )
```

The font specification includes fallbacks: if IBM Plex Sans isn't available, the system tries Helvetica, then Arial, then any sans-serif font. This ensures reasonable rendering across different environments.

System font stacks provide reliable cross-platform typography without external dependencies:

```{r}
exibble |>
  dplyr::select(num, char, currency) |>
  gt() |>
  opt_table_font(stack = "rounded-sans")
```

The available stacks include: `"system-ui"`, `"transitional"`, `"old-style"`, `"humanist"`, `"geometric-humanist"`, `"classical-humanist"`, `"neo-grotesque"`, `"monospace-slab-serif"`, `"monospace-code"`, `"industrial"`, `"rounded-sans"`, `"slab-serif"`, `"antique"`, `"didone"`, and `"handwritten"`. Each stack contains multiple font families that share similar characteristics and are likely available on most systems.

Combining font with other properties:

```{r}
gtcars |>
  dplyr::select(mfr, model, hp, mpg_c) |>
  dplyr::slice_head(n = 6) |>
  gt() |>
  opt_table_font(
    stack = "monospace-code",
    size = px(13),
    weight = "normal",
    color = "gray30"
  )
```

The monospace stack with specified size, weight, and color creates a technical, code-like appearance appropriate for certain data types.

### `opt_horizontal_padding()` and `opt_vertical_padding()`

These functions provide quick control over table density by scaling all padding values proportionally.

**Function Signatures**

```r
opt_horizontal_padding(data, scale = 1)
opt_vertical_padding(data, scale = 1)
```

The `scale` parameter accepts values from `0` to `3`, where `1` is the default. Values below `1` compress the table while values above `1` expand it.

Creating a compact table:

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_header(title = "Compact Table") |>
  opt_vertical_padding(scale = 0.3) |>
  opt_horizontal_padding(scale = 0.5)
```

With both padding dimensions reduced, the table becomes notably denser. This is useful when space is constrained or when displaying many rows where normal padding would create excessive scrolling.

Creating a spacious table:

```{r}
exibble |>
  dplyr::select(num, char, date) |>
  dplyr::slice_head(n = 4) |>
  gt() |>
  tab_header(title = "Spacious Table") |>
  opt_vertical_padding(scale = 2) |>
  opt_horizontal_padding(scale = 2.5)
```

Generous padding improves readability for smaller tables and can make data appear more prestigious or important. The added whitespace gives each value room to breathe.

These functions affect padding at all table locations (heading, column labels, body rows, summary rows, and footer sections) ensuring proportional scaling throughout.

### `opt_row_striping()`

Alternating row colors (zebra striping) help readers track across wide tables. The `opt_row_striping()` function toggles this feature.

**Function Signature**

```r
opt_row_striping(data, row_striping = TRUE)
```

```{r}
towny |>
  dplyr::select(name, census_div, population_2021, density_2021) |>
  dplyr::slice_max(population_2021, n = 12) |>
  gt() |>
  fmt_integer(columns = c(population_2021, density_2021)) |>
  opt_row_striping()
```

The subtle gray stripes make it easier to follow each row from name to density, particularly valuable as tables grow wider.

The stripe color can be customized via `tab_options()`:

```{r}
towny |>
  dplyr::select(name, population_2021, land_area_km2) |>
  dplyr::slice_max(population_2021, n = 10) |>
  gt() |>
  fmt_integer(columns = population_2021) |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  opt_row_striping() |>
  tab_options(
    row.striping.background_color = "#E8F4F8",
    row.striping.include_stub = TRUE
  )
```

The light blue striping with stub inclusion creates a cohesive visual treatment across the entire row.

### `opt_all_caps()`

Small-caps and all-caps text can create visual hierarchy and a more formal appearance. The `opt_all_caps()` function applies uppercase transformation to labels.

**Function Signature**

```r
opt_all_caps(
  data,
  all_caps = TRUE,
  locations = c("column_labels", "stub", "row_group")
)
```

```{r}
exibble |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_header(
    title = "Example with All-Caps Labels",
    subtitle = "Column labels, stub, and row groups transformed"
  ) |>
  opt_all_caps()
```

The transformation affects column labels, stub entries, and row group labels by default. The function also reduces font size slightly and increases weight, creating a balanced small-caps appearance.

Selective application:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp) |>
  dplyr::slice_head(n = 6) |>
  gt() |>
  opt_all_caps(locations = "column_labels")
```

Restricting the transformation to column labels only leaves other text unchanged, useful when row group labels or stub entries contain proper nouns or abbreviations that shouldn't be modified.

## Making interactive HTML tables

Static tables serve most publishing needs, but interactive tables offer compelling advantages for web-based reports and dashboards. Users can paginate through large datasets, sort columns to explore rankings, filter rows to find specific entries, and search globally for particular values. These capabilities transform a table from a static display into an exploratory tool.

**gt** provides interactive table functionality through `opt_interactive()`, which activates a suite of controls built on the reactable package. This integration maintains all **gt** formatting and styling while adding dynamic features appropriate for HTML output.

### `opt_interactive()`

The `opt_interactive()` function transforms a standard HTML table into an interactive one with pagination, sorting, filtering, and search capabilities.

**Function Signature**

```r
opt_interactive(
  data,
  active = TRUE,
  use_pagination = TRUE,
  use_pagination_info = TRUE,
  use_sorting = TRUE,
  use_search = FALSE,
  use_filters = FALSE,
  use_resizers = FALSE,
  use_highlight = FALSE,
  use_compact_mode = FALSE,
  use_text_wrapping = TRUE,
  use_page_size_select = FALSE,
  page_size_default = 10,
  page_size_values = c(10, 25, 50, 100),
  pagination_type = c("numbers", "jump", "simple"),
  height = "auto",
  selection_mode = NULL
)
```

A basic interactive table:
 
```{r}
towny |>
  dplyr::select(name, census_div, population_2021, density_2021) |>
  gt() |>
  fmt_integer(columns = c(population_2021, density_2021)) |>
  tab_header(
    title = "Ontario Municipalities",
    subtitle = "Population and density data (2021)"
  ) |>
  opt_interactive()
```

The default configuration enables pagination (showing 10 rows per page) and column sorting. Users click column headers to sort ascending or descending. Navigation controls below the table allow moving between pages.

Enabling search and filtering:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp, mpg_c, msrp) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  tab_header(title = "Performance Vehicles Database") |>
  opt_interactive(
    use_search = TRUE,
    use_filters = TRUE,
    use_highlight = TRUE
  )
```

With `use_search = TRUE`, a global search box appears above the table. Users can type any text to filter rows to matching entries. The `use_filters = TRUE` option adds individual filter inputs below each column header, enabling column-specific filtering. The `use_highlight = TRUE` option highlights rows on hover, improving visual tracking.

Customizing pagination:

```{r}
countrypops |>
  dplyr::filter(year >= 2010) |>
  dplyr::select(country_name, year, population) |>
  gt() |>
  fmt_integer(columns = population) |>
  opt_interactive(
    use_pagination = TRUE,
    use_page_size_select = TRUE,
    page_size_default = 25,
    page_size_values = c(10, 25, 50, 100, 200),
    pagination_type = "jump"
  )
```

This configuration starts with 25 rows per page and offers a dropdown for changing page size. The `"jump"` pagination type provides a page number input field instead of individual page buttons, useful for datasets with many pages.

Compact mode and column resizing:

```{r}
pizzaplace |>
  dplyr::select(id, date, time, name, size, price) |>
  dplyr::slice_head(n = 100) |>
  gt() |>
  fmt_currency(columns = price) |>
  opt_interactive(
    use_compact_mode = TRUE,
    use_resizers = TRUE,
    page_size_default = 15
  )
```

Compact mode reduces vertical padding throughout the table, fitting more rows on screen. Column resizers allow users to drag column boundaries to adjust widths, accommodating different content lengths or display preferences.

Interactive tables maintain **gt** styling:

```{r}
sp500 |>
  dplyr::select(date, open, high, low, close, volume) |>
  gt() |>
  fmt_currency(columns = c(open, high, low, close)) |>
  fmt_integer(columns = volume) |>
  data_color(
    columns = volume,
    palette = "Blues"
  ) |>
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels()
  ) |>
  opt_interactive(
    use_search = TRUE,
    use_sorting = TRUE,
    use_highlight = TRUE
  )
```

Formatting from `fmt_*()` functions, colors from `data_color()`, and styles from `tab_style()` all persist in the interactive version. This allows you to build a fully-styled table and then add interactivity as a final step.

For Shiny applications, the `selection_mode` argument enables row selection:

```r
# Shiny context (not evaluated)
output$my_table <- render_gt({
  my_data |>
    gt() |>
    opt_interactive(
      selection_mode = "multiple"
    )
})
```

With `selection_mode = "single"` or `"multiple"`, users can click rows to select them, and the selection state becomes available to Shiny's reactive system.

A note on limitations: interactive tables are HTML-only features. When rendering to PDF, RTF, Word, or other formats, `opt_interactive()` has no effect and tables render in their static form. Plan accordingly when creating documents destined for multiple output formats.

The combination of **gt**'s sophisticated formatting capabilities with interactive exploration creates tables that serve both presentation and analysis purposes. Readers can appreciate the careful styling while still drilling into the data to answer their own questions: a powerful synthesis for modern data communication.

## Summary

This chapter has explored the extensive styling and customization options that can transform functional tables into visually-compelling presentations. From data-driven colorization to precise typographic control, **gt** provides the tools to achieve virtually any aesthetic goal.

The key capabilities we've covered:

- data-driven coloring: `data_color()` maps values to colors using palettes, gradients, or custom scales. This visual encoding helps readers identify patterns, outliers, and relationships at a glance.
- precision styling: `tab_style()` applies CSS-like styling to any table location using the `cells_*()` helper functions. Combined with `cell_text()`, `cell_fill()`, and `cell_borders()`, you have complete control over typography, backgrounds, and borders.
- global options: `tab_options()` provides access to dozens of table-wide settings, from font families to padding to border styles. These options establish consistent defaults that individual styles can override.
- convenience functions: The `opt_*()` family offers quick access to common configurations: `opt_stylize()` for preset themes, `opt_row_striping()` for zebra stripes, `opt_table_font()` for typography, and many more.
- interactive tables: `opt_interactive()` transforms static tables into explorable interfaces with sorting, filtering, searching, and pagination (all while preserving your formatting and styling choices).

Effective table styling serves communication, not decoration. Color should highlight meaningful distinctions. Typography should establish hierarchy. Borders should delineate structure. The best-styled tables are those where readers don't notice the styling much at all, they simply find the information they need with minimal effort.

The next chapter covers footnotes and source notes, which add supplementary information to your tables without cluttering the main presentation. You'll learn to attach explanatory notes to specific cells, define footnote marks, and create properly formatted citations.


---


# Footnotes and source notes {#sec-footnotes-source-notes}


Tables often need to convey more than what fits neatly in rows and columns. A value might require clarification. A column heading might benefit from a definition. The data source might need acknowledgment. Footnotes and source notes address these needs, providing a structured way to add supplementary information without cluttering the main table body.

In **gt**, the footer section accommodates two types of annotations: footnotes (linked to specific table locations via marks) and source notes (general citations or commentary). This chapter explores how to add both, how to target specific table locations for footnote attachment, and how to customize the appearance of footnote marks and the footer layout.

## The footer section

The footer sits beneath the table body and serves as the home for supplementary text. It's divided conceptually into two areas: footnotes appear first, followed by source notes. Both are optional as a table might have neither, one, or both.

Footnotes connect to specific content through marks (typically numbers, letters, or symbols). A reader sees the mark in the table, then finds the corresponding explanation in the footer. Source notes, by contrast, stand alone without marks; they provide general context such as data provenance.

## Adding footnotes

### `tab_footnote()` and the `cells_*()` location helpers

The `tab_footnote()` function can make it a painless process to add a footnote to a **gt** table. There are commonly two components to a footnote: (1) a footnote mark that is attached to the targeted cell content, and (2) the footnote text itself that is placed in the table's footer area. Each unit of footnote text in the footer is linked to an element of text or otherwise through the footnote mark. The footnote system in **gt** presents footnotes in a way that matches the usual expectations, where:

1. footnote marks have a sequence, whether they are symbols, numbers, or letters

2. multiple footnotes can be applied to the same content (and marks are always presented in an ordered fashion)

3. footnote text in the footer is never exactly repeated, **gt** reuses footnote marks where needed throughout the table

4. footnote marks are ordered across the table in a consistent manner (left to right, top to bottom)

```r
tab_footnote(
  data,
  footnote,
  locations = NULL,
  placement = c("auto", "right", "left")
)
```

<hr>

**`footnote`**: *Footnote text*

`scalar<character>` // **required**

The text to be used in the footnote. We can optionally use the `md()` and `html()` functions to style the text as Markdown or to retain HTML elements in the footnote text.

<hr>

**`locations`**: *Locations to target*

`<locations expressions>` // default: `NULL`, so *optional*

The cell or set of cells to be associated with the footnote. Supplying any of the `cells_*()` helper functions is a useful way to target the location cells that are associated with the footnote text. Additionally, we can enclose several `cells_*()` calls within a `list()` if we wish to link the footnote text to different types of locations (e.g., body cells, row group labels, the table title, etc.).

<hr>

**`placement`**: *Placement of footnote mark*

`singl-kw:[auto|right|left]` // default: `"auto"`

Where to affix footnote marks to the table content. Two options for this are `"left"` or `"right"`, where the placement is either to the absolute left or right of the cell content. By default, however, this option is set to `"auto"` whereby **gt** will choose a preferred left-or-right placement depending on the alignment of the cell content.

<hr>

Using a subset of the `sza` dataset, let's create a new **gt** table. The `sza` column will get all of its cells filled with a background color according to data values (this is done with `data_color()`) and then the use of `tab_footnote()` lets us add a footnote to the `sza` column label (explaining what the color gradient signifies).

```{r}
sza |>
  dplyr::filter(
    latitude == 20 &
      month == "jan" &
      !is.na(sza)
  ) |>
  dplyr::select(-latitude, -month) |>
  gt() |>
  data_color(
    columns = sza,
    palette = c("white", "yellow", "navyblue"),
    domain = c(0, 90)
  ) |>
  tab_footnote(
    footnote = "Color indicates the solar zenith angle.",
    locations = cells_column_labels(columns = sza)
  )
```

Of course, we can add more than one footnote to the table, but, we have to use several calls of `tab_footnote()`. This variation of the `sza` table has three footnotes: one on the `"TST"` column label and two on the `"SZA"` column label (these were capitalized with `opt_all_caps()`). We have three calls of `tab_footnote()` and while the order of calls usually doesn't matter, it does have a subtle effect here since two footnotes are associated with the same text content (try reversing the second and third calls and observe the effect in the footer).

```{r}
sza |>
  dplyr::filter(
    latitude == 20 &
      month == "jan" &
      !is.na(sza)
  ) |>
  dplyr::select(-latitude, -month) |>
  gt() |>
  opt_all_caps() |>
  cols_align(align = "center") |>
  cols_width(everything() ~ px(200)) |>
  tab_footnote(
    footnote = md("TST stands for *True Solar Time*."),
    locations = cells_column_labels(columns = tst)
  ) |>
  tab_footnote(
    footnote = md("SZA stands for *Solar Zenith Angle*."),
    locations = cells_column_labels(columns = sza)
  ) |>
  tab_footnote(
    footnote = "Higher Values indicate sun closer to horizon.",
    locations = cells_column_labels(columns = sza)
  ) |>
  tab_options(footnotes.multiline = FALSE)
```

Text in the footer (both from footnotes and also from source notes) tends to widen the table and all the columns within in. We can limit that setting column widths, which is what was done above with `cols_width()`. There can also be a correspondingly large amount of vertical space taken up by the footer since footnotes will, by default, each start on a new line. In the above example, we used `tab_options(footnotes.multiline = FALSE)` to make it so that all footer text is contained in a single block of text.

Let's move on to another footnote-laden table, this one based on the `towny` dataset. We have a header part, with a title and a subtitle. We can choose which of these could be associated with a footnote and in this case it is the `"subtitle"` (one of two options in the `cells_title()` helper function). This table has a stub with row labels and some of those labels are associated with a footnote. So long as row labels are unique, they can be easily used as row identifiers in `cells_stub()`. The third footnote is placed on the `"Density"` column label. Here, changing the order of the `tab_footnote()` calls has no effect on the final table rendering.

```{r}
towny |>
  dplyr::filter(csd_type == "city") |>
  dplyr::arrange(desc(population_2021)) |>
  dplyr::select(name, density_2021, population_2021) |>
  dplyr::slice_head(n = 10) |>
  gt(rowname_col = "name") |>
  tab_header(
    title = md("The 10 Largest Municipalities in `towny`"),
    subtitle = "Population values taken from the 2021 census."
  ) |>
  fmt_integer() |>
  cols_label(
    density_2021 = "Density",
    population_2021 = "Population"
  ) |>
  tab_footnote(
    footnote = "Part of the Greater Toronto Area.",
    locations = cells_stub(rows = c(
      "Toronto", "Mississauga", "Brampton", "Markham", "Vaughan"
    ))
  ) |>
  tab_footnote(
    footnote = md("Density is in terms of persons per km^2^."),
    locations = cells_column_labels(columns = density_2021)
  ) |>
  tab_footnote(
    footnote = "Census results made public on February 9, 2022.",
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_source_note(source_note = md(
    "Data taken from the `towny` dataset (in the **gt** package)."
  )) |>
  opt_footnote_marks(marks = "letters")
```

In the above table, we elected to change the footnote marks to letters instead of the default numbers (done through `opt_footnote_marks()`). A source note was also added; this was mainly to demonstrate that source notes will be positioned beneath footnotes in the footer section.

For our final example, let's make a relatively small table deriving from the `sp500` dataset. The set of `tab_footnote()` calls used here (four of them) have minor variations that allow for interesting expressions of footnotes. Two of the footnotes target values in the body of the table (using the `cells_body()` helper function to achieve this). On numeric values that right-aligned, **gt** will opt to place the footnote on the left of the content so as to not disrupt the alignment. However, the `placement` argument can be used to force the positioning of the footnote mark after the content.

We can also opt to include footnotes that have no associated footnote marks whatsoever. This is done by not providing anything to `locations`. These 'markless' footnotes will precede the other footnotes in the footer section.

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-05" & date <="2015-01-10") |>
  dplyr::select(-c(adj_close, volume, high, low)) |>
  dplyr::mutate(change = close - open) |>
  dplyr::arrange(date) |>
  gt() |>
  tab_header(title = "S&P 500") |>
  fmt_date(date_style = "m_day_year") |>
  fmt_currency() |>
  cols_width(everything() ~ px(150)) |>
  tab_footnote(
    footnote = "More red days than green in this period.",
    locations = cells_column_labels(columns = change)
  ) |>
  tab_footnote(
    footnote = "Lowest opening value.",
    locations = cells_body(columns = open, rows = 3),
  ) |>
  tab_footnote(
    footnote = "Devastating losses on this day.",
    locations = cells_body(columns = change, rows = 1),
    placement = "right"
  ) |>
  tab_footnote(footnote = "All values in USD.") |>
  opt_footnote_marks(marks = "LETTERS") |>
  opt_footnote_spec(spec_ref = "i[x]", spec_ftr = "x.")
```

Aside from changing the footnote marks to be `"LETTERS"`, we've also changed the way the marks are formatted. In `opt_footnote_spec()` the `spec_ref` option, governing the footnote marks across the table, describes marks that are italicized and set between square brackets (`"i[x]"`). The `spec_ftr` argument is for the footer representation of the footnote marks and as described in the call with `"x."`, it'll be the mark followed by a period.

## Location helpers for footnotes

The power of `tab_footnote()` lies in its ability to target virtually any part of the table. The `locations` argument accepts various `cells_*()` helper functions, each designed to select specific table regions.

### Targeting column labels with `cells_column_labels()`

Column labels are common footnote targets and they often benefit from definitions or clarifications:

```{r}
gtcars |>
  dplyr::select(mfr, model, hp, mpg_c, mpg_h) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  cols_label(
    mfr = "Manufacturer",
    model = "Model",
    hp = "Horsepower",
    mpg_c = "City MPG",
    mpg_h = "Highway MPG"
  ) |>
  tab_footnote(
    footnote = "Miles per gallon in city driving conditions.",
    locations = cells_column_labels(columns = mpg_c)
  ) |>
  tab_footnote(
    footnote = "Miles per gallon on highway.",
    locations = cells_column_labels(columns = mpg_h)
  )
```

Each column label receives its own footnote mark, and the footer displays both explanations. The `columns` argument in `cells_column_labels()` accepts column names, indices, or tidyselect helpers.

### Targeting multiple columns at once

When several columns share a common characteristic, you can attach one footnote to all of them:
 
```{r}
gtcars |>
  dplyr::select(mfr, model, mpg_c, mpg_h) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  cols_label(
    mfr = "Manufacturer",
    model = "Model",
    mpg_c = "City",
    mpg_h = "Highway"
  ) |>
  tab_spanner(
    label = "Fuel Economy (MPG)",
    columns = starts_with("mpg")
  ) |>
  tab_footnote(
    footnote = "EPA estimated values.",
    locations = cells_column_labels(columns = c(mpg_c, mpg_h))
  )
```

Both "City" and "Highway" column labels receive the same footnote mark, and only one entry appears in the footer. This demonstrates **gt**'s intelligent handling of duplicate footnotes.

### Targeting body cells with `cells_body()`

Footnotes can attach to specific data values when individual cells need explanation:

```{r}
exibble |>
  dplyr::select(row, num, currency) |>
  gt(rowname_col = "row") |>
  fmt_number(columns = num, decimals = 2) |>
  fmt_currency(columns = currency) |>
  tab_footnote(
    footnote = "Highest value in dataset.",
    locations = cells_body(columns = num, rows = num == max(num, na.rm = TRUE))
  ) |>
  tab_footnote(
    footnote = "Missing data point.",
    locations = cells_body(columns = num, rows = is.na(num))
  )
```

The `rows` argument accepts logical conditions, row numbers, or row names. Here, we identify cells programmatically: one by value comparison, another by detecting missingness.

### Targeting stub cells with `cells_stub()`

When rows have labels (a stub column), those labels can receive footnotes:

```{r}
pizzaplace |>
  dplyr::count(type, name = "orders") |>
  dplyr::arrange(desc(orders)) |>
  gt(rowname_col = "type") |>
  fmt_integer(columns = orders) |>
  tab_header(title = "Pizza Orders by Type") |>
  tab_footnote(
    footnote = "Traditional Italian-American style.",
    locations = cells_stub(rows = "classic")
  ) |>
  tab_footnote(
    footnote = "Specialty recipes with premium toppings.",
    locations = cells_stub(rows = "supreme")
  )
```

Row labels in the stub serve as identifiers, so you can reference them directly by name.

### Targeting row group labels with `cells_row_groups()`

When tables have grouped rows, the group labels can also receive footnotes:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp) |>
  dplyr::filter(mfr %in% c("Ferrari", "Lamborghini", "Maserati")) |>
  gt(rowname_col = "model", groupname_col = "mfr") |>
  tab_footnote(
    footnote = "Part of the Fiat Chrysler Automobiles group.",
    locations = cells_row_groups(groups = c("Ferrari", "Maserati"))
  )
```

Multiple row groups can share the same footnote when they have something in common.

### Targeting titles with `cells_title()`

The header section, containing a title and a subtitle, can also host footnotes:

```{r}
countrypops |>
  dplyr::filter(
    country_name %in% c("United States", "China", "India"),
    year == 2022
  ) |>
  dplyr::select(country_name, population) |>
  gt(rowname_col = "country_name") |>
  fmt_number(columns = population, suffixing = TRUE) |>
  tab_header(
    title = "World's Most Populous Countries",
    subtitle = "Population estimates for 2022"
  ) |>
  tab_footnote(
    footnote = "Based on UN World Population Prospects.",
    locations = cells_title(groups = "subtitle")
  )
```
 
The `groups` argument specifies whether to target `"title"` or `"subtitle"`.

### Targeting column spanners with `cells_column_spanners()`

Column spanners, labels that span multiple columns, can receive footnotes too:

```{r}
illness |>
  dplyr::slice_head(n = 5) |>
  dplyr::select(test, units, day_3, day_4, day_5) |>
  gt(rowname_col = "test") |>
  tab_spanner(
    label = "Mid-Week Measurements",
    columns = starts_with("day")
  ) |>
  cols_label(
    units = "Units",
    day_3 = "Day 3",
    day_4 = "Day 4", 
    day_5 = "Day 5"
  ) |>
  tab_footnote(
    footnote = "Values collected between 8-10am daily.",
    locations = cells_column_spanners(spanners = "Mid-Week Measurements")
  )
```

The `spanners` argument takes the spanner label text.

### Targeting the stubhead with `cells_stubhead()`

If your table has both a stub and a stubhead label, that label can receive footnotes:

```{r}
towny |>
  dplyr::select(name, population_2021, density_2021) |>
  dplyr::slice_max(population_2021, n = 5) |>
  gt(rowname_col = "name") |>
  tab_stubhead(label = "Municipality") |>
  fmt_integer() |>
  cols_label(
    population_2021 = "Population",
    density_2021 = "Density"
  ) |>
  tab_footnote(
    footnote = "Census subdivisions classified as cities or towns.",
    locations = cells_stubhead()
  )
```

The `cells_stubhead()` helper takes no arguments as there's only one stubhead per table.

### Targeting summary rows

Summary rows (created with `summary_rows()` or `grand_summary_rows()`) can receive footnotes using `cells_summary()`, `cells_grand_summary()`, `cells_stub_summary()`, or `cells_stub_grand_summary()`:

```{r}
pizzaplace |>
  dplyr::filter(date <= "2015-01-07") |>
  dplyr::summarize(
    revenue = sum(price),
    orders = dplyr::n(),
    .by = date
  ) |>
  gt(rowname_col = "date") |>
  fmt_date(columns = stub(), date_style = "yMMMd") |>
  fmt_currency(columns = revenue) |>
  fmt_integer(columns = orders) |>
  grand_summary_rows(
    fns = list(
      Total ~ sum(.),
      Average ~ mean(.)
    ),
    fmt = ~ fmt_number(., decimals = 0, use_seps = TRUE)
  ) |>
  tab_footnote(
    footnote = "Simple arithmetic mean across days.",
    locations = cells_grand_summary(columns = revenue, rows = "Average")
  )
```

### Combining multiple locations

A single footnote can attach to multiple locations by wrapping `cells_*()` calls in a list:

```{r}
exibble |>
  dplyr::select(row, num, currency, group) |>
  gt(rowname_col = "row", groupname_col = "group") |>
  fmt_number(columns = num, decimals = 1) |>
  fmt_currency(columns = currency) |>
  tab_footnote(
    footnote = "Numeric measurements in consistent units.",
    locations = list(
      cells_column_labels(columns = num),
      cells_column_labels(columns = currency)
    )
  )
```

Both column labels receive the same footnote mark, consolidating related information.

## Unmarked footnotes

Sometimes you want footer text without a corresponding mark in the table. Omitting the `locations` argument creates an unmarked footnote:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, msrp) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  cols_label(
    mfr = "Make",
    model = "Model",
    year = "Year",
    msrp = "MSRP"
  ) |>
  tab_footnote(footnote = "All prices in US dollars.") |>
  tab_footnote(footnote = "Data current as of 2016.")
```

Unmarked footnotes appear in the footer without any superscript reference. They're useful for general notes that apply to the entire table.

## Footnote mark placement

The `placement` argument controls where the footnote mark appears relative to cell content:

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-05" & date <= "2015-01-09") |>
  dplyr::select(date, open, close) |>
  dplyr::mutate(change = close - open) |>
  gt() |>
  fmt_date(columns = date, date_style = "yMMMd") |>
  fmt_currency(columns = c(open, close, change)) |>
  tab_footnote(
    footnote = "Largest daily loss.",
    locations = cells_body(columns = change, rows = 1),
    placement = "right"
  ) |>
  tab_footnote(
    footnote = "Smallest opening price.",
    locations = cells_body(columns = open, rows = 3),
    placement = "left"
  )
```

By default (`placement = "auto"`), **gt** places marks on the left for right-aligned content (to preserve numeric alignment) and on the right for left-aligned content. You can override this with explicit `"left"` or `"right"` values.

## Source notes with `tab_source_note()`

Source notes provide citations or general commentary without linking to specific table locations. They appear beneath any footnotes in the footer.

**Function Signature**

```r
tab_source_note(
  data,
  source_note
)
```

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp, msrp) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  cols_label(
    mfr = "Make",
    model = "Model", 
    year = "Year",
    hp = "HP",
    msrp = "Price"
  ) |>
  tab_source_note(
    source_note = "Data from edmunds.com, collected in 2016."
  )
```

Source notes support markdown and HTML formatting:

```{r}
countrypops |>
  dplyr::filter(country_name == "United States", year >= 2018) |>
  dplyr::select(year, population) |>
  gt() |>
  fmt_number(columns = population, suffixing = TRUE) |>
  tab_header(title = "US Population Growth") |>
  tab_source_note(
    source_note = md("Source: *UN World Population Prospects* (2022 revision)")
  ) |>
  tab_source_note(
    source_note = md("Available at [population.un.org](https://population.un.org)")
  )
```

Multiple `tab_source_note()` calls add additional source notes, appearing in the order they're called.

## Customizing footnote marks with `opt_footnote_marks()`

The default numeric footnote marks (1, 2, 3...) can be changed to letters, symbols, or custom sequences.

**Function Signature**

```r
opt_footnote_marks(
  data,
  marks = "numbers"
)
```

### Preset mark sequences

Several keywords provide common mark styles:

```{r}
sza |>
  dplyr::filter(latitude == 20, month == "jan", !is.na(sza)) |>
  dplyr::select(-latitude, -month) |>
  gt() |>
  tab_footnote(
    footnote = "True Solar Time in hours.",
    locations = cells_column_labels(columns = tst)
  ) |>
  tab_footnote(
    footnote = "Solar Zenith Angle in degrees.",
    locations = cells_column_labels(columns = sza)
  ) |>
  opt_footnote_marks(marks = "letters")
```

Available keywords:

- `"numbers"`: 1, 2, 3... (default)
- `"letters"`: a, b, c...
- `"LETTERS"`: A, B, C...
- `"standard"`: *, †, ‡, § (four traditional symbols)
- `"extended"`: *, †, ‡, §, ‖, ¶ (six symbols)

### Using standard symbols

Traditional academic publishing often uses symbols for footnotes:

```{r}
exibble |>
  dplyr::select(row, char, num) |>
  gt(rowname_col = "row") |>
  tab_footnote(
    footnote = "Character strings of varying length.",
    locations = cells_column_labels(columns = char)
  ) |>
  tab_footnote(
    footnote = "Numeric values with decimal precision.",
    locations = cells_column_labels(columns = num)
  ) |>
  tab_footnote(
    footnote = "Row identifiers for reference.",
    locations = cells_stubhead()
  ) |>
  tab_stubhead(label = "Row") |>
  opt_footnote_marks(marks = "standard")
```

When more footnotes exist than symbols, marks double (**, ††, etc.) then triple, and so on.

### Custom mark sequences

You can provide any character vector as custom marks:

```{r}
towny |>
  dplyr::select(name, population_2021, land_area_km2) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "name") |>
  fmt_integer(columns = population_2021) |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  cols_label(
    population_2021 = "Population",
    land_area_km2 = "Land Area"
  ) |>
  tab_footnote(
    footnote = "2021 Canadian Census.",
    locations = cells_column_labels(columns = population_2021)
  ) |>
  tab_footnote(
    footnote = "Square kilometers.",
    locations = cells_column_labels(columns = land_area_km2)
  ) |>
  opt_footnote_marks(marks = c("†", "‡"))
```

Unicode symbols, emoji, or any text can serve as custom marks.

## Formatting footnote marks with `opt_footnote_spec()`

Beyond choosing which marks to use, you can control how they're formatted (superscript, bold, italicized, or enclosed in brackets).

**Function Signature**

```r
opt_footnote_spec(
  data,
  spec_ref = NULL,  
  spec_ftr = NULL   
)
```

The specification string uses control characters:

- `^`: Superscript
- `b`: Bold
- `i`: Italic
- `(`, `)`: Parentheses
- `[`, `]`: Square brackets
- `.`: Period after mark
- `x`: Placeholder for the mark itself (optional)

### Customizing mark appearance

The specification string lets you combine multiple formatting options. For example, you might want marks in the table to be superscript and bold for visibility, while marks in the footer use a different style to fit the surrounding text.

```{r}
illness |>
  dplyr::slice_head(n = 5) |>
  dplyr::select(test, units, day_3, day_4) |>
  gt(rowname_col = "test") |>
  cols_label(
    units = "Units",
    day_3 = "Day 3",
    day_4 = "Day 4"
  ) |>
  fmt_units(columns = units) |>
  tab_footnote(
    footnote = "Standard international units.",
    locations = cells_column_labels(columns = units)
  ) |>
  tab_footnote(
    footnote = "Morning measurement.",
    locations = cells_column_labels(columns = day_3)
  ) |>
  opt_footnote_spec(
    spec_ref = "^bx",
    spec_ftr = "(x)"
  )
```

Here, marks in the table are superscript and bold (`^b`), while marks in the footer appear in parentheses (`(x)`).

### Academic-style footnotes

Academic journals often have specific requirements for footnote formatting. A common convention uses superscript italic letters in the table body with a period following each mark in the footer.

```{r}
sp500 |>
  dplyr::filter(date >= "2015-03-01" & date <= "2015-03-05") |>
  dplyr::select(date, open, high, low, close) |>
  gt() |>
  fmt_date(columns = date, date_style = "yMMMd") |>
  fmt_currency(columns = c(open, high, low, close)) |>
  tab_footnote(
    footnote = "New York Stock Exchange opening bell.",
    locations = cells_column_labels(columns = open)
  ) |>
  tab_footnote(
    footnote = "Intraday high.",
    locations = cells_column_labels(columns = high)
  ) |>
  opt_footnote_marks(marks = "letters") |>
  opt_footnote_spec(
    spec_ref = "^i",
    spec_ftr = "x."
  )
```

Superscript italicized letters in the table, with a trailing period in the footer, a common academic convention.

### Bracketed footnotes

Technical documentation and some scientific fields prefer bracketed numbers over superscripts. This style keeps marks at baseline level, which some readers find less disruptive to reading flow.

```{r}
pizzaplace |>
  dplyr::count(size, name = "orders") |>
  gt(rowname_col = "size") |>
  fmt_integer(columns = orders) |>
  tab_stubhead(label = "Size") |>
  tab_footnote(
    footnote = "S=Small, M=Medium, L=Large, XL=Extra Large, XXL=Double Extra Large",
    locations = cells_stubhead()
  ) |>
  tab_footnote(
    footnote = "Total orders for 2015.",
    locations = cells_column_labels(columns = orders)
  ) |>
  cols_label(orders = "Orders") |>
  opt_footnote_marks(marks = "numbers") |>
  opt_footnote_spec(
    spec_ref = "[x]",
    spec_ftr = "[x]"
  )
```

Bracketed numbers appear both in the table and footer (useful for technical documents).

## Controlling footnote order with `opt_footnote_order()`

When a table has both marked and unmarked footnotes, you can control their relative ordering in the footer.

**Function Signature**

```r
opt_footnote_order(
  data,
  order = "marks_last"
)
```

Keywords:

- `"marks_last"`: Unmarked footnotes appear first, marked footnotes follow (default)
- `"marks_first"`: Marked footnotes appear first, unmarked follow
- `"preserve_order"`: Footnotes appear in the order `tab_footnote()` was called

```{r}
gtcars |>
  dplyr::select(mfr, model, hp, mpg_c) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  cols_label(
    mfr = "Make",
    model = "Model",
    hp = "HP",
    mpg_c = "MPG"
  ) |>
  tab_footnote(footnote = "All specifications from manufacturer.") |>
  tab_footnote(
    footnote = "Brake horsepower.",
    locations = cells_column_labels(columns = hp)
  ) |>
  tab_footnote(footnote = "EPA city driving estimate.") |>
  tab_footnote(
    footnote = "City fuel economy.",
    locations = cells_column_labels(columns = mpg_c)
  ) |>
  opt_footnote_order(order = "marks_first")
```

With `"marks_first"`, the two marked footnotes (for HP and MPG) appear before the two unmarked footnotes.

## Styling the footer

The footer, comprising both footnotes and source notes, can be styled using `tab_style()` with the `cells_footnotes()` and `cells_source_notes()` location helpers.

### Styling footnotes

Footnote text can be styled to visually distinguish it from the main table content. Common choices include smaller font sizes, muted colors, or subtle background fills that signal the supplementary nature of the information.

```{r}
sza |>
  dplyr::filter(latitude == 20, month == "jan", !is.na(sza)) |>
  dplyr::select(-latitude, -month) |>
  dplyr::slice_head(n = 8) |>
  gt() |>
  data_color(
    columns = sza,
    palette = c("white", "yellow", "navyblue"),
    domain = c(0, 90)
  ) |>
  tab_footnote(
    footnote = "Color gradient indicates solar zenith angle magnitude.",
    locations = cells_column_labels(columns = sza)
  ) |>
  tab_style(
    style = list(
      cell_text(size = "small", color = "gray40"),
      cell_fill(color = "gray95")
    ),
    locations = cells_footnotes()
  )
```

The footnote text becomes smaller, gray, with a light background (visually distinguished from the main table).

### Styling source notes

Source notes often benefit from even more subdued styling than footnotes, since they provide attribution rather than essential clarifications. Italic text at a smaller size is a common convention for citations.

```{r}
gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  cols_label(mfr = "Make", model = "Model", msrp = "Price") |>
  tab_source_note(source_note = "From edmunds.com") |>
  tab_style(
    style = cell_text(
      color = "#666666",
      style = "italic",
      size = "x-small"
    ),
    locations = cells_source_notes()
  )
```

Source notes styled as small, italic, gray text clearly indicate their supplementary nature.

## Footer layout options

Several `tab_options()` settings control footer appearance:

### Single-line vs. multi-line footnotes

By default, each footnote starts on a new line. For compact tables, you can consolidate them:

```{r}
exibble |>
  dplyr::select(row, num, char, currency) |>
  gt(rowname_col = "row") |>
  tab_footnote(
    footnote = "Numeric values.",
    locations = cells_column_labels(columns = num)
  ) |>
  tab_footnote(
    footnote = "Text strings.",
    locations = cells_column_labels(columns = char)
  ) |>
  tab_footnote(
    footnote = "Currency amounts.",
    locations = cells_column_labels(columns = currency)
  ) |>
  tab_options(footnotes.multiline = FALSE)
```

All footnotes flow together in a single block, separated by spaces.

### Footer padding and borders

The spacing around footnotes and source notes, along with any dividing lines, can be adjusted to match your table's overall design. Tighter padding creates a more compact appearance, while borders can separate the footer from the table body or distinguish footnotes from source notes.

```{r}
towny |>
  dplyr::select(name, population_2021) |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "name") |>
  fmt_integer(columns = population_2021) |>
  cols_label(population_2021 = "Population") |>
  tab_footnote(
    footnote = "2021 Canadian Census data.",
    locations = cells_column_labels(columns = population_2021)
  ) |>
  tab_source_note(source_note = "Source: Statistics Canada") |>
  tab_options(
    footnotes.padding = px(8),
    footnotes.border.bottom.color = "gray70",
    source_notes.padding = px(6),
    source_notes.border.bottom.color = "transparent"
  )
```

Fine control over padding and borders helps integrate the footer with your overall table design.

## Practical examples

The techniques covered in this chapter come together in real-world tables where footnotes serve multiple purposes simultaneously. The following examples demonstrate how to combine location targeting, mark customization, and footer styling to create polished, professional tables.

### Comprehensive financial table

Financial reports often require extensive annotation: definitions for technical terms, clarifications for unusual values, and source citations for data provenance. This example shows how multiple footnote types work together in a single table.

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-05" & date <= "2015-01-09") |>
  dplyr::select(date, open, high, low, close, volume) |>
  dplyr::mutate(
    change = close - open,
    pct_change = (close - open) / open
  ) |>
  gt() |>
  tab_header(
    title = "S&P 500 Daily Performance",
    subtitle = "First trading week of 2015"
  ) |>
  fmt_date(columns = date, date_style = "yMMMd") |>
  fmt_currency(columns = c(open, high, low, close, change)) |>
  fmt_percent(columns = pct_change, decimals = 2) |>
  fmt_number(columns = volume, suffixing = TRUE) |>
  cols_label(
    date = "Date",
    open = "Open",
    high = "High",
    low = "Low", 
    close = "Close",
    volume = "Volume",
    change = "Change",
    pct_change = "% Change"
  ) |>
  tab_footnote(
    footnote = "New York Stock Exchange opening price.",
    locations = cells_column_labels(columns = open)
  ) |>
  tab_footnote(
    footnote = "Intraday trading range.",
    locations = cells_column_labels(columns = c(high, low))
  ) |>
  tab_footnote(
    footnote = "Shares traded (approximate).",
    locations = cells_column_labels(columns = volume)
  ) |>
  tab_footnote(
    footnote = "Worst single-day performance of the week.",
    locations = cells_body(columns = pct_change, rows = pct_change == min(pct_change))
  ) |>
  tab_footnote(footnote = "All values in USD.") |>
  tab_source_note(
    source_note = md("Data: *Yahoo Finance* via the **gt** package")
  ) |>
  opt_footnote_marks(marks = "standard") |>
  opt_footnote_spec(spec_ref = "^", spec_ftr = "x —") |>
  tab_options(footnotes.multiline = FALSE)
```

This financial table demonstrates multiple footnote targets, both marked and unmarked footnotes, customized marks, and styled footer elements.
 
### Research table with citations

Scientific and clinical publications have their own footnote conventions, often favoring letters or symbols over numbers and requiring precise citation formatting. This example shows a clinical laboratory report with footnotes on column spanners, stub cells, and a properly formatted source citation.

```{r}
illness |>
  dplyr::slice_head(n = 6) |>
  dplyr::select(test, units, norm_l, norm_u, day_3, day_7) |>
  gt(rowname_col = "test") |>
  tab_header(
    title = "Clinical Laboratory Results",
    subtitle = "Seven-day patient monitoring"
  ) |>
  tab_spanner(
    label = "Reference Range",
    columns = c(norm_l, norm_u)
  ) |>
  tab_spanner(
    label = "Patient Values",
    columns = c(day_3, day_7)
  ) |>
  cols_label(
    units = "Units",
    norm_l = "Lower",
    norm_u = "Upper",
    day_3 = "Admission",
    day_7 = "Discharge"
  ) |>
  tab_footnote(
    footnote = "Reference ranges from clinical guidelines.",
    locations = cells_column_spanners(spanners = "Reference Range")
  ) |>
  tab_footnote(
    footnote = "Day 3 = admission; Day 7 = planned discharge.",
    locations = cells_column_spanners(spanners = "Patient Values")
  ) |>
  tab_footnote(
    footnote = md("Hb = Hemoglobin; PLT = Platelet count"),
    locations = cells_stub(rows = c("Hb", "PLT"))
  ) |>
  tab_source_note(
    source_note = md("Laboratory procedures per *Clinical Chemistry* standards (2023)")
  ) |>
  opt_footnote_marks(marks = "letters") |>
  opt_footnote_spec(spec_ref = "^i", spec_ftr = "^x^")
```

This clinical research table uses superscript italic marks, attaches footnotes to spanners and stub cells, and includes a properly cited source note.

Footnotes transform tables from bare data presentations into documented, contextualized reports. Whether explaining methodology, defining terms, citing sources, or highlighting anomalies, the footer section provides structured space for the supplementary information that readers need. With **gt**'s flexible location helpers and extensive customization options, you can craft footnotes that integrate seamlessly with any table design.

## Summary

This chapter has covered the footer section of **gt** tables, where footnotes and source notes provide supplementary information without cluttering the main presentation.

The key concepts we've explored:

- footnotes link explanatory text to specific table locations via marks. The `tab_footnote()` function attaches notes to cells, columns, rows, spanners, or any other table element using the `cells_*()` location helpers.
- source notes provide general context (typically data citations) without marks. Multiple `tab_source_note()` calls add notes in sequence, and both `md()` and `html()` helpers enable rich formatting.
- footnote marks can be customized with `opt_footnote_marks()` (choosing numbers, letters, standard symbols, or extended symbols) and `opt_footnote_spec()` (controlling superscript, parentheses, and other formatting).
- location targeting uses the same `cells_*()` functions found throughout **gt**: `cells_body()`, `cells_column_labels()`, `cells_stub()`, `cells_column_spanners()`, `cells_row_groups()`, `cells_summary()`, and more.
- mark placement can be controlled with the `placement` argument, positioning marks to the left or right of cell content.

Footnotes serve multiple purposes: defining abbreviations, explaining methodology, noting data limitations, citing sources, and highlighting exceptions. The key is using them well. Too many footnotes can overwhelm a table, while strategic footnotes enhance understanding.

The next chapter introduces nanoplots: tiny embedded visualizations that add a visual dimension to tabular data. You'll learn to create line plots, bar plots, and box plots that fit within table cells, revealing trends and distributions at a glance.


---


# Nanoplots {#sec-nanoplots}


Tables present numbers; charts reveal patterns. But what if a table could do both? Nanoplots (tiny, embedded visualizations) bridge this divide by placing miniature graphics directly within table cells. These small-scale data representations can show trends, distributions, and comparisons at a glance, augmenting numeric values with visual context that aids rapid comprehension.

The term "sparkline" (coined by Edward Tufte) describes "data-intense, design-simple, word-sized graphics" that can be embedded inline with text. Nanoplots in **gt** extend this concept to tabular contexts, allowing each row to carry its own miniature visualization derived from the row's data. They are deliberately simple (there's limited space, after all) but that simplicity becomes a virtue. A nanoplot doesn't replace detailed analysis; it provides an immediate visual summary that guides the reader's attention and facilitates comparison across rows.

This chapter explores the `cols_nanoplot()` function and its companion `nanoplot_options()` helper. We'll examine the three available plot types (line plots, bar plots, and box plots) and discover how to customize their appearance, handle missing data, add reference elements, and supply data in various formats. By the chapter's end, you'll be equipped to enhance your tables with these compact but powerful visualizations.

## The `cols_nanoplot()` function

The `cols_nanoplot()` function creates a new column containing nanoplots, using data from one or more existing columns. The function collects numeric values across specified columns for each row, generates a plot from those values, and places the resulting visualization in a new column.

**Function Signature**

```r
cols_nanoplot(
  data,
  columns,
  rows = everything(),
  plot_type = c("line", "bar", "boxplot"),
  plot_height = "2em",
  missing_vals = c("gap", "marker", "zero", "remove"),
  autoscale = FALSE,
  autohide = TRUE,
  columns_x_vals = NULL,
  reference_line = NULL,
  reference_area = NULL,
  expand_x = NULL,
  expand_y = NULL,
  new_col_name = NULL,
  new_col_label = NULL,
  before = NULL,
  after = NULL,
  options = NULL
)
```

Let's start with a simple example using the `illness` dataset, which contains daily medical test measurements:

```{r}
illness |>
  dplyr::slice_head(n = 8) |>
  gt(rowname_col = "test") |>
  tab_header(title = "Daily Medical Test Results") |>
  cols_hide(columns = c(starts_with("norm"), units)) |>
  cols_nanoplot(
    columns = starts_with("day"),
    new_col_name = "trend",
    new_col_label = "7-Day Trend"
  )
```

This table shows medical test measurements with a line plot summarizing the seven daily values. The `columns = starts_with("day")` argument collects data from all columns beginning with "day", concatenating them left-to-right to form each row's data series. The source columns are automatically hidden (due to `autohide = TRUE` by default), keeping the table clean.

The nanoplot provides immediate visual context: readers can instantly see whether values trended upward, downward, or remained stable, without mentally parsing seven separate numbers.

Two arguments control how the new nanoplot column is identified and presented. The `new_col_name = "trend"` argument sets the internal column name and this is what you'll use to reference this column in subsequent **gt** operations like `cols_width()`, `cols_align()`, `cols_move()`, or `tab_style()`. Think of it as the column's programmatic identifier. Meanwhile, `new_col_label = "7-Day Trend"` sets what readers actually see in the column header. This label can include spaces, special characters, or even markdown formatting (via `md()`), making it reader-friendly while keeping the internal name concise and code-friendly.

Both arguments are optional. If you omit `new_col_name`, **gt** generates a default name (typically "nanoplots"). If you omit `new_col_label`, the column name itself becomes the label. However, providing explicit values is good practice: it makes your code clearer and ensures column headers communicate effectively with your audience. You'll often want a short, simple internal name for coding convenience paired with a more descriptive, formatted label for presentation clarity.

### Data input: columns vs. value streams

Nanoplots accept data in two flexible formats, allowing you to work with whatever structure your data already has.

The first format spreads values across multiple columns, as we just saw with the `illness` dataset. Each column contributes one value to the nanoplot, collected in left-to-right order:

```{r}
# Multi-column format: each column is one value
dplyr::tibble(
  product = c("Widget", "Gadget", "Gizmo"),
  q1_sales = c(120, 85, 210),
  q2_sales = c(135, 92, 198),
  q3_sales = c(142, 88, 225),
  q4_sales = c(156, 95, 245)
) |>
  gt(rowname_col = "product") |>
  tab_header(title = "Quarterly Sales") |>
  cols_nanoplot(
    columns = starts_with("q"),
    new_col_name = "trend",
    new_col_label = "Quarterly Trend"
  ) |>
  cols_width(trend ~ px(100))
```

The second format packs all values for a row into a single column as a delimited string. This is particularly useful when different rows have varying numbers of data points, or when your data arrives in this format from external sources:

```{r}
# Value stream format: comma-separated values in one column
dplyr::tibble(
  product = c("Widget", "Gadget", "Gizmo"),
  sales_stream = c("120, 135, 142, 156", "85, 92, 88, 95", "210, 198, 225, 245")
) |>
  gt(rowname_col = "product") |>
  tab_header(title = "Quarterly Sales") |>
  cols_nanoplot(
    columns = sales_stream,
    new_col_name = "trend",
    new_col_label = "Quarterly Trend"
  ) |>
  cols_width(trend ~ px(100))
```

Both formats produce identical nanoplots. The multi-column approach works well when your table already has the data structured that way and you want to show those columns alongside the nanoplot. The value stream approach is good for when you need flexibility in the number of data points per row or want to keep your table structure simple. Commas, spaces, or semicolons can all serve as delimiters in value streams.

## Line plots

Line plots are the default nanoplot type and is best for showing trends over ordered sequences. They consist of three visual layers that can be independently controlled: data points (the actual values), a connecting line, and a filled area beneath the line.

### Basic line plots

Line plots are the natural choice when your data represents a continuous progression or ordered sequence. Time series, sequential measurements, cumulative values, and any data where the order matters and you want to emphasize change from one value to the next: all of these benefit from line plot representation. The connecting line creates a visual path that guides the eye through the progression, making it easy to spot upward trends, downward trends, plateaus, or sudden changes.

In the context of nanoplots, line plots serve as compact trend indicators that answer questions like "Is this going up or down?" and "How volatile is this pattern?" at a glance. Because they're the default plot type, you don't need to specify `plot_type = "line"`. Simply calling `cols_nanoplot()` produces a line plot. This makes them the quickest option when you need a basic visual summary without customization.

The `towny` dataset contains population data for municipalities across multiple census years. By selecting columns that start with "population", we collect a time series for each municipality that spans several decades. The resulting line plots provide an immediate visual history of population growth:

```{r}
towny |>
  dplyr::select(name, starts_with("population")) |>
  dplyr::slice_max(population_2021, n = 8) |>
  gt() |>
  fmt_integer(columns = starts_with("population")) |>
  cols_nanoplot(
    columns = starts_with("population"),
    new_col_name = "pop_trend",
    new_col_label = "Population Trend"
  ) |>
  cols_hide(columns = matches("199|200|201")) |>
  cols_width(pop_trend ~ px(120))
```

Each municipality's population history spanning decades condenses into a compact visualization. The line plot reveals growth trajectories that would require careful numeric comparison to discern from the raw numbers alone. You can immediately see which municipalities experienced steady growth (smooth upward slopes), which grew explosively in recent decades (sharp upward curves), and which remained relatively stable (nearly flat lines).

The visual comparison across rows is particularly valuable here. Without the nanoplots, determining which municipality grew fastest would require mentally calculating growth rates from the numeric columns. The line plots make this comparison instant as steeper slopes indicate faster growth. Similarly, you can spot patterns like early rapid growth followed by stabilization, or slow initial growth accelerating in later years, patterns that might be missed when scanning columns of numbers.

By hiding the intermediate year columns with `cols_hide(columns = matches("199|200|201"))`, we keep the table clean while still showing the most recent population figure (2021) alongside the visual trend. This combination of current value and historical trend provides both the "what is it now?" and "how did we get here?" perspectives in a single glance.

### Customizing line plot appearance

The `nanoplot_options()` helper function provides extensive control over visual properties. Let's create line plots with customized styling:
 
```{r}
towny |>
  dplyr::select(name, starts_with("density")) |>
  dplyr::slice_max(density_2021, n = 6) |>
  gt() |>
  fmt_number(columns = starts_with("density"), decimals = 0) |>
  cols_nanoplot(
    columns = starts_with("density"),
    new_col_name = "density_trend",
    new_col_label = "Density Over Time",
    options = nanoplot_options(
      data_point_radius = 6,
      data_point_stroke_color = "darkblue",
      data_point_stroke_width = 2,
      data_point_fill_color = "lightblue",
      data_line_stroke_color = "steelblue",
      data_line_stroke_width = 3,
      data_area_fill_color = "lightsteelblue"
    )
  ) |>
  cols_hide(columns = matches("199|200|201")) |>
  cols_width(density_trend ~ px(140))
```

The blue color scheme creates visual cohesion. Larger data points with contrasting stroke and fill colors improve visibility, while the wider line and lighter area fill create depth.

### Showing only specific layers

Sometimes you want to emphasize particular aspects of the data. Here's a line-only plot without points or area:

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-01" & date <= "2015-03-31") |>
  dplyr::select(date, close) |>
  dplyr::mutate(month = format(date, "%Y-%m")) |>
  dplyr::summarize(
    prices = paste(close, collapse = ","),
    .by = month
  ) |>
  gt(rowname_col = "month") |>
  tab_header(title = "S&P 500 Daily Closing Prices", subtitle = "Q1 2015") |>
  cols_nanoplot(
    columns = prices,
    new_col_name = "price_chart",
    new_col_label = "Daily Prices",
    options = nanoplot_options(
      show_data_points = FALSE,
      show_data_area = FALSE,
      data_line_stroke_color = "#2E7D32",
      data_line_stroke_width = 2,
      data_line_type = "straight"
    )
  ) |>
  cols_width(price_chart ~ px(200))
```

With many data points, hiding individual markers reduces visual clutter. The `data_line_type = "straight"` option uses straight line segments instead of curves, which can be clearer for volatile data.

Alternatively, show only points for a scatter-like appearance:

```{r}
exibble |>
  dplyr::select(row, group, num, currency) |>
  gt(rowname_col = "row", groupname_col = "group") |>
  cols_nanoplot(
    columns = c(num, currency),
    new_col_name = "values",
    new_col_label = "Values",
    options = nanoplot_options(
      show_data_line = FALSE,
      show_data_area = FALSE,
      data_point_radius = 8,
      data_point_fill_color = "coral",
      data_point_stroke_color = "darkred",
      data_point_stroke_width = 2
    )
  )
```

With only two data points per row, a connecting line adds little value. Points alone clearly show the two values and their relative magnitudes.

### Line plots with x-axis values

By default, nanoplots space data points evenly along the x-axis. For line plots, you can supply explicit x values using `columns_x_vals`:

```{r}
# Create sample data with irregular time intervals
dplyr::tibble(
  category = c("Product A", "Product B", "Product C"),
  times = c("1,3,4,8,12", "2,5,6,9,15", "1,2,7,10,14"),
  values = c("10,15,13,20,25", "8,12,15,11,18", "5,8,12,15,20")
) |>
  gt(rowname_col = "category") |>
  tab_header(title = "Sales at Irregular Intervals") |>
  cols_nanoplot(
    columns = values,
    columns_x_vals = times,
    new_col_name = "trend",
    new_col_label = "Sales Trend",
    expand_x = c(0, 16)
  ) |>
  cols_width(trend ~ px(150))
```

The x values position points according to their actual timing rather than equally spacing them. The `expand_x` argument ensures all plots share the same x-axis range for valid comparison.

## Bar plots

Bar plots are good when showing categorical comparisons and clearly distinguishing positive from negative values. Unlike line plots, bar plots always use equal spacing and ignore any x-axis values.

### Basic bar plots

Bar plots work best when you need to compare discrete categories or sequential values where the magnitude of each individual item matters. Each bar represents a single data point, and its height encodes the value. When multiple values appear in a single nanoplot, the bars stand side by side, making it easy to compare magnitudes both within a row (across bars) and between rows (comparing corresponding bars).

In the context of tables, bar nanoplots are particularly effective for showing compositions, breakdowns, or multi-part measurements. For instance, if each row represents a different entity and the columns contain related metrics, a bar nanoplot can show all those metrics together in a compact visual form. This allows readers to quickly grasp not just which values are largest or smallest, but how the pattern of relative magnitudes differs from row to row.

```{r}
pizzaplace |>
  dplyr::count(type, date) |>
  tidyr::pivot_wider(names_from = type, values_from = n) |>
  dplyr::slice_head(n = 7) |>
  gt(rowname_col = "date") |>
  tab_header(title = "Daily Pizza Sales by Type") |>
  fmt_date(columns = stub(), date_style = "MMMd") |>
  cols_nanoplot(
    columns = c(chicken, classic, supreme, veggie),
    plot_type = "bar",
    new_col_name = "by_type",
    new_col_label = "Sales Distribution"
  ) |>
  cols_width(by_type ~ px(100))
```

Each bar represents one pizza type's sales for that day. The relative heights reveal the sales mix, showing which types dominated each day's orders. By comparing across rows, you can see whether certain days had notably different sales patterns. For example, a day where the classic pizza bar is much taller than the others indicates strong preference for that type, while more uniform bar heights suggest balanced sales across types.

The bars are positioned in the same order as the columns specified in the `columns` argument, creating a consistent visual structure. This consistency allows your eye to track a specific category across multiple rows. If the veggie pizza is always the fourth bar, you can quickly scan down the column to assess veggie pizza sales across all days without having to reorient yourself for each row.

Bar plots also make zero values and missing values visually obvious. A missing bar (or a bar with zero height) stands out immediately, drawing attention to gaps in the data. This is different from line plots, where missing values might create subtle gaps that could be overlooked.

### Customizing bar colors

When bar plots display multiple categories, assigning distinct colors to each bar position creates immediate visual differentiation. Instead of relying on position alone, color allows readers to identify specific categories at a glance. This technique is particularly effective when the categories have inherent associations (like product types, regions, or departments) that benefit from consistent color coding.

The `data_bar_fill_color` option in `nanoplot_options()` accepts a vector of colors, with each color corresponding to a bar position in the order specified by the `columns` argument. The first color applies to the first column's bar, the second color to the second column's bar, and so on. This positional consistency means that across all rows, the same category always appears in the same color, creating a visual legend that persists throughout the table.

When using multiple colors, providing a legend is essential. Without one, readers must deduce the color-to-category mapping by examining the source columns (if visible) or through trial and error. A clear legend, whether in a footnote, source note, or table caption, eliminates ambiguity and ensures readers can interpret the colored bars correctly from the first glance.

```{r}
pizzaplace |>
  dplyr::count(type, date) |>
  tidyr::pivot_wider(names_from = type, values_from = n) |>
  dplyr::slice_head(n = 7) |>
  gt(rowname_col = "date") |>
  tab_header(title = "Daily Pizza Sales by Type") |>
  fmt_date(columns = stub(), date_style = "MMMd") |>
  fmt_integer(columns = c(chicken, classic, supreme, veggie)) |>
  cols_align(align = "center", columns = everything()) |>
  cols_nanoplot(
    columns = c(chicken, classic, supreme, veggie),
    plot_type = "bar",
    autohide = FALSE,
    new_col_name = "by_type",
    new_col_label = "Sales by Type",
    options = nanoplot_options(
      data_bar_stroke_color = "transparent",
      data_bar_fill_color = c("#D35400", "#F4D03F", "#8E44AD", "#27AE60")
    )
  ) |>
  cols_width(everything() ~ px(100)) |>
  tab_source_note(
    source_note = md(paste0(
      "<span style=\"color:#D35400;\">&#9632;</span> Chicken &nbsp;&nbsp; ",
      "<span style=\"color:#F4D03F;\">&#9632;</span> Classic &nbsp;&nbsp; ",
      "<span style=\"color:#8E44AD;\">&#9632;</span> Supreme &nbsp;&nbsp; ",
      "<span style=\"color:#27AE60;\">&#9632;</span> Veggie"
    ))
  )
```

With `autohide = FALSE`, the source columns remain visible, allowing readers to see both exact numbers and the visual comparison. The colored bars create an instant visual signature for each pizza type. The source note uses HTML to create colored squares (&#9632; is the Unicode character for a square) that match the bar colors, providing an unambiguous legend without requiring readers to cross-reference column positions.

The even column widths (achieved with `cols_width(everything() ~ px(100))`) and centered alignment create a balanced, symmetric layout. This uniformity emphasizes the visual comparison by removing layout-based distractions. When all elements are equally spaced and aligned, differences in bar heights become the dominant visual feature.

Color choice matters. The colors used here have strong contrast and distinct hues (orange, yellow, purple, green), making them easy to distinguish even for readers with some forms of color vision deficiency. Avoid using colors that differ only in saturation or lightness, as these can be difficult to differentiate. Test your color palette to ensure sufficient contrast between adjacent bars.

### Bar plots with positive and negative values

When data contains both positive and negative values, bar plots automatically apply different visual styling to distinguish them. This is particularly useful for displaying changes, differences, or variance metrics where direction matters as much as magnitude. Positive values might represent growth, gains, or increases, while negative values indicate declines, losses, or decreases.

By default, **gt** renders positive and negative bars with distinct fill colors, making the directional information immediately visible without requiring readers to examine numeric values or axis labels. You can customize these colors using the `data_bar_fill_color` and `data_bar_negative_fill_color` options in `nanoplot_options()`, allowing you to align the color scheme with your data's semantics. For instance, green for positive changes and red for negative changes, or any other color pairing that suits your context:

```{r}
# Create data with positive and negative changes
dplyr::tibble(
  metric = c("Revenue", "Costs", "Margin", "Volume"),
  q1_change = c(12.5, -3.2, 8.1, -1.5),
  q2_change = c(-2.1, 5.8, -4.3, 6.2),
  q3_change = c(7.8, -1.9, 3.2, -2.8),
  q4_change = c(4.2, 2.1, -1.5, 8.9)
) |>
  gt(rowname_col = "metric") |>
  tab_header(title = "Quarterly Percent Changes") |>
  cols_nanoplot(
    columns = ends_with("change"),
    plot_type = "bar",
    new_col_name = "quarterly",
    new_col_label = "Q1–Q4 Changes",
    options = nanoplot_options(
      data_bar_fill_color = "#2ECC71",
      data_bar_stroke_color = "#1E8449",
      data_bar_negative_fill_color = "#E74C3C",
      data_bar_negative_stroke_color = "#922B21"
    )
  ) |>
  cols_width(quarterly ~ px(120))
```

Positive changes appear in green while negative changes display in red, making it immediately apparent which quarters saw gains versus losses for each metric.

### Horizontal reference lines in bar plots

Reference lines add analytical context to bar plots by marking specific values of interest. They can highlight thresholds, targets, or statistical measures like means and medians. When comparing bars across different positions or rows, a reference line provides a common benchmark that makes it easier to assess whether individual values exceed, fall short of, or align with a particular standard.

You can specify reference lines using keywords (like `"mean"` or `"median"`) to compute values from the data itself, or supply fixed numeric values when you have predetermined thresholds or targets in mind. The reference line appears as a horizontal line across the plot, typically in a contrasting color to ensure visibility against the bars:

```{r}
countrypops |>
  dplyr::filter(
    country_name %in% c("India", "China", "Nigeria", "Brazil", "Japan"),
    year >= 1960,
    year %% 10 == 0
  ) |>
  dplyr::select(country_name, year, population) |>
  dplyr::mutate(pop_millions = population / 1e6, .keep = "unused") |>
  tidyr::pivot_wider(names_from = year, values_from = pop_millions) |>
  gt(rowname_col = "country_name") |>
  tab_header(title = "Population Trends (Millions)", subtitle = "1960–2020") |>
  cols_nanoplot(
    columns = where(is.numeric),
    plot_type = "bar",
    reference_line = "mean",
    new_col_name = "pop_bars",
    new_col_label = "Annual Population"
  ) |>
  cols_width(pop_bars ~ px(140))
```

The reference line shows each country's mean population across the years, helping identify whether recent years are above or below the historical average. This horizontal line provides a quick visual benchmark: bars extending above the line represent years with above-average population, while those falling below indicate below-average years. The reference line is interactive. Positioning your mouse pointer to the right of the reference line reveals the computed mean value in a tooltip, formatted in the same way as the individual bar values. This allows you to see both the visual pattern and the precise threshold value that defines the comparison.

## Box plots

Box plots summarize distributions by showing median, quartiles, and outliers. They're ideal when each row contains many values and you want to convey distributional characteristics rather than individual data points.

### Basic box plots

```{r}
pizzaplace |>
  dplyr::filter(date <= "2015-01-14") |>
  dplyr::mutate(time_numeric = as.numeric(hms::as_hms(time))) |>
  dplyr::summarize(
    times = paste(time_numeric, collapse = ","),
    n_orders = dplyr::n(),
    .by = date
  ) |>
  gt() |>
  tab_header(title = "Pizza Order Timing", subtitle = "First Two Weeks of 2015") |>
  fmt_date(columns = date, date_style = "yMMMEd") |>
  cols_nanoplot(
    columns = times,
    plot_type = "boxplot",
    new_col_name = "timing",
    new_col_label = "Order Time Distribution"
  ) |>
  cols_width(timing ~ px(150)) |>
  cols_align(columns = timing, align = "center")
```

Each box plot summarizes that day's order timing distribution. The box spans the interquartile range (Q1 to Q3), the line inside marks the median, and whiskers extend to data within 1.5× IQR. Points beyond the whiskers are outliers.

### Customizing box plot appearance

```{r}
# Generate sample distribution data
set.seed(23)

dplyr::tibble(
  group = LETTERS[1:5],
  values = purrr::map_chr(1:5, ~ paste(round(rnorm(30, mean = .x * 10, sd = 5), 1),     collapse = ","))
) |>
  gt(rowname_col = "group") |>
  tab_header(title = "Distribution Comparison") |>
  cols_nanoplot(
    columns = values,
    plot_type = "boxplot",
    autoscale = TRUE,
    new_col_name = "dist",
    new_col_label = "Distribution"
  ) |>
  cols_width(dist ~ px(180))
```

The `autoscale = TRUE` option ensures all box plots share the same scale, making cross-row comparisons valid. Without this, each box plot would scale independently to its own data range.

### Formatting box plot hover values

Box plots can display custom-formatted values on hover:

```{r}
pizzaplace |>
  dplyr::filter(date <= "2015-01-07") |>
  dplyr::mutate(time_numeric = as.numeric(hms::as_hms(time))) |>
  dplyr::summarize(
    times = paste(time_numeric, collapse = ","),
    .by = date
  ) |>
  gt() |>
  tab_header(title = "Order Time Distributions") |>
  fmt_date(columns = date, date_style = "yMd") |>
  cols_nanoplot(
    columns = times,
    plot_type = "boxplot",
    new_col_name = "timing",
    new_col_label = "When Orders Came In",
    options = nanoplot_options(
      y_val_fmt_fn = function(x) format(hms::as_hms(x), "%H:%M")
    )
  ) |>
  cols_width(timing ~ px(160))
```

The `y_val_fmt_fn` argument accepts a function that transforms numeric values for display. Here, seconds-since-midnight values convert back to readable times when users hover over the plot.

## Reference lines and reference areas

Reference elements provide context by marking specific values or ranges within nanoplots.

### Reference lines

A reference line is a horizontal line marking a particular value. It can be a fixed number or computed from the data:

```{r}
illness |>
  dplyr::slice_head(n = 6) |>
  gt(rowname_col = "test") |>
  cols_hide(columns = c(starts_with("norm"), units)) |>
  cols_nanoplot(
    columns = starts_with("day"),
    reference_line = "median",
    new_col_name = "trend",
    new_col_label = "Trend (median reference)"
  ) |>
  cols_width(trend ~ px(120))
```

The reference line shows each test's median value across the seven days. Values above or below this baseline become immediately apparent.

Available keywords for computed reference lines:

- `"mean"`: arithmetic mean of the data
- `"median"`: median value
- `"min"`: minimum value
- `"max"`: maximum value
- `"q1"`: first quartile (25th percentile)
- `"q3"`: third quartile (75th percentile)
- `"first"`: first data value
- `"last"`: last data value

Or supply a fixed numeric value:

```{r}
towny |>
  dplyr::select(name, starts_with("population")) |>
  dplyr::slice_max(population_2021, n = 5) |>
  gt() |>
  fmt_integer(columns = starts_with("population")) |>
  cols_nanoplot(
    columns = starts_with("population"),
    reference_line = 500000,
    new_col_name = "trend",
    new_col_label = "Population History"
  ) |>
  cols_hide(columns = matches("199|200|201")) |>
  cols_width(trend ~ px(130))
```

The fixed 500,000 reference line provides a common benchmark across all municipalities.

### Reference areas

Reference areas shade a horizontal band, marking a range of values:

```{r}
illness |>
  dplyr::slice_head(n = 6) |>
  gt(rowname_col = "test") |>
  cols_hide(columns = c(starts_with("norm"), units)) |>
  cols_nanoplot(
    columns = starts_with("day"),
    reference_area = c("q1", "q3"),
    new_col_name = "trend",
    new_col_label = "Trend (IQR shaded)"
  ) |>
  cols_width(trend ~ px(130))
```

The shaded area marks the interquartile range. Values within this band represent "typical" observations while those outside are relatively extreme.

You can combine keywords and fixed values:

```{r}
towny |>
  dplyr::select(name, starts_with("density")) |>
  dplyr::slice_max(density_2021, n = 5) |>
  gt() |>
  fmt_number(columns = starts_with("density"), decimals = 0) |>
  cols_nanoplot(
    columns = starts_with("density"),
    reference_line = "median",
    reference_area = c("min", "max"),
    new_col_name = "trend",
    new_col_label = "Density Trend",
    options = nanoplot_options(
      reference_line_color = "darkred",
      reference_area_fill_color = "lightyellow"
    )
  ) |>
  cols_hide(columns = matches("199|200|201")) |>
  cols_width(trend ~ px(130))
```

The yellow area spans the full data range while the red line marks the median, showing both the overall scale and central tendency.

## Handling missing values

Real data often contains missing values. The `missing_vals` argument controls how nanoplots handle `NA`s:

### Gap strategy (default)

```{r}
dplyr::tibble(
  item = c("A", "B", "C"),
  v1 = c(10, 8, NA),
  v2 = c(15, NA, 12),
  v3 = c(NA, 14, 15),
  v4 = c(20, 16, 18),
  v5 = c(18, 12, NA)
) |>
  gt(rowname_col = "item") |>
  tab_header(title = "Missing Values: Gap Strategy") |>
  cols_nanoplot(
    columns = starts_with("v"),
    missing_vals = "gap",
    new_col_name = "trend",
    new_col_label = "Values"
  )
```

Gaps appear where data is missing. Lines discontinue and resume, clearly indicating where observations are absent.

### Marker strategy

The marker strategy works like the gap strategy but adds special visual markers at the locations of missing values. This draws even more attention to the fact that data is absent:

```{r}
dplyr::tibble(
  item = c("A", "B", "C"),
  v1 = c(10, 8, NA),
  v2 = c(15, NA, 12),
  v3 = c(NA, 14, 15),
  v4 = c(20, 16, 18),
  v5 = c(18, 12, NA)
) |>
  gt(rowname_col = "item") |>
  tab_header(title = "Missing Values: Marker Strategy") |>
  cols_nanoplot(
    columns = starts_with("v"),
    missing_vals = "marker",
    new_col_name = "trend",
    new_col_label = "Values"
  )
```

Like gaps, but with prominent markers at missing data locations. This makes missingness even more visible.

### Zero strategy

The zero strategy treats missing values as zeros. This approach is appropriate when absence of data genuinely means zero (for instance, missing order counts likely mean no orders occurred):

```{r}
dplyr::tibble(
  item = c("A", "B", "C"),
  v1 = c(10, 8, NA),
  v2 = c(15, NA, 12),
  v3 = c(NA, 14, 15),
  v4 = c(20, 16, 18),
  v5 = c(18, 12, NA)
) |>
  gt(rowname_col = "item") |>
  tab_header(title = "Missing Values: Zero Strategy") |>
  cols_nanoplot(
    columns = starts_with("v"),
    missing_vals = "zero",
    new_col_name = "trend",
    new_col_label = "Values"
  )
```

Missing values are replaced with zeros. Use this when zeros are meaningful substitutes (e.g., missing sales might truly mean zero sales).

### Remove strategy

The remove strategy excludes missing values entirely from the plot, connecting the remaining points directly. This can be useful when you want to focus only on observed values without calling attention to gaps:

```{r}
dplyr::tibble(
  item = c("A", "B", "C"),
  v1 = c(10, 8, NA),
  v2 = c(15, NA, 12),
  v3 = c(NA, 14, 15),
  v4 = c(20, 16, 18),
  v5 = c(18, 12, NA)
) |>
  gt(rowname_col = "item") |>
  tab_header(title = "Missing Values: Remove Strategy") |>
  cols_nanoplot(
    columns = starts_with("v"),
    missing_vals = "remove",
    new_col_name = "trend",
    new_col_label = "Values"
  )
```

Missing values are simply removed, and remaining values connect directly. The plots may have different numbers of points, but no gaps appear.

## Data input formats

Nanoplots accept data in two main formats: values spread across columns, or value streams in a single column.

### Multi-column format

The examples above primarily used multi-column format, where each column contains one value per row:

```{r}
exibble |>
  dplyr::select(row, num, currency) |>
  gt(rowname_col = "row") |>
  cols_nanoplot(
    columns = c(num, currency),
    new_col_name = "values",
    new_col_label = "Num & Currency"
  )
```

Values are collected left-to-right in the order columns are specified.

### Value stream format

While spreading values across multiple columns works well when your data is already structured that way, there are situations where packing values into a single delimited string offers significant advantages. This "value stream" format is useful when different rows contain varying numbers of data points, when data arrives from external sources in this format, or when you want to keep your table structure simple without creating many intermediate columns that serve only as nanoplot inputs.

Value streams are particularly useful when working with time series data of irregular length, aggregated measurements, or any scenario where the number of observations varies by row. Instead of dealing with missing values in unused columns or complex data reshaping, you can store each row's complete data series as a comma-separated (or space-separated, or semicolon-separated) string. **gt** parses these strings automatically, making it seamless to work with data in this format.

Value streams pack multiple values into a single column as delimited strings:

```{r}
dplyr::tibble(
  product = c("Widget", "Gadget", "Gizmo"),
  weekly_sales = c(
    "120, 135, 142, 128, 156, 149, 163",
    "85, 92, 88, 95, 101, 98, 105",
    "210, 198, 225, 232, 218, 245, 238"
  )
) |>
  gt(rowname_col = "product") |>
  tab_header(title = "Weekly Sales Trends") |>
  cols_nanoplot(
    columns = weekly_sales,
    new_col_name = "trend",
    new_col_label = "7-Day Trend"
  ) |>
  cols_width(trend ~ px(120))
```

Commas, spaces, or semicolons can separate values. Value streams are useful when different rows have varying numbers of observations, since each row's string can contain however many values exist for that row.

### Datetime value streams

Value streams can also contain ISO 8601 datetimes, which are automatically converted to numeric values:

```{r}
dplyr::tibble(
  event = c("Launch", "Update", "Sale"),
  timestamps = c(
    "2024-01-15 09:00:00, 2024-01-15 14:30:00, 2024-01-15 18:45:00",
    "2024-02-20 08:15:00, 2024-02-20 11:00:00, 2024-02-20 16:30:00, 2024-02-20 20:00:00",
    "2024-03-10 10:00:00, 2024-03-10 12:00:00, 2024-03-10 15:00:00"
  ),
  activity = c("50, 120, 85", "30, 75, 95, 60", "200, 350, 280")
) |>
  gt(rowname_col = "event") |>
  tab_header(title = "Activity Over Time") |>
  cols_nanoplot(
    columns = activity,
    columns_x_vals = timestamps,
    new_col_name = "timeline",
    new_col_label = "Activity Pattern"
  ) |>
  cols_width(timeline ~ px(140))
```

The datetime strings become x-axis positions, accurately representing the timing of observations.

## Autoscaling and axis control

By default, nanoplots scale independently: each plot adjusts its axis range to fit its own data. While this maximizes detail within each plot, it can mislead when comparing across rows. The `autoscale` option addresses this by forcing all nanoplots to share a common scale, and the `expand_x` and `expand_y` arguments allow you to set explicit axis ranges for even greater control.

### Autoscaling across rows

By default, each nanoplot scales independently to its own data range. This maximizes visual variation within each plot but makes cross-row comparison difficult:

```{r}
towny |>
  dplyr::select(name, starts_with("population")) |>
  dplyr::filter(population_2021 > 100000) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_integer(columns = starts_with("population")) |>
  cols_nanoplot(
    columns = starts_with("population"),
    autoscale = FALSE,  
    new_col_name = "trend",
    new_col_label = "Trend (independent scales)"
  ) |>
  cols_hide(columns = matches("199|200|201")) |>
  cols_width(trend ~ px(120))
```

Each municipality's plot fills its available space regardless of absolute population differences.

With `autoscale = TRUE`, all plots share the same y-axis scale:

```{r}
towny |>
  dplyr::select(name, starts_with("population")) |>
  dplyr::filter(population_2021 > 100000) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_integer(columns = starts_with("population")) |>
  cols_nanoplot(
    columns = starts_with("population"),
    autoscale = TRUE,  
    new_col_name = "trend",
    new_col_label = "Trend (common scale)"
  ) |>
  cols_hide(columns = matches("199|200|201")) |>
  cols_width(trend ~ px(120))
```

Now the visual heights accurately represent population magnitudes relative to other rows. Toronto's massive population dominates while smaller cities appear proportionally smaller.

### Expanding axis ranges

The `expand_x` and `expand_y` arguments extend plot boundaries beyond the data range:

```{r}
dplyr::tibble(
  scenario = c("Optimistic", "Baseline", "Pessimistic"),
  projections = c("105, 112, 120, 130", "100, 102, 105, 108", "100, 95, 88, 80")
) |>
  gt(rowname_col = "scenario") |>
  tab_header(title = "Revenue Projections (Indexed to 100)") |>
  cols_nanoplot(
    columns = projections,
    expand_y = c(70, 140),
    reference_line = 100,
    new_col_name = "projection",
    new_col_label = "4-Year Outlook"
  ) |>
  cols_width(projection ~ px(120))
```

The fixed y-axis range (`70`–`140`) and reference line at `100` provide consistent context across all scenarios, making it easy to see which projections exceed or fall below the baseline.

## Column positioning and labeling

When `cols_nanoplot()` creates a new column, you control where it appears and what it's called. The `before` and `after` arguments position the column relative to existing columns, while `new_col_name` and `new_col_label` set its internal name and display label.

### Positioning the nanoplot column

The `before` and `after` arguments control where the new nanoplot column appears:

```{r}
exibble |>
  dplyr::select(row, char, num, currency) |>
  gt(rowname_col = "row") |>
  cols_nanoplot(
    columns = c(num, currency),
    new_col_name = "values_plot",
    new_col_label = "Visual",
    after = "char"  
  )
```

The nanoplot column appears immediately after `char`, placing related information together.

### Custom column names and labels

The `new_col_name` and `new_col_label` arguments work together to give your nanoplot column both a practical internal identifier and a polished display label:

```{r}
illness |>
  dplyr::slice_head(n = 5) |>
  gt(rowname_col = "test") |>
  cols_hide(columns = c(starts_with("norm"), units)) |>
  cols_nanoplot(
    columns = starts_with("day"),
    new_col_name = "weekly_progression",
    new_col_label = md("*7-Day Progression*")
  )
```

The `new_col_name` sets the internal column name (useful for subsequent operations), while `new_col_label` sets the display label. Labels can include markdown formatting via `md()`.

## The `nanoplot_options()` helper

The `nanoplot_options()` function provides granular control over every visual aspect of nanoplots. Let's explore the major option categories:

**Function Signature**

```r
nanoplot_options(
  # Data point options
  data_point_radius = NULL,
  data_point_stroke_color = NULL,
  data_point_stroke_width = NULL,
  data_point_fill_color = NULL,
  
  # Data line options
  data_line_type = NULL,
  data_line_stroke_color = NULL,
  data_line_stroke_width = NULL,
  
  # Data area options
  data_area_fill_color = NULL,
  
  # Bar options (positive values)
  data_bar_stroke_color = NULL,
  data_bar_stroke_width = NULL,
  data_bar_fill_color = NULL,
  
  # Bar options (negative values)
  data_bar_negative_stroke_color = NULL,
  data_bar_negative_stroke_width = NULL,
  data_bar_negative_fill_color = NULL,
  
  # Reference elements
  reference_line_color = NULL,
  reference_area_fill_color = NULL,
  
  # Interactive guides
  vertical_guide_stroke_color = NULL,
  vertical_guide_stroke_width = NULL,
  
  # Layer visibility
  show_data_points = NULL,
  show_data_line = NULL,
  show_data_area = NULL,
  show_reference_line = NULL,
  show_reference_area = NULL,
  show_vertical_guides = NULL,
  show_y_axis_guide = NULL,
  
  # Value formatting
  interactive_data_values = NULL,
  y_val_fmt_fn = NULL,
  y_axis_fmt_fn = NULL,
  y_ref_line_fmt_fn = NULL,
  currency = NULL
)
```

### Per-point styling

Some options accept vectors to style individual data points differently:

```{r}
dplyr::tibble(
    quarter = c("Q1", "Q2", "Q3", "Q4"),
    revenue = c("100, 110, 105, 120")
) |>
    gt(rowname_col = "quarter") |>
    cols_nanoplot(
        columns = revenue,
        new_col_name = "trend",
        options = nanoplot_options(
            data_point_fill_color = c("gray", "gray", "gray", "gold"),
            data_point_radius = c(5, 5, 5, 10),
            data_point_stroke_color = "black",
            data_line_stroke_color = "gray"
        )
    )
```

The final point (Q4) is highlighted with a larger golden marker (look at the final values in the `data_point_fill_color` and `data_point_radius` arguments), drawing attention to the most recent value.

### Reusable option sets

When creating tables with multiple nanoplot columns, you often want them to share a consistent visual style. Rather than duplicating the same `nanoplot_options()` specification for each column, you can define an option set once and reuse it. This approach offers several benefits: it reduces code repetition, ensures perfect visual consistency across columns, and makes style updates trivial (change the definition once rather than hunting through multiple `cols_nanoplot()` calls).

Reusable option sets are particularly valuable when building themed tables or when working with organizational style guidelines. You might define several standard option sets (`"minimal"`, `"detailed"`, `"dashboard"`, etc.) and apply them consistently across different tables and reports. This creates visual coherence across your work while keeping the implementation clean and maintainable.

Create option sets once and apply them across multiple nanoplot columns:

```{r}
minimal_style <- nanoplot_options(
  show_data_area = FALSE,
  show_data_points = FALSE,
  data_line_stroke_width = px(2),
  data_line_stroke_color = "#333333",
  data_line_type = "straight"
)

towny |>
  dplyr::select(name, starts_with("population"), starts_with("density")) |>
  dplyr::slice_max(population_2021, n = 4) |>
  gt() |>
  cols_nanoplot(
    columns = starts_with("population"),
    new_col_name = "pop_trend",
    new_col_label = "Population",
    options = minimal_style
  ) |>
  cols_nanoplot(
    columns = starts_with("density"),
    new_col_name = "dens_trend",
    new_col_label = "Density",
    options = minimal_style
  ) |>
  cols_hide(columns = -c(name, pop_trend, dens_trend))
```

Both nanoplot columns share the same minimal styling, creating visual consistency across the table.

### Currency formatting

When nanoplots display financial data, proper currency formatting in tooltips and hover displays makes the values immediately understandable. Rather than seeing raw numbers like "1350" or "12000", users see properly formatted currency values like `"$1,350"` or `"$12,000"`. This formatting applies to the interactive elements of the nanoplot: when users hover over data points, reference lines, or other interactive features, the displayed values respect the currency specification.

The `currency` option in `nanoplot_options()` accepts standard three-letter currency codes (`"USD"`, `"EUR"`, `"GBP"`, `"JPY"`, etc.) and automatically applies appropriate formatting rules for that currency, including the correct symbol, decimal places, and thousands separators. This ensures that financial nanoplots maintain the same level of polish and professionalism as the rest of your formatted table columns.

For financial data, specify a currency code:

```{r}
dplyr::tibble(
  product = c("Basic", "Pro", "Enterprise"),
  monthly_revenue = c(
    "1200, 1350, 1280, 1420, 1510",
    "4500, 4800, 5100, 4950, 5300",
    "12000, 13500, 14200, 15800, 16500"
  )
) |>
  gt(rowname_col = "product") |>
  tab_header(title = "Monthly Revenue Trends") |>
  cols_nanoplot(
    columns = monthly_revenue,
    reference_line = "mean",
    new_col_name = "trend",
    new_col_label = "5-Month Trend",
    options = nanoplot_options(currency = "USD")
  ) |>
  cols_width(trend ~ px(140))
```

Hovering over data points displays values formatted as currency (e.g., `"$1,350"` instead of `"1350"`).

## Practical examples

Nanoplots shine when they combine multiple techniques like autoscaling for valid comparisons, reference elements for context, custom styling for clarity, and meticulous positioning for narrative flow. These examples demonstrate complete workflows that bring together the concepts covered in this chapter.

### Sparkline summary table

This example combines monthly summary statistics with daily price trend sparklines, providing both high-level metrics and visual context:

```{r}
sp500 |>
  dplyr::filter(date >= "2015-01-01" & date <= "2015-12-31") |>
  dplyr::mutate(month = format(date, "%B")) |>
  dplyr::mutate(month = factor(month, levels = month.name)) |>
  dplyr::summarize(
    open = first(open),
    close = last(close),
    high = max(high),
    low = min(low),
    prices = paste(close, collapse = ","),
    .by = month
  ) |>
  dplyr::arrange(month) |>
  gt(rowname_col = "month") |>
  tab_header(
    title = "S&P 500 Monthly Summary",
    subtitle = "2015 Calendar Year"
  ) |>
  fmt_currency(columns = c(open, close, high, low), decimals = 0) |>
  cols_nanoplot(
    columns = prices,
    new_col_name = "daily_trend",
    new_col_label = "Daily Closes",
    options = nanoplot_options(
      show_data_points = FALSE,
      show_data_area = FALSE,
      data_line_stroke_color = "steelblue",
      data_line_stroke_width = 1.5
    )
  ) |>
  cols_width(daily_trend ~ px(100)) |>
  cols_move(columns = daily_trend, after = open)
```

This financial summary table combines key statistics with a visual representation of daily price movements. The sparkline provides trend context that complements the summary figures.

### Distribution comparison table

Box plot nanoplots are great at comparing distributions across groups, revealing differences in central tendency, spread, and outliers:

```{r}
set.seed(23)

dplyr::tibble(
  treatment = c("Control", "Drug A", "Drug B", "Drug C"),
  responses = purrr::map_chr(
    c(50, 55, 48, 62),
    ~ paste(round(rnorm(25, mean = .x, sd = 10), 1), collapse = ",")
  )
) |>
  gt(rowname_col = "treatment") |>
  tab_header(title = "Treatment Response Distributions") |>
  cols_nanoplot(
    columns = responses,
    plot_type = "boxplot",
    autoscale = TRUE,
    new_col_name = "distribution",
    new_col_label = "Response Distribution"
  ) |>
  cols_width(distribution ~ px(200))
```

Box plots reveal distributional differences between treatments (not just central tendency but spread and outliers). The shared scale (via `autoscale`) enables valid visual comparison.

### Multi-metric dashboard row

This dashboard-style table demonstrates how multiple nanoplot columns with different plot types and color schemes can work together to tell a comprehensive story:

```{r}
# Simulated performance metrics
dplyr::tibble(
    server = c("prod-1", "prod-2", "prod-3"),
    cpu = c("45,52,48,61,55,49,53", "78,82,79,85,81,77,80", "32,35,38,34,36,33,37"),
    memory = c("62,65,64,68,66,63,67", "71,74,72,76,73,70,75", "55,58,56,60,57,54,59"),
    requests = c(
        "1200,1350,1280,1420,1380,1250,1310",
        "890,920,905,940,915,885,910",
        "1580,1620,1595,1650,1610,1570,1605"
    )
) |>
    gt(rowname_col = "server") |>
    tab_header(title = "Server Performance (Last 7 Hours)") |>
    cols_nanoplot(
        columns = cpu,
        autoscale = TRUE,
        new_col_name = "cpu_plot",
        new_col_label = "CPU %",
        options = nanoplot_options(
            show_data_area = FALSE,
            data_line_stroke_color = "#E74C3C",
            data_point_fill_color = "#E74C3C"
        )
    ) |>
    cols_nanoplot(
        columns = memory,
        autoscale = TRUE,
        new_col_name = "mem_plot",
        new_col_label = "Memory %",
        options = nanoplot_options(
            show_data_area = FALSE,
            data_line_stroke_color = "#3498DB",
            data_point_fill_color = "#3498DB"
        )
    ) |>
    cols_nanoplot(
        columns = requests,
        plot_type = "bar",
        autoscale = TRUE,
        new_col_name = "req_plot",
        new_col_label = "Requests/hr",
        options = nanoplot_options(
            data_bar_fill_color = "#2ECC71",
            data_bar_stroke_color = "#27AE60"
        )
    ) |>
    cols_width(
        c(cpu_plot, mem_plot) ~ px(100),
        req_plot ~ px(80)
    )
```

This dashboard-style table uses color-coded nanoplots to show multiple metrics per server. Line plots suit the percentage metrics while bar plots work well for discrete request counts.

Nanoplots transform tables from static data presentations into dynamic visual summaries. By embedding trend lines, distributions, and comparisons directly within table rows, they enable readers to grasp patterns at a glance while retaining access to precise numeric values. The extensive customization options ensure that nanoplots can be tailored to match any design aesthetic or analytical purpose.

## Summary

This chapter has explored nanoplots: compact visualizations that embed directly within table cells, bridging the gap between tabular precision and visual pattern recognition.

The key capabilities we've covered:

- plot types: line plots show trends over time or sequence, bar plots display discrete comparisons, and box plots summarize distributions. Each type serves different analytical purposes.
- the `cols_nanoplot()` function creates a new column of visualizations from numeric data in existing columns. It handles data collection, plot generation, and column placement automatically.
- data formats: nanoplots accept data as separate columns, comma-separated strings within cells, or explicit x-y value pairs. This flexibility accommodates various data structures.
- reference elements: reference lines and reference areas add context to plots, showing targets, thresholds, or acceptable ranges that help readers interpret the visualizations.
- customization: the `nanoplot_options()` helper provides extensive control over colors, sizes, strokes, and display elements. You can match nanoplots to your table's overall design aesthetic.
- missing data handling: the `missing_vals` argument controls how gaps appear in plots (as breaks, markers, zeros, or removed points).
- autoscaling: when comparing across rows, `autoscale = TRUE` ensures all plots share the same axis ranges, making visual comparisons meaningful.

Nanoplots work best when they complement rather than replace numeric values. A trend line next to quarterly figures helps readers see the trajectory. A distribution box plot alongside summary statistics reveals shape. The combination of numbers and graphics creates tables that inform at multiple levels of detail.

The next chapter introduces table groups, which let you work with multiple related tables as a cohesive unit. You'll learn to bundle tables together, apply common styling, and output them as coordinated sets.


---


# Working with table groups {#sec-table-groups}


Sometimes you need to work with multiple related tables rather than a single table. The **gt** package provides the `gt_group` class and associated functions for bundling multiple **gt** tables together. This enables you to apply common options across tables, manage collections programmatically, and output them together as a cohesive unit.

## Why use table groups?

Table groups are useful when you have:

- related tables that should be presented together (e.g., results by category)
- multiple views of the same data (e.g., summary and detail tables)
- paginated content where a large table needs to be split across pages
- consistent styling requirements across a set of tables

When you print a `gt_group` object in HTML, tables are separated by line breaks. In paginated formats (PDF, Word), they're separated by page breaks. This makes table groups ideal for reports that need multiple tables with consistent formatting.

## Creating table groups

### `gt_group()`

The `gt_group()` function creates a container that holds multiple **gt** tables. You can pass tables directly or add them later.

Here is the function's signature:

```r
gt_group(
  ...,
  .list = list2(...)
)
```

Let's create a simple group of two tables:

```{r}
# Create individual tables
table_north <- 
  dplyr::tibble(
    city = c("New York", "Boston", "Chicago"),
    sales = c(125000, 87000, 95000)
  ) |>
  gt() |>
  tab_header(title = "North Region Sales") |>
  fmt_currency(columns = sales, currency = "USD")

table_south <- 
  dplyr::tibble(
    city = c("Miami", "Atlanta", "Dallas"),
    sales = c(110000, 78000, 92000)
  ) |>
  gt() |>
  tab_header(title = "South Region Sales") |>
  fmt_currency(columns = sales, currency = "USD")

# Combine into a group
sales_group <- gt_group(table_north, table_south)
sales_group
```

The two tables are now bundled together and will display sequentially.

### Creating groups from lists

When you have tables stored in a list, use the `.list` argument:

```{r}
# Create a list of tables programmatically
regions <- c("East", "West", "Central")
region_data <- list(
  dplyr::tibble(store = c("Store A", "Store B"), revenue = c(50000, 45000)),
  dplyr::tibble(store = c("Store C", "Store D"), revenue = c(62000, 58000)),
  dplyr::tibble(store = c("Store E", "Store F"), revenue = c(41000, 39000))
)

# Create tables with consistent formatting
region_tables <- lapply(seq_along(regions), function(i) {
  region_data[[i]] |>
    gt() |>
    tab_header(title = paste(regions[i], "Region")) |>
    fmt_currency(columns = revenue, currency = "USD")
})

# Combine into a group
regional_group <- gt_group(.list = region_tables)
regional_group
```

This pattern is particularly useful when generating tables from grouped data frames or when the number of tables is determined dynamically.

## Splitting tables into groups

### `gt_split()`

The `gt_split()` function divides a single **gt** table into multiple tables based on row count. This is useful for pagination or when you need to break up large tables.

Here is the function's signature:

```r
gt_split(
  data,
  row_every_n = NULL,
  row_slice_i = NULL,
  col_slice_at = NULL
)
```

Let's split a large table into smaller chunks:

```{r}
# Create a table with many rows
large_table <- 
  gtcars |>
  dplyr::select(mfr, model, year, hp, mpg_c) |>
  dplyr::slice(1:12) |>
  gt() |>
  tab_header(title = "Performance Vehicles") |>
  fmt_integer(columns = c(year, hp)) |>
  fmt_number(columns = mpg_c, decimals = 1)

# Split into groups of 4 rows each
split_tables <- gt_split(large_table, row_every_n = 4)
split_tables
```

The original 12-row table is now split into three tables of 4 rows each. Headers and formatting are preserved in each split table.

#### Custom row slices

For more control over where splits occur, use `row_slice_i` with a vector of row indices:

```{r}
# Split at specific points
custom_split <- gt_split(
  large_table,
  row_slice_i = c(5, 9)  
)
custom_split
```

This creates three tables: rows 1-4, rows 5-8, and rows 9-12. This is useful when you want splits at logical breakpoints rather than fixed intervals.

## Managing tables in a group

### `grp_add()`

Add one or more tables to an existing group with `grp_add()`.

Here is the function's signature:

```r
grp_add(
  data,
  ...,
  .list = list2(...)
)
```

```{r}
# Start with a group
base_group <- gt_group(table_north)

# Add another table
expanded_group <- grp_add(base_group, table_south)

# Add multiple tables at once
another_table <- 
  dplyr::tibble(
    city = c("Seattle", "Portland"),
    sales = c(65000, 48000)
  ) |>
  gt() |>
  tab_header(title = "Pacific Northwest Sales") |>
  fmt_currency(columns = sales, currency = "USD")

final_group <- grp_add(expanded_group, another_table)
final_group
```

Tables are added at the end of the group by default.

### `grp_pull()`

Extract a specific table from a group with `grp_pull()`. This returns a standard **gt** object that you can modify further.

Here is the function's signature:

```r
grp_pull(
  data,
  which
)
```

```{r}
# Extract the second table from the group
second_table <- grp_pull(sales_group, which = 2)
second_table
```

The `which` argument specifies the position (1-indexed) of the table to extract.

### `grp_replace()`

Replace a table in the group with a new one using `grp_replace()`.

Here is the function's signature:

```r
grp_replace(
  data,
  ...,
  .list = list2(...)
)
```

```{r}
# Create an updated version of the south table
updated_south <- 
  dplyr::tibble(
    city = c("Miami", "Atlanta", "Dallas", "Houston"),
    sales = c(115000, 82000, 98000, 105000)
  ) |>
  gt() |>
  tab_header(title = "South Region Sales (Updated)") |>
  fmt_currency(columns = sales, currency = "USD")

# Replace the second table in the group
updated_group <- grp_replace(sales_group, updated_south, .which = 2)
updated_group
```

The `.which` argument specifies which table position to replace.

### `grp_rm()`

Remove one or more tables from a group with `grp_rm()`.

Here is the function's signature:

```r
grp_rm(
  data,
  which
)
```

```{r}
# Create a group with three tables
three_table_group <- gt_group(table_north, table_south, another_table)

# Remove the middle table
two_table_group <- grp_rm(three_table_group, which = 2)
two_table_group
```

The remaining tables are renumbered automatically.

### `grp_clone()`

Create copies of tables within a group using `grp_clone()`. This is useful when you want variations of the same base table.

Here is the function's signature:

```r
grp_clone(
  data,
  which
)
```

```{r}
# Clone the first table
cloned_group <- grp_clone(sales_group, which = 1)
cloned_group
```

The cloned table is added at the end of the group. You can then modify it with `grp_pull()`, make changes, and use `grp_replace()` to update it.

## Applying options across a group

### `grp_options()`

Apply `tab_options()` settings to all tables in a group at once with `grp_options()`. This ensures consistent styling across your table collection.

Here is the function's signature:

```r
grp_options(
  data,
  ...
)
```

```{r}
# Apply consistent styling to all tables in the group
styled_group <- 
  sales_group |>
  grp_options(
    heading.background.color = "steelblue",
    heading.title.font.size = px(16),
    column_labels.font.weight = "bold",
    table.font.size = px(12)
  )
styled_group
```

All tables in the group now share the same styling options. This is more efficient than applying options to each table individually, and it ensures consistency.

#### Common styling patterns

Here's a pattern for creating a professionally styled group:

```{r}
# Create a base style function
apply_corporate_style <- function(group) {
  group |>
    grp_options(
      table.border.top.color = "#003366",
      table.border.top.width = px(3),
      heading.background.color = "#003366",
      heading.title.font.size = px(14),
      column_labels.background.color = "#E6E6E6",
      row.striping.include_table_body = TRUE
    )
}

# Apply to any group
corporate_group <- apply_corporate_style(sales_group)
corporate_group
```

## Practical workflows

### Generating tables from grouped data

A common pattern is creating a table for each group in your data:

```{r}
# Group data and create a table for each group
tables_by_mfr <- 
  gtcars |>
  dplyr::filter(mfr %in% c("Ferrari", "Lamborghini", "Porsche")) |>
  dplyr::select(mfr, model, year, hp, msrp) |>
  dplyr::group_by(mfr) |>
  dplyr::group_split() |>
  lapply(function(df) {
    manufacturer <- unique(df$mfr)
    df |>
      dplyr::select(-mfr) |>
      gt() |>
      tab_header(title = paste(manufacturer, "Models")) |>
      fmt_integer(columns = c(year, hp)) |>
      fmt_currency(columns = msrp, currency = "USD", decimals = 0)
  })

# Combine into a group with consistent styling
supercar_group <- 
  gt_group(.list = tables_by_mfr) |>
  grp_options(
    heading.background.color = "#1a1a1a",
    column_labels.font.weight = "bold"
  )
supercar_group
```

### Creating summary and detail table pairs

Another common pattern is pairing summary tables with detailed views:

```{r}
# Summary table
summary_table <- 
  gtcars |>
  dplyr::group_by(mfr) |>
  dplyr::summarize(
    n_models = n(),
    avg_hp = mean(hp),
    avg_price = mean(msrp),
    .groups = "drop"
  ) |>
  dplyr::slice_max(n_models, n = 5) |>
  gt() |>
  tab_header(
    title = "Top Manufacturers by Model Count",
    subtitle = "Summary Statistics"
  ) |>
  fmt_integer(columns = c(n_models, avg_hp)) |>
  fmt_currency(columns = avg_price, currency = "USD", decimals = 0) |>
  cols_label(
    mfr = "Manufacturer",
    n_models = "Models",
    avg_hp = "Avg HP",
    avg_price = "Avg Price"
  )

# Detail table
detail_table <- 
  gtcars |>
  dplyr::filter(mfr == "Porsche") |>
  dplyr::select(model, year, hp, msrp) |>
  gt() |>
  tab_header(
    title = "Porsche Model Details",
    subtitle = "Full specification list"
  ) |>
  fmt_integer(columns = c(year, hp)) |>
  fmt_currency(columns = msrp, currency = "USD", decimals = 0)

# Combine into a report
report_group <- gt_group(summary_table, detail_table)
report_group
```

### Building comparative tables

When comparing multiple categories or time periods:

```{r}
# Create comparison tables for different years
years <- c(2015, 2016, 2017)

year_tables <- lapply(years, function(yr) {
  gtcars |>
    dplyr::filter(year == yr) |>
    dplyr::group_by(mfr) |>
    dplyr::summarize(
      models = n(),
      avg_hp = mean(hp),
      .groups = "drop"
    ) |>
    dplyr::slice_max(models, n = 3) |>
    gt() |>
    tab_header(title = paste(yr, "Top Manufacturers")) |>
    fmt_integer(columns = c(models, avg_hp)) |>
    cols_label(
      mfr = "Manufacturer",
      models = "Models",
      avg_hp = "Avg HP"
    )
})

comparison_group <- 
  gt_group(.list = year_tables) |>
  grp_options(
    column_labels.background.color = "#f0f0f0"
  )
comparison_group
```

## Output considerations

When outputting table groups:

- **HTML**: Tables are separated by `<br>` tags (line breaks)
- **PDF/LaTeX**: Tables are separated by page breaks
- **Word**: Tables are separated by page breaks
- **RTF**: Tables are separated by page breaks

This behavior makes table groups ideal for generating reports where each table should appear on its own page in printed output.

```{r}
# Save a table group to different formats
gtsave(sales_group, "sales_report.html")
gtsave(sales_group, "sales_report.pdf")
gtsave(sales_group, "sales_report.docx")
```

Each output format handles the group appropriately for its medium.

## Summary

This chapter has introduced table groups: containers that hold multiple **gt** tables and treat them as a coordinated unit.

The key concepts we've covered:

- creating groups: `gt_group()` bundles multiple **gt** tables together, either by passing them directly or building the collection incrementally.
- managing tables: `grp_add()` adds tables to existing groups, `grp_pull()` extracts individual tables, `grp_replace()` swaps tables, `grp_rm()` removes tables, and `grp_clone()` duplicates tables within a group.
- splitting tables: `gt_split()` divides a single large table into multiple smaller tables based on row count, column count, or row groups (useful for pagination or breaking up dense displays).
- common options: `grp_options()` applies `tab_options()` settings across all tables in a group, ensuring visual consistency without repetitive code.
- output behavior: in HTML, grouped tables are separated by line breaks. In paginated formats (PDF, Word, RTF), they're separated by page breaks, making groups ideal for multi-page reports.

Table groups solve practical problems: presenting related analyses together, maintaining consistent styling across report sections, and handling pagination for large datasets. They complement rather than replace individual table construction. You build each table with the full power of **gt**, then combine them into groups for coordinated output.

The next chapter explores output formats, covering how to render **gt** tables for different destinations: HTML for web, PDF for print, Word for documents, and more. You'll learn to optimize tables for each format's unique characteristics and constraints.


---


# Output formats {#sec-output-formats}


Tables created with **gt** are presentation-ready, but where they're presented matters. A table destined for a web page has different constraints and capabilities than one heading into a PDF report or Word document. The **gt** package accommodates this diversity by supporting multiple output formats, each with its own rendering function and characteristics.

This chapter explores the five primary output formats **gt** supports: HTML (for web and interactive documents), LaTeX (for PDF generation), RTF (for rich text documents), Word (for Microsoft Word documents), and PNG images (for static graphics). We'll examine how to generate each format, understand their respective strengths and limitations, and learn when to choose one over another.

## HTML

HTML is **gt**'s native format and receives the fullest feature support. When you display a **gt** table in an R console, RStudio viewer, or Quarto/R Markdown HTML document, you're seeing the HTML output.

### Generating HTML output

The `as_raw_html()` function converts a **gt** table to an HTML string:

```{r}
gtcars |>
  dplyr::select(mfr, model, year, hp, msrp) |>
  dplyr::slice_head(n = 3) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  as_raw_html()
```

This returns a character string containing complete HTML markup. You can write this to a file, embed it in a larger HTML document, or pass it to other tools that consume HTML.

For saving directly to a file, use `gtsave()`:

```{r eval=FALSE}
gtcars |>
  dplyr::select(mfr, model, year, hp, msrp) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  tab_header(title = "High-Performance Cars") |>
  gtsave("cars_table.html")
```

The resulting HTML file is self-contained and can be opened directly in any web browser.

### Use cases

HTML output is great in these scenarios:

- web publishing: blogs, websites, dashboards, and web applications
- interactive reports: Quarto/R Markdown documents rendered to HTML
- email newsletters: HTML emails with embedded tables
- documentation: package documentation websites (pkgdown)
- Shiny applications: dynamic tables in interactive web apps

### Advantages

HTML format provides several distinct benefits:

Every **gt** feature works in HTML output. Colors, fonts, borders, images, nanoplots, complex formatting, and interactive elements all render correctly. This complete feature support makes HTML the most versatile output format.

CSS styling gives precise control over every visual aspect. The `tab_style()` and `tab_options()` functions leverage CSS properties, enabling sophisticated designs. Tables can adapt to different screen sizes through CSS. While **gt** doesn't provide automatic responsive behavior, the HTML output structure allows custom responsive styling.

HTML tables can contain images, icons, formatted text with HTML tags, and even embedded SVG graphics for nanoplots. This embedded content capability makes HTML tables rich and expressive.

HTML supports ARIA attributes and semantic markup, making tables more accessible to screen readers and assistive technologies. Hover effects, tooltips, and other interactive features work naturally in HTML.

### Limitations

Despite its strengths, HTML has constraints:

Viewing requires a web browser or HTML renderer. This isn't always available in print-first workflows. While HTML can be printed, the results often don't match dedicated print formats like PDF. Page breaks, margins, and print-specific styling require additional effort.

Self-contained HTML files embed all styling and can become large, especially with many tables or embedded images. Some email clients or document systems strip CSS or limit HTML capabilities, potentially breaking table layouts.

### Best practices

To maximize HTML output quality:

Different browsers may render CSS slightly differently. Test in major browsers (Chrome, Firefox, Safari) when wide distribution is expected. If embedding many tables or images, consider external CSS files to reduce duplication.

The `opt_*()` family of functions can enhance HTML structure for better accessibility. If the HTML will be printed, test print output and adjust styling as needed. Consider using `@media print` CSS rules for print-specific adjustments.

## LaTeX

LaTeX is the standard for academic and technical document preparation, particularly for PDF generation. **gt** supports LaTeX output, enabling tables to be included in articles, books, reports, and presentations created with LaTeX or R Markdown/Quarto documents that render to PDF.

### Generating LaTeX output

The `as_latex()` function converts a **gt** table to LaTeX code:

```{r}
exibble |>
  dplyr::select(num, char, currency) |>
  dplyr::slice_head(n = 4) |>
  gt() |>
  fmt_number(columns = num, decimals = 1) |>
  fmt_currency(columns = currency) |>
  as_latex()
```

This produces LaTeX table code that can be copied into a `.tex` document or included in R Markdown/Quarto documents with `output: pdf_document`.

When using R Markdown or Quarto with PDF output, **gt** tables automatically render as LaTeX without explicitly calling `as_latex()`.

### Use cases

LaTeX output suits these contexts:

- academic papers: journal articles, conference proceedings, dissertations
- technical reports: research reports, white papers, technical documentation
- books: Academic texts, technical manuals
- presentations: slides with tables
- print-quality PDFs: any scenario requiring precise typographic control

### Advantages

LaTeX brings several benefits for table presentation. It is really good at producing publication-quality output with precise positioning, professional typography, and consistent spacing. Since LaTeX is designed for mathematical typesetting, tables containing equations integrate seamlessly with surrounding mathematical content.

LaTeX's cross-referencing system allows tables to be numbered, labeled, and cited throughout a document. Many academic publishers require or prefer LaTeX submission, making LaTeX tables essential for scholarly communication. LaTeX-generated PDFs are stable, widely compatible, and suitable for archival purposes.

### Limitations

LaTeX output faces several constraints. Not all **gt** features translate to LaTeX. Complex styling, images, web fonts, and nanoplots may not render or may render with reduced fidelity. LaTeX code must be compiled to produce viewable output. This requires a LaTeX distribution (TeX Live, MiKTeX) and can fail if required packages are missing.

Understanding LaTeX table output and troubleshooting rendering issues requires LaTeX knowledge. LaTeX produces static output. Hover effects, tooltips, and other interactive elements don't work.

### Best practices

For optimal LaTeX output always compile LaTeX output to verify it works correctly. Some **gt** features may produce LaTeX code that requires additional packages. Use simpler styles for LaTeX output. Avoid complex CSS-based styling that won't translate well.

If sharing LaTeX code, document required packages so others can compile it successfully. LaTeX tables benefit from proper captions created with `tab_header()`, which translate to LaTeX `\caption{}` commands.

Very wide tables may need special handling in LaTeX (landscape orientation, font size reduction). Plan table dimensions accordingly.

## RTF

Rich Text Format (RTF) is a document format developed by Microsoft that most word processors can read and write. **gt** can generate RTF output, providing a path to word processing applications that may not support HTML or direct R table imports.

### Generating RTF output

The `as_rtf()` function converts a **gt** table to RTF code:

```{r}
towny |>
  dplyr::select(name, population_2021, density_2021) |>
  dplyr::slice_head(n = 4) |>
  gt() |>
  fmt_integer(columns = population_2021) |>
  fmt_number(columns = density_2021, decimals = 0) |>
  cols_label(
    name = "Municipality",
    population_2021 = "Population",
    density_2021 = "Density"
  ) |>
  as_rtf()
```

Save RTF output to a file with `gtsave()`:

```{r eval=FALSE}
my_table |>
  gt() |>
  gtsave("table.rtf")
```

The resulting `.rtf` file can be opened in Microsoft Word, LibreOffice Writer, Google Docs, Apple Pages, and many other word processors.

### Use cases

RTF output serves these scenarios:

- word processor integration: when tables need editing in Word or similar applications
- cross-platform sharing: RTF files open consistently across Windows, macOS, and Linux
- template population: inserting tables into RTF document templates
- legacy systems: organizations with RTF-based workflows or document management systems

### Advantages

RTF offers practical benefits. Nearly every word processor can open RTF files, making them highly portable. Unlike PDFs, RTF tables can be edited after creation. This suits workflows where further refinement in a word processor is expected.

RTF is a text-based format, making it easier to debug or programmatically manipulate than binary formats. No need for Microsoft Office licenses or specific software versions. RTF supports basic formatting like fonts, colors, borders, and cell backgrounds.

### Limitations

RTF has notable constraints. Advanced **gt** features (nanoplots, complex styling, images) may not render correctly or at all. Different word processors interpret RTF slightly differently, potentially causing layout variations.

RTF is a static format without support for interactive elements. It's also an older format with limited development. Modern document features may not be supported. RTF has less sophisticated styling capabilities than HTML, so some visual effects will be approximated or lost.

### Best practices

To work effectively with RTF, use straightforward layouts and basic styling that RTF can reliably represent. If you know which word processor will open the RTF file, test output in that application specifically.

Don't rely on nanoplots, embedded images, or complex CSS effects when generating RTF. Consider RTF as a format for draft tables that will be refined in a word processor rather than final presentation output.

Always check RTF output after opening in the target word processor, as rendering may differ from expectations.

## Word

Microsoft Word is ubiquitous in business and academic settings. While Word can open HTML and RTF files, **gt** can also generate tables directly in Word's native format.

### Generating Word output

The simplest way to create Word output is using `gtsave()` with a `.docx` extension:

```{r eval=FALSE}
gtcars |>
  dplyr::select(mfr, model, hp, msrp) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_currency(columns = msrp, decimals = 0) |>
  tab_header(title = "Top Cars") |>
  gtsave("table.docx")
```

This creates a `.docx` file with the table embedded as a native Word table. The **gt** package handles Word export internally without requiring additional packages.

For more complex document assembly with multiple tables and other content, generate individual table files with `gtsave()` and then import them into a larger Word document using Word's native import or copy-paste functionality.

### Use cases

Word remains the dominant format in many professional settings, making it essential for workflows where compatibility with Microsoft Office ecosystems is expected or required. Understanding when to choose Word output helps ensure your tables reach their audience in the most appropriate format.

Word output is good in corporate and business environments where Word is the standard document format. This includes business reports destined for executives or clients, documents that require review and editing by multiple stakeholders who work primarily in Word, and situations where recipients explicitly require Word format for submission or compliance purposes. The ability to open, review, and comment on tables directly in Word's familiar interface makes this format ideal for collaborative workflows where non-technical users need to interact with the content.

Word format also serves well when tables are part of larger documents that combine text, images, charts, and other elements. If you're populating existing Word templates with data tables or assembling reports where tables appear alongside narrative content, the native `.docx` format ensures smooth integration. The format is particularly valuable when tables need further refinement or customization within Word after initial generation, as recipients can modify table structure, styling, and content using Word's native table editing tools.

### Advantages

Native Word output provides benefits:

Tables are true Word tables, not images or embedded objects, allowing full editing in Word. Tables integrate seamlessly with other Word content such as text, images, charts, page numbers, headers, and footers.

Recipients can view and edit tables using Word's familiar interface. Word's collaboration features (track changes, comments) work with the table content.

Tables can be inserted into Word templates with existing styles and formatting. Word's caption and cross-reference features work with **gt**-generated tables.

### Limitations and best practices

Word format has several constraints. Not all **gt** features translate to Word. Complex styling may be simplified or lost. Word tables cannot display **gt**'s nanoplots or embedded visualizations. Recipients need Microsoft Word or compatible software (LibreOffice, Google Docs) to view the tables within `.docx` files. And different Word versions may render tables slightly differently. The `.docx` format is complex, and programmatic manipulation of generated Word files requires much care.

For effective Word output, open generated Word files to verify tables appear correctly and formatting is preserved. If you need to create documents with multiple tables and other content, generate individual table files and assemble them in Word, or save tables to intermediate formats that can be imported into your document assembly workflow. It's better to avoid extremely complex styling that may not translate well to Word's table model. If recipients will edit tables, structure them for easy modification in Word.

## PNG images

Sometimes you need a table as a static image (either for presentations, infographics, social media posts, or situations where document formats aren't suitable). The **gt** package can render tables as PNG images through `gtsave()`.

### Generating PNG images

Creating PNG images from **gt** tables works through a two-step process: the table is first rendered as HTML, then captured as an image using a headless browser. The **gt** package handles this automatically through its **webshot2** dependency, so you don't need to load any additional packages. However, you do need Chrome or Chromium installed on your system, as **webshot2** uses it to render and capture the HTML output. Once these requirements are met, generating PNG images is as simple as using `gtsave()` with a `.png` extension:

```{r eval=FALSE}
pizzaplace |>
  dplyr::count(type) |>
  dplyr::arrange(desc(n)) |>
  gt(rowname_col = "type") |>
  fmt_integer(columns = n) |>
  cols_label(n = "Orders") |>
  tab_header(title = "Pizza Orders by Type") |>
  gtsave("pizza_table.png")
```

The `gtsave()` function detects the `.png` extension and handles the capture process automatically, determining the optimal image dimensions based on your table's content and styling.

While the default settings often produce good results, you may want to customize the output for specific purposes. The `zoom` argument controls the resolution multiplier (think of it as scaling up the rendering before capture). A `zoom` value of `2` doubles the pixel density, producing higher-resolution images suitable for high-DPI displays or print materials. The default `zoom = 1` works well for standard web use where file size matters more than maximum resolution.

The `expand` argument adds whitespace padding around the table edges, measured in pixels. This prevents the table from butting up against the image boundaries and ensures that borders, shadows, or other edge effects don't get clipped. The padding applies uniformly to all sides, creating a clean margin that makes the table easier to integrate into presentations or documents:

```{r eval=FALSE}
my_table |>
  gtsave(
    "table.png",
    zoom = 2,      # Increase resolution (2x)
    expand = 10    # Add padding around table (pixels)
  )
```

These two parameters work together to give you precise control over the final image. For a high-resolution table destined for a printed poster, you might use `zoom = 3` with `expand = 20`. For a small social media graphic where file size matters, `zoom = 1` with `expand = 5` might suffice. The key is matching the output characteristics to your intended use case, balancing image quality against file size constraints.

### Use cases

PNG images work well across diverse presentation contexts. They're ideal for slide decks in PowerPoint, Keynote, or Google Slides where embedding images is straightforward and reliable. Social media posts on Twitter, LinkedIn, and blogs benefit from PNG tables that display consistently regardless of platform rendering quirks. Graphic designers frequently embed PNG tables in infographics and marketing materials, while small summary tables in email signatures provide quick data snapshots. Documentation often requires screenshots of tables, and PNG format serves this need perfectly. Print graphics like posters, flyers, and handouts can incorporate high-resolution PNG tables that reproduce clearly on paper.

### Advantages and limitations

PNG images offer universal compatibility as such images can be displayed in any image viewer, web browser, or application that shows images (generally with no rendering variations across platforms). Since PNG captures the HTML rendering, all **gt** features (nanoplots, complex styling, colors) appear exactly as designed. Recipients need no special software, just basic image viewing capability. You can generate high-resolution images suitable for print or lower-resolution versions optimized for web use, giving you flexibility for different distribution channels.

However, PNG output comes with significant tradeoffs. Images are completely static: no interactivity, hover effects, or ability to select and copy text. Once rendered, the table cannot be edited and any changes require regenerating the entire image. High-resolution images can become quite large, especially for complex tables with many rows. Text in PNG images doesn't scale like vector text, so zooming reveals pixelation. Accessibility suffers since screen readers cannot extract data from images. Generating PNGs requires Chrome or Chromium, which may not be available in all environments like some server configurations. The rendering process is also slower than generating HTML or text-based formats because it requires launching a headless browser.

### Best practices

For optimal results, match your `zoom` setting to the intended use: use `zoom = 2` or higher for high-DPI displays or print output, but stick with `zoom = 1` for standard web use where file size matters. Use `tab_options()` to set table width before rendering, ensuring the table fits your intended layout. The `expand` argument adds crucial whitespace around table edges, preventing borders or shadows from being clipped (typically 10-20 pixels provides adequate breathing room).

When embedding PNG tables in web content, always provide descriptive alt text for accessibility. If the table will be viewed digitally and you have control over the delivery method, consider whether HTML might better serve your audience by maintaining interactivity and scalability. Reserve PNG format for situations where image format is truly necessary or advantageous, recognizing that you're trading dynamic features for universal compatibility.

## Choosing the right format

Selecting the optimal output format requires balancing multiple considerations: your distribution channel, your audience's capabilities, and your table's complexity. The right choice isn't always obvious, and sometimes you'll need to compromise between competing priorities.

The distribution channel can drive initial choices. If your table will appear on a website, blog, or web-based dashboard, HTML is the clear winner here. After all, it's the web's native format and provides full feature support including interactivity. Academic publications typically demand LaTeX for PDF generation, as most scholarly journals expect or require LaTeX submission for final typesetting. Business environments often standardize on Word, making `.docx` output essential for corporate reports regardless of technical superiority of other formats. Presentations present a genuine choice: PNG images work universally in PowerPoint, Keynote, and Google Slides, but HTML tables embedded in R Markdown or Quarto slides preserve interactivity if your presentation platform supports them. Social media usually requires PNG as it's the only format that displays reliably across all platforms without requiring specialized viewers.

Interactivity requirements can create stark divides. HTML stands alone as the only format supporting hover effects, tooltips, and other dynamic features. If you've invested in nanoplots, complex styling, or interactive elements, choosing any format besides HTML means losing those features. PNG preserves the visual appearance but sacrifices all interactivity. Users can't select text, copy data, or interact with the content (though some operating systems *do* allow for selection/copying of text). For tables where data extraction matters, HTML, Word, and RTF all allow text selection and copying, while PNG locks everything into pixels. This matters more than you might think: a recipient trying to verify a number or pull data into a spreadsheet will be frustrated by a PNG, while the same table in Word or HTML accommodates that workflow naturally.

Post-creation editing tells you whether to choose editable formats and the Word and RTF formats exist specifically for this scenario. When the table you generate will undergo further modification, refinement, or integration into a larger document by someone else. If stakeholders need to adjust wording, update values, or modify structure, these editable formats are essential. HTML and LaTeX can theoretically be edited, but require technical knowledge that most recipients lack. PNG images are completely immutable. So, any change requires regenerating from the source. For final, finished presentations where no editing is expected or desired, any format works, but immutable formats like PNG prevent well-intentioned but potentially problematic modifications.

Table complexity constrains format choices dramatically. Simple tables with basic formatting translate reasonably well to any format, giving you maximum flexibility. But if your table includes nanoplots, embedded images, or sophisticated styling, your options narrow quickly. HTML handles everything as it's designed for complex content and rich formatting. PNG captures complex tables perfectly since it's photographing the HTML rendering, but at the cost of making them static images. LaTeX struggles with modern web-style formatting and won't render nanoplots or images reliably. Word and RTF sit in the middle: they handle basic styling but choke on advanced features. Tables with mathematical notation push you toward LaTeX, which integrates seamlessly with equation typesetting in a way other formats can't match.

Your audience's technical environment matters immensely. PNG works everywhere and literally any device or browser can display images. This universality makes PNG the safe choice when you don't know what software your audience has. HTML similarly works anywhere with a web browser, though some corporate email systems strip styling that could break layouts. Word requires Microsoft Office or compatible software, which is nearly universal in business but less common in some academic or technical communities. LaTeX presumes recipients have LaTeX expertise (a reasonable assumption in mathematics, physics, and computer science departments). RTF offers the broadest word processor compatibility, but it's rarely anyone's first choice for other reasons.

For publication-quality output destined for print, LaTeX produces the most professional typography and precise positioning. High-resolution PNG images can match this quality and work in more contexts, though they lack LaTeX's mathematical typesetting sophistication. Web display always favors HTML and it's designed for screens, supports responsive layouts, and allows interactive exploration. For quick reviews, drafts, or iterative feedback, RTF and Word work fine despite their limitations since the goal is communication rather than perfection. Matching format quality to purpose prevents both over-engineering (LaTeX for an internal draft) and under-delivering (RTF for a final publication).

## Extracting formatted cell values for inline use

When writing data-driven documents, you often need to reference specific values from your tables in the surrounding prose. A table might show that sales increased by 23.7%, and you want that same figure to appear in your narrative text: "Our quarterly results showed a **23.7%** increase over the previous period". Traditionally, this creates a reproducibility problem: you calculate the number in R, format it for the table, then manually type it again in your text. If the underlying data changes, you have to remember to update both locations.

The `extract_cells()` function solves this problem by letting you pull already-formatted cell values directly from a **gt** table. Whatever formatting you've applied (decimal places, currency symbols, percentage signs, scientific notation) comes along with the extracted value. This means your inline references automatically match your table formatting without any additional work. When your data updates, both the table and the prose update together.

### Basic extraction

The `extract_cells()` function takes a **gt** table and returns formatted cell values based on the column and row you specify:

```{r}
sales_table <- 
  dplyr::tibble(
    region = c("North", "South", "East", "West"),
    revenue = c(1234567, 987654, 1567890, 876543),
    growth = c(0.237, 0.156, 0.089, 0.312)
  ) |>
  gt(rowname_col = "region") |>
  fmt_currency(columns = revenue, decimals = 0) |>
  fmt_percent(columns = growth, decimals = 1) |>
  cols_label(revenue = "Revenue", growth = "Growth")

sales_table
```

Now we can extract specific cells. The formatting applied in the table carries through to the extracted value:

```{r}
# Extract the revenue for the North region
extract_cells(sales_table, columns = revenue, rows = "North")
```

```{r}
# Extract the growth percentage for the West region
extract_cells(sales_table, columns = growth, rows = "West")
```

Notice that the extracted revenue value includes the dollar sign and comma separators, while the growth value includes the percentage sign (exactly as they appear in the table).

### Using extracted values in Quarto documents
 
The real power of `extract_cells()` emerges in Quarto documents where you can embed R expressions directly in your prose. Instead of hardcoding values, you reference them dynamically:

```{r eval=FALSE}
The North region generated `r extract_cells(sales_table, columns = revenue, rows = "North")`
in revenue, representing `r extract_cells(sales_table, columns = growth, rows = "North")` 
year-over-year growth.
```

When this document renders, Quarto evaluates the inline R expressions and inserts the formatted values. If your underlying data changes (e.g., the North region's revenue updates to `"$1,345,678"`) both the table and the prose automatically reflect the new figure. No manual synchronization required.
 
This pattern eliminates an entire class of errors. You won't have the situation where a table shows one number while your text shows a slightly different (outdated or mistyped) version. The single source of truth is your **gt** table, and `extract_cells()` lets you tap into it anywhere in your document.

### Extracting multiple cells

You can extract multiple cells at once by specifying multiple rows:

```{r}
# Extract all growth values
extract_cells(sales_table, columns = growth, rows = everything())
```

The result is a character vector with one element per extracted cell. This is useful when you need to reference a range of values or when building dynamic text that incorporates multiple data points.

You can also combine extraction with row selection expressions:

```{r}
# Extract revenue for regions with growth over 20%
extract_cells(sales_table, columns = revenue, rows = growth > 0.2)
```

### Output format considerations

The `extract_cells()` function includes an `output` argument that controls how the extracted values are formatted. By default (`output = "auto"`), it detects the rendering context and chooses appropriately:

- in Quarto HTML documents, it returns HTML-formatted values
- in PDF documents (via LaTeX), it returns LaTeX-formatted values
- in Word documents, it returns Word-compatible formatting
- in the R console, it returns plain text

You can override this behavior when needed:

```{r}
# Force plain text output (strips HTML/LaTeX markup)
extract_cells(sales_table, columns = revenue, rows = "North", output = "plain")
```

```{r}
# Force HTML output (useful for manual HTML document construction)
extract_cells(sales_table, columns = revenue, rows = "North", output = "html")
```

The automatic detection works correctly in most situations, but explicit output specification helps when you're generating content for a specific format or when the automatic detection doesn't match your needs.

## Format conversion strategies

Sometimes you need the same table in multiple formats. Here's an approach where we generate one table and save in multiple formats:

```{r eval=FALSE}
my_table <- gtcars |>
  dplyr::select(mfr, model, msrp) |>
  dplyr::slice_head(n = 5) |>
  gt() |>
  fmt_currency(columns = msrp)

# Save in multiple formats
my_table |> gtsave("table.html")
my_table |> gtsave("table.png")
my_table |> gtsave("table.rtf")
```

The approach above works well when the same table design translates adequately across all formats. But as we've discussed throughout this chapter, different formats have different capabilities and constraints. HTML supports nanoplots and complex styling. LaTeX and RTF cannot do nanoplots and they struggle with complex styling. PNG captures everything visually but sacrifices interactivity. Word sits somewhere in the middle with moderate feature support.

When you need the same table in multiple formats but want each version optimized for its target medium, conditional rendering lets you adjust table construction based on the destination format. Instead of creating one table and hoping it works everywhere, you make intelligent decisions about which features to include, which styling to apply, and how to structure the table based on where it's going. This prevents LaTeX compilation errors from unsupported features, keeps RTF files simple and reliable, and reserves advanced features for formats that can handle them.

Here's a function that demonstrates format-conditional table generation:

```{r eval=FALSE}
generate_table <- function(data, format = "html") {
  
  # Create base table with data
  base_table <-
    data |>
    gt() |>
    tab_header(title = "Vehicle Performance Data")
  
  # Format-specific adjustments
  if (format == "html") {
    
    # HTML gets full styling and nanoplots (if data available)
    if ("mpg_data" %in% names(data)) {

      base_table <-
          base_table |>
          cols_nanoplot(columns = mpg_data, new_col_name = "mpg_plot")
    }
    
    base_table <-
        base_table |>
        fmt_number(columns = where(is.numeric), decimals = 1) |>
        tab_style(
            style = cell_fill(color = "lightblue"),
            locations = cells_body(columns = hp)
        )
      
  } else if (format %in% c("latex", "rtf", "word")) {
    
    # LaTeX, RTF, and Word: skip nanoplots, use simpler formatting
    base_table <-
        base_table |>
        fmt_number(columns = where(is.numeric), decimals = 1)
  }
  
  # Save with appropriate extension
  gtsave(base_table, filename = paste0("table.", format))
}
```

This function creates a base table, then applies format-specific adjustments before saving. The conditional logic recognizes that HTML can handle advanced features like nanoplots and complex styling, while LaTeX, RTF, and Word all receive the same simpler treatment focused on reliable data formatting. These three formats share similar limitations as none can render nanoplots effectively, and all benefit from conservative styling that translates predictably. You'd call this function with your data and desired format: `generate_table(my_data, "html")`, `generate_table(my_data, "latex")`, `generate_table(my_data, "word")`.

The real power emerges when you extend this pattern for sophisticated format-specific optimizations. For HTML output, you might add nanoplots, interactive tooltips via `fmt()` functions with custom HTML, and complex CSS styling through `tab_style()`. For LaTeX, you'd skip the nanoplots entirely, use simpler column alignments, and reduce border complexity. For Word, you might adjust column widths or apply specific formatting knowing that Word's table rendering differs from browsers, though still avoiding features it can't handle. For PNG, you could increase font sizes slightly since the image will be static and needs to remain readable at various scales.

The function could also handle format-specific data presentations. Maybe HTML gets sparklines showing trends, while LaTeX gets a simpler "change" column with up/down arrows using Unicode characters that render reliably in LaTeX. Perhaps Word output includes page number indicators or section references that make sense in document context, while standalone PNG images omit those references since they'll be viewed in isolation. You might even use completely different data subsets: HTML gets the full interactive table with hundreds of rows, while PDF gets a summarized version focusing on key findings.

This conditional approach prevents the lowest-common-denominator problem where you limit all formats to what the weakest format can handle. Instead, each format gets a table optimized for its strengths and constraints.

## Conclusion

The ability to generate tables in multiple formats transforms **gt** from a web-focused tool into a truly universal table creation system. A single table definition can reach audiences across academic papers, business reports, web dashboards, presentations, and social media. Each version is optimized for its destination while maintaining the core data and structure.

Understanding format capabilities matters more than memorizing feature lists. HTML's complete feature support makes it the default choice for digital distribution, but that power becomes irrelevant when your audience needs a Word document for collaborative editing or when journal submission requires LaTeX. The format you choose is rarely about technical superiority, it's more about matching your table to your audience's constraints, expectations, and workflows.

The trade-offs between formats follow predictable patterns. Formats that support editing (Word, RTF) sacrifice advanced features. Formats that preserve complex visualizations (HTML, PNG) limit portability or editability. Formats optimized for print quality (LaTeX, high-resolution PNG) require more setup and expertise. These aren't limitations to work around but inherent characteristics to understand and leverage. When you know what each format does well and what it struggles with, you can make informed decisions rather than discovering constraints through trial and error.

Format-specific optimization represents the professional approach to multi-format publishing. Rather than creating one table and hoping it works everywhere, you design deliberately for each format's strengths while accepting its limitations. HTML gets nanoplots and rich styling. LaTeX gets clean typography and mathematical integration. Word gets editable structure for collaborative refinement. PNG gets universal compatibility at the cost of becoming static. Each format receives what it can handle effectively, and nothing it will render poorly or not at all.

The next time you create a table, consider where it will ultimately appear. That destination, not the table's content, should drive your format choice. A brilliant HTML table with nanoplots and interactive features becomes frustrating when shared as an image on social media where users can't copy the data. An overengineered LaTeX table in an internal draft wastes time that simpler RTF output would serve better. The best table isn't the most technically sophisticated one. Rather it's the one that works effectively in its intended context for its intended audience.


---


# Extension packages {#sec-extension-packages}


The **gt** package has inspired the creation of extension packages that build upon its foundation to solve specialized problems. These packages demonstrate the flexibility of **gt**'s architecture and provide ready-made solutions for common table-making tasks in specific domains. In this chapter, we'll explore two of the most impactful extension packages: **gtsummary** for clinical and analytical summary tables, and **gtExtras** for enhanced visual elements and styling.

Both packages follow a similar philosophy: they wrap **gt**'s functionality to provide sensible defaults for their target use cases while still allowing full access to **gt**'s customization capabilities. This means you can use these packages to quickly generate professional tables and then further refine them using the **gt** functions you've already learned.

## **gtsummary**

The **gtsummary** package provides an elegant way to create publication-ready summary tables and regression model results. Originally developed for biomedical research, it has become an indispensable tool for anyone who needs to present descriptive statistics or model outputs in a professional format.

### The problem **gtsummary** solves

Creating a proper "Table 1" for a research paper involves many tedious steps. You need to calculate summary statistics for continuous and categorical variables, handle missing data appropriately, compare groups using the right statistical tests, and format everything consistently. Before **gtsummary**, this process typically required hundreds of lines of code and careful attention to formatting details. The **gtsummary** package reduces this to just a few lines while producing tables that meet the exacting standards of medical journals.

The package automatically detects variable types and calculates appropriate descriptive statistics. Continuous variables get medians and interquartile ranges (or means and standard deviations), while categorical variables get counts and percentages. Missing values are tracked and reported. When comparing groups, the package selects appropriate statistical tests based on data characteristics.

### Summarizing data with `tbl_summary()`

The `tbl_summary()` function is the workhorse of **gtsummary**. It takes a data frame and produces a formatted summary table with minimal code. The package includes a trial dataset for demonstrating its capabilities, which contains simulated data from 200 patients receiving chemotherapy treatments.

```{r}

library(gtsummary)

trial |>
  select(trt, age, grade, response) |>
  tbl_summary()
```

This simple call produces a table with properly formatted statistics, clear labels, and handling of missing values. The `age` variable is summarized with median and interquartile range because **gtsummary** detected it as continuous. The `grade` variable shows counts and percentages because it's categorical. Missing values are reported as `"Unknown"` at the bottom of each variable's section.

The real power of `tbl_summary()` emerges when comparing groups. By specifying a `by` variable, you can split your summary statistics across treatment arms or other groupings. Adding `add_p()` automatically selects and applies appropriate statistical tests for each variable.

```{r}

trial |>
  select(trt, age, grade, response) |>
  tbl_summary(
    by = trt,
    missing = "ifany",
    label = list(
      age ~ "Patient Age (years)",
      grade ~ "Tumor Grade",
      response ~ "Tumor Response"
    )
  ) |>
  add_p() |>
  add_overall() |>
  modify_header(label = "**Characteristic**") |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Treatment Group**") |>
  bold_labels()
```

This example demonstrates several of **gtsummary**'s customization options. The `label` argument provides custom variable names. The `add_overall()` function adds a column with statistics for all patients combined. The `modify_header()` and `modify_spanning_header()` functions adjust column labels. Finally, `bold_labels()` applies bold formatting to variable names.

### Presenting regression results with `tbl_regression()`

Clinical research frequently involves regression modeling, and **gtsummary** provides `tbl_regression()` to present model results in publication-ready format. The function works with many model types including linear models, logistic regression, Cox proportional hazards models, and mixed effects models.

```{r}

# Fit a logistic regression model
model <- glm(
  response ~ age + stage + grade,
  data = trial,
  family = binomial
)

# Create a formatted table of results
model |>
  tbl_regression(
    exponentiate = TRUE,
    label = list(
      age ~ "Patient Age",
      stage ~ "T Stage",
      grade ~ "Tumor Grade"
    )
  ) |>
  bold_labels()
```

The `exponentiate = TRUE` argument transforms coefficients to odds ratios, which is the standard presentation for logistic regression. Reference categories are automatically identified and marked. The package also provides functions like `add_global_p()` to add overall p-values for categorical variables with multiple levels, though these require additional dependencies.

### Combining multiple tables

Research papers often present multiple models side by side or combine different analyses into a single display. The **gtsummary** package provides `tbl_merge()` and `tbl_stack()` for these situations.

```{r}

# Create two regression tables
model1 <- glm(response ~ age + grade, data = trial, family = binomial)
model2 <- glm(response ~ age + stage, data = trial, family = binomial)

tbl1 <- tbl_regression(model1, exponentiate = TRUE)
tbl2 <- tbl_regression(model2, exponentiate = TRUE)

# Merge them side by side
tbl_merge(
  tbls = list(tbl1, tbl2),
  tab_spanner = c("**Model 1**", "**Model 2**")
)
```

This approach is particularly useful for showing how results change as you add or remove covariates, or for presenting models with different outcomes.

### Converting to **gt** for additional customization

Every **gtsummary** table can be converted to a **gt** object using `as_gt()`, which opens up all of **gt**'s formatting capabilities. This is useful when you need styling options beyond what **gtsummary** provides natively.

```{r}

trial |>
  select(trt, age, marker) |>
  tbl_summary(by = trt) |>
  add_p() |>
  as_gt() |>
  tab_header(
    title = md("**Patient Characteristics by Treatment**"),
    subtitle = "Simulated Clinical Trial Data"
  ) |>
  tab_source_note("Data simulated for demonstration purposes")
```

This workflow demonstrates how **gtsummary** and **gt** complement each other. You get the convenience of **gtsummary**'s automatic calculations and sensible defaults, then add **gt**'s rich formatting options for the final presentation.

## **gtExtras**

While **gtsummary** focuses on statistical summaries, **gtExtras** enhances **gt**'s visual capabilities. **gtExtras** provides functions for adding inline graphics, applying publication-quality themes, and handling common formatting tasks that would otherwise require repetitive code.

### Themes for instant polish

One of **gtExtras**' most immediately useful features is its collection of themes. These functions apply comprehensive styling to transform a basic **gt** table into something that looks like it belongs in a major publication! Each theme adjusts fonts, colors, borders, and spacing to match the visual identity of well-known outlets.

```{r}

library(gtExtras)

# Create a simple summary table
car_data <- 
  mtcars |>
  tibble::rownames_to_column("car") |>
  head(8) |>
  select(car, mpg, hp, wt)

# Apply the FiveThirtyEight theme
car_data |>
  gt() |>
  gt_theme_538() |>
  tab_header(title = "Vehicle Specifications")
```

The `gt_theme_538()` function applies styling inspired by FiveThirtyEight's data journalism. Other available themes include `gt_theme_nytimes()` for New York Times styling, `gt_theme_espn()` for sports-focused tables, and `gt_theme_guardian()` for The Guardian's aesthetic. There's even `gt_theme_excel()` for those times when you need that familiar spreadsheet look.

```{r}

car_data |>
  gt() |>
  gt_theme_nytimes() |>
  tab_header(title = "Vehicle Specifications")
```

These themes handle the tedious details of professional table design, including font choices, cell padding, border styles, and color schemes. They're particularly valuable when you need consistent styling across multiple tables in a report or presentation.

### Inline visualizations with sparklines and bar charts

Tables are really good at showing exact values, while charts reveal patterns and relationships. The **gtExtras** package bridges this gap by embedding small visualizations directly within table cells. These inline graphics help readers quickly grasp trends and comparisons without leaving the tabular format.

Sparklines are miniature line charts that show the shape of data over time or across observations. To create them, you first need to prepare your data so that each row contains a list-column of values to plot.

```{r}

# Prepare data with list columns for plotting
car_summary <- mtcars |>
  group_by(cyl) |>
  summarize(
    n = n(),
    avg_mpg = mean(mpg),
    mpg_data = list(mpg),
    hp_data = list(hp),
    .groups = "drop"
  )

# Create table with sparklines
car_summary |>
  gt() |>
  gt_plt_sparkline(mpg_data, same_limit = TRUE, label = FALSE) |>
  gt_plt_sparkline(hp_data, same_limit = FALSE, label = FALSE) |>
  fmt_number(avg_mpg, decimals = 1) |>
  cols_label(
    cyl = "Cylinders",
    n = "Count",
    avg_mpg = "Avg MPG",
    mpg_data = "MPG Distribution",
    hp_data = "HP Distribution"
  ) |>
  tab_header(title = "Vehicle Statistics by Cylinder Count")
```

The `gt_plt_sparkline()` function converts each list-column into a small line chart. The `same_limit` argument controls whether all sparklines share the same y-axis scale (useful for direct comparisons) or each gets its own scale (useful for showing patterns regardless of magnitude).

For categorical comparisons, bar charts often work better than line charts. The `gt_plt_bar_pct()` function creates horizontal bars that represent values as percentages of the maximum.

```{r}

mtcars |>
  tibble::rownames_to_column("car") |>
  select(car, mpg, hp) |>
  head(8) |>
  gt() |>
  gt_plt_bar_pct(mpg, fill = "steelblue", scaled = FALSE) |>
  gt_plt_bar_pct(hp, fill = "darkred", scaled = FALSE) |>
  cols_width(
    mpg ~ px(120),
    hp ~ px(120)
  )
```

These bar visualizations make it immediately apparent which cars have the highest or lowest values for each metric, without requiring readers to mentally compare numbers.

### Distribution plots

Sometimes you want to show not just the values themselves but their distribution. The `gt_plt_dist()` function can create density plots or histograms within table cells, giving readers insight into the spread and shape of your data.

```{r}

mtcars |>
  group_by(cyl) |>
  summarize(
    n = n(),
    mean_mpg = mean(mpg),
    mpg_dist = list(mpg),
    .groups = "drop"
  ) |>
  gt() |>
  gt_plt_dist(mpg_dist, type = "density", line_color = "darkblue", fill_color = "lightblue") |>
  fmt_number(mean_mpg, decimals = 1) |>
  cols_label(
    cyl = "Cylinders",
    n = "Count",
    mean_mpg = "Mean MPG",
    mpg_dist = "Distribution"
  )
```

Distribution plots are especially valuable when comparing groups. At a glance, you can see not just the central tendency but also the spread and shape of each group's data.

### Color scales and conditional formatting

The **gtExtras** package provides several functions for applying color scales to numeric data. The `gt_color_rows()` function applies a color gradient across specified columns, making it easy to spot high and low values.

```{r}

mtcars |>
  tibble::rownames_to_column("car") |>
  select(car, mpg, hp, wt, qsec) |>
  head(10) |>
  gt() |>
  gt_color_rows(
    mpg,
    palette = "ggsci::green_material"
  ) |>
  gt_color_rows(
    hp,
    palette = "ggsci::red_material"
  ) |>
  gt_color_rows(
    wt:qsec,
    palette = "ggsci::blue_material"
  )
```

The `palette` argument accepts color palettes from the paletteer package, giving you access to hundreds of carefully designed color schemes. You can also specify custom colors using the standard **gt** approach.

For a more distinctive look, `gt_hulk_col_numeric()` applies a purple-to-green gradient that works well for highlighting ranges of values.

```{r}

mtcars |>
  tibble::rownames_to_column("car") |>
  select(car, mpg, hp, wt) |>
  head(8) |>
  gt() |>
  gt_hulk_col_numeric(mpg) |>
  gt_hulk_col_numeric(hp) |>
  gt_hulk_col_numeric(wt)
```

### Merging and stacking cells

The **gtExtras** package includes helper functions for common cell manipulations. The `gt_merge_stack()` function combines two columns into one, with the second value displayed below the first in a smaller font. This technique is useful for showing primary and secondary information without using extra columns.

```{r}

mtcars |>
  tibble::rownames_to_column("car") |>
  mutate(
    car_info = car,
    car_detail = paste(cyl, "cyl,", gear, "gear")
  ) |>
  select(car_info, car_detail, mpg, hp) |>
  head(8) |>
  gt() |>
  gt_merge_stack(col1 = car_info, col2 = car_detail) |>
  cols_label(car_info = "Vehicle")
```

This stacked presentation saves horizontal space while keeping related information visually connected.

### Highlighting rows and columns

When you want to draw attention to specific parts of your table, `gt_highlight_rows()` and `gt_highlight_cols()` provide quick ways to apply background colors.

```{r}

mtcars |>
  tibble::rownames_to_column("car") |>
  select(car, mpg, hp, wt) |>
  head(8) |>
  gt() |>
  gt_highlight_rows(
    rows = mpg > 20,
    fill = "lightgreen",
    bold_target_only = TRUE,
    target_col = mpg
  )
```

The `bold_target_only` argument lets you emphasize the value that triggered the highlighting while keeping other columns in their normal weight.

### Adding images and icons

Tables in modern reports often need to include images, logos, or icons. The **gtExtras** package simplifies this with functions like `gt_img_rows()` for embedding images and `gt_fa_rating()` for adding icon-based ratings.

```{r}

data.frame(
  product = c("Widget A", "Widget B", "Widget C"),
  rating = c(4, 3, 5),
  trend = c("up", "down", "same")
) |>
  gt() |>
  gt_fa_rating(rating, icon = "star", color = "gold") |>
  gt_fa_rank_change(trend, font_color = "match")
```

The `gt_fa_rating()` function converts numeric ratings to filled icons, while `gt_fa_rank_change()` adds directional arrows or indicators based on categorical values.

### When to use each package

The **gtsummary** and **gtExtras** packages serve different but complementary purposes. Use **gtsummary** when you need to present statistical summaries or regression results, particularly in clinical or research contexts. The package's automatic calculations and journal-ready defaults will save significant time and reduce errors. Use **gtExtras** when you need enhanced visual elements like sparklines, color scales, or themed styling. The package is great at making data patterns visible within a tabular format.

Many projects benefit from both packages. You might use **gtsummary** to create a baseline characteristics table, then use **gtExtras** themes to style it consistently with other tables in your report. Or you might start with a **gtExtras**-styled data table and add it alongside **gtsummary** regression results. Since both packages ultimately produce **gt** objects, you can combine their outputs using **gt**'s own functions for merging and arranging tables.

As you develop your table-making skills, these extension packages become valuable tools in your toolkit. They handle common tasks efficiently while remaining flexible enough for customization. In the next chapter, we'll explore how you can create your own **gt** extensions to share solutions with the broader community.

## Summary

This chapter has introduced two powerful extension packages that build upon **gt**'s foundation: **gtsummary** for statistical summary tables and **gtExtras** for enhanced visual elements.

The key capabilities we've explored:

- **gtsummary** transforms statistical analysis into publication-ready tables. `tbl_summary()` creates descriptive statistics tables with automatic variable detection and appropriate statistics. `tbl_regression()` formats model outputs with proper coefficient presentation. `tbl_merge()` and `tbl_stack()` combine multiple tables for comprehensive reporting.
- **gtExtras** adds visual enhancements and convenience functions. `gt_plt_sparkline()` embeds trend lines within cells. `gt_color_rows()` and `gt_highlight_rows()` apply conditional formatting. Theme functions like `gt_theme_538()` and `gt_theme_espn()` provide polished preset styles. `gt_fa_rating()` and related functions add icon-based displays.
- integration with **gt**: both packages produce **gt** objects, meaning you can further customize their output using any **gt** function. Apply additional formatting, add footnotes, adjust styling (the full **gt** toolkit remains available).
- complementary purposes: use **gtsummary** when you need statistically rigorous summary tables, especially in research or clinical contexts. Use **gtExtras** when you want enhanced visuals, sparklines, or quick access to polished themes.

Extension packages embody a powerful pattern: domain experts identifying common needs and encoding solutions in reusable code. The tables they produce meet professional standards while requiring minimal code from users.

The final chapter shows how you can create your own extensions, building functions and packages that address the specific table-making challenges in your domain.


---


# Creating extensions {#sec-creating-extensions}


The **gt** ecosystem includes packages that demonstrate what becomes possible when developers build upon its foundation. Packages like [**gtsummary**](https://github.com/ddsjoberg/gtsummary) transform statistical models and data summaries into publication-ready tables. Others like [**gtExtras**](https://github.com/jthomasmock/gtExtras) provide themes, helper functions, and enhanced visualizations. The [**pointblank**](https://github.com/rstudio/pointblank) package uses **gt** to generate comprehensive data validation reports, presenting quality checks and test results in well-formatted tables. Each identified gaps between what analysts needed and what **gt** alone provided, then filled those gaps with useful extensions.

In this chapter, we'll explore how you might create your own extensions. Perhaps you work in a domain with specialized reporting requirements. Perhaps your organization has established table styles that should be applied consistently. Perhaps you've found yourself copying the same sequences of **gt** function calls across projects and want to encapsulate that workflow. Whatever the motivation, extending **gt** through your own package opens possibilities that using **gt** directly cannot match.

The rewards extend beyond personal convenience. A well-designed extension package creates institutional value. New team members can produce properly formatted tables without learning every **gt** option. Reports maintain visual consistency across authors and time periods. Domain-specific conventions become encoded in functions rather than documented in style guides that may not be followed. The investment in creating such a package pays dividends far exceeding the initial effort.

We'll examine three complementary approaches to extension. First, creating functions that generate complete display tables from data summaries, taking raw data or statistical objects and producing finished tables ready for publication. Second, building wrapper functions that modify or enhance tables created elsewhere, adding consistent styling or domain-specific elements. Third, developing more ambitious extensions that push **gt** into new territory. Throughout, we'll provide concrete, working examples that illustrate not just what to do but why certain design choices lead to better outcomes.

## Creating display tables to augment data summaries

The most impactful extensions often emerge from recognizing patterns in your own work. You perform a particular analysis, format the results as a table, apply certain styling, and repeat this process dozens or hundreds of times. Each repetition involves the same conceptual steps but implemented anew, with opportunities for inconsistency and error at every turn.

Consider the task of summarizing a dataset's structure. Data scientists frequently need to document what variables a dataset contains, their types, the presence of missing values, and basic distributional properties. This information helps colleagues understand the data, aids in quality control, and provides essential context for downstream analyses. Yet creating such summaries manually is tedious, and the results vary based on who creates them and when.

### A dataset overview function

Let's build a function that produces a comprehensive dataset overview table. The function should accept any data frame and return a **gt** table documenting its structure:

```{r}
create_data_overview <- function(data, title = NULL) {
  
  # Build a summary data frame with one row per column
  summary_df <-
    dplyr::tibble(
      variable = names(data),
      type = sapply(data, function(x) class(x)[1]),
      n_missing = sapply(data, function(x) sum(is.na(x))),
      pct_missing = sapply(data, function(x) mean(is.na(x)) * 100),
      n_unique = sapply(data, function(x) length(unique(x)))
    )
  
  # Add example values (first non-NA value)
  summary_df$example <- 
    sapply(data, function(x) {
      non_na <- x[!is.na(x)]
      if (length(non_na) == 0) {
        return(NA_character_)
      }
      val <- non_na[1]
      if (is.numeric(val)) {
        format(round(val, 3), nsmall = 3)
      } else if (inherits(val, "Date")) {
        as.character(val)
      } else {
        as.character(val)
      }
    }
  )
  
  # Create the gt table
  tbl <- 
    summary_df |>
    gt() |>
    tab_header(
      title = if (is.null(title)) "Dataset Overview" else title,
      subtitle = paste0(nrow(data), " rows × ", ncol(data), " columns")
    ) |>
    cols_label(
      variable = "Variable",
      type = "Type",
      n_missing = "Missing (n)",
      pct_missing = "Missing (%)",
      n_unique = "Unique Values",
      example = "Example"
    ) |>
    fmt_number(columns = pct_missing, decimals = 1) |>
    fmt_integer(columns = c(n_missing, n_unique)) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_body(columns = variable)
    ) |>
    data_color(
      columns = pct_missing,
      palette = c("white", "orange", "red"),
      domain = c(0, 100)
    ) |>
    tab_source_note(
      source_note = paste("Generated on", Sys.Date())
    ) |>
    opt_stylize(style = 1) |>
    opt_horizontal_padding(scale = 2)
  
  return(tbl)
}
```

This function encapsulates substantial complexity. It calculates summary statistics for each column, formats them appropriately, applies visual styling that highlights potential data quality issues (the color gradient on missing percentages draws attention to problematic columns), and documents when the overview was created. A user need only call `create_data_overview(my_data)` to receive a finished table.

Let's see it in action with the `towny` dataset:

```{r}
create_data_overview(towny, title = "Towny Dataset Structure")
```

The table immediately reveals the dataset's structure. We see numeric columns, character columns, and their properties. Missing value percentages are color-coded, making it easy to spot columns that might need attention. The example values provide concrete illustrations of what each column contains.

### Thinking about function design

Several design decisions in this function merit discussion. The function returns a **gt** table object rather than printing it directly. This allows users to further modify the result if needed, adding footnotes, changing colors, or applying additional formatting. If the function printed the table and returned invisibly, such modifications would be impossible.

The `title` parameter has a sensible default but allows customization. This pattern appears throughout well-designed **gt** extensions: provide defaults that work for most cases while allowing users to override them when circumstances warrant.

The color gradient on missing percentages demonstrates a broader principle: visual encoding should convey meaning. Rather than requiring users to scan a column of numbers, the color immediately signals which variables have concerning levels of missingness. This is not mere decoration but purposeful use of visual channels to communicate information.

The timestamp in the source note serves a documentation purpose. When the table appears in a report weeks or months later, readers know when the summary was generated. If the underlying data changes, outdated overviews can be identified and refreshed.

### A correlation matrix function

Let's develop another example: a function that creates publication-ready correlation tables. Correlation matrices are ubiquitous in statistical reporting, yet the default outputs from R's `cor()` function are bare numeric matrices unsuitable for publication. Our function will transform them into properly formatted tables with visual highlighting:

```{r}
create_correlation_table <- function(
  data, 
  method = "pearson",
  title = NULL,
  decimals = 2
) {

  # Select only numeric columns
  numeric_data <- data |> select(where(is.numeric))

  if (ncol(numeric_data) < 2) {
    stop("Data must contain at least two numeric columns")
  }

  # Calculate correlations
  cor_matrix <- cor(numeric_data, use = "pairwise.complete.obs", method = method)

  # Convert to data frame for gt
  cor_df <- as.data.frame(cor_matrix)
  cor_df <- tibble::rownames_to_column(cor_df, var = "variable")

  # Method label for subtitle

  method_label <- switch(method,
    pearson = "Pearson",
    spearman = "Spearman",
    kendall = "Kendall"
  )

  # Build the table
  tbl <-
    cor_df |>
    gt(rowname_col = "variable") |>
    tab_header(
      title = if (is.null(title)) "Correlation Matrix" else title,
      subtitle = paste(method_label, "correlation coefficients")
    ) |>
    fmt_number(columns = everything(), decimals = decimals) |>
    data_color(
      columns = everything(),
      palette = c("#B2182B", "#FDDBC7", "white", "#D1E5F0", "#2166AC"),
      domain = c(-1, 1)
    ) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_stub()
    ) |>
    sub_values(
      values = 1,
      replacement = ""
    ) |>
    opt_stylize(style = 1) |>
    opt_horizontal_padding(scale = 2) |>
    cols_width(everything() ~ px(70))

  return(tbl)
}
```

The function handles several details that users would otherwise need to address manually. It selects only numeric columns, computes correlations with appropriate handling of missing values, applies a diverging color palette centered on zero (so positive correlations appear blue, negative correlations appear red, and values near zero remain white), and replaces the diagonal values of `1` with empty strings since the correlation of a variable with itself is trivially perfect and not informative.

Testing with the `gtcars` dataset reveals the function's output:

```{r}
gtcars |>
  select(mpg_c, mpg_h, hp, hp_rpm, trq, trq_rpm) |>
  create_correlation_table(title = "Vehicle Performance Correlations")
```

The color encoding immediately reveals patterns. Strong positive correlations appear in deep blue, strong negative correlations in deep red. A reader scanning this table can instantly identify which variables move together and which move in opposition, without parsing individual numbers. The blank diagonal removes visual clutter, and the consistent formatting presents a polished appearance suitable for publication.

### Building a descriptive statistics function

Descriptive statistics tables appear in virtually every research paper and many business reports. Yet producing them typically requires either tedious manual work or wrestling with packages that provide more than you need. A focused function can streamline this common task:

```{r}
create_descriptive_stats <- function(
  data,
  variables = NULL,
  statistics = c("n", "mean", "sd", "min", "max"),
  by = NULL,
  decimals = 2,
  title = NULL
) {
  
  # Select variables to summarize
  if (is.null(variables)) {
    numeric_vars <- names(data)[sapply(data, is.numeric)]
  } else {
    numeric_vars <- variables
  }
  
  # Define statistic functions
  stat_fns <- list(
    n = function(x) sum(!is.na(x)),
    mean = function(x) mean(x, na.rm = TRUE),
    sd = function(x) sd(x, na.rm = TRUE),
    min = function(x) min(x, na.rm = TRUE),
    max = function(x) max(x, na.rm = TRUE),
    median = function(x) median(x, na.rm = TRUE),
    q25 = function(x) quantile(x, 0.25, na.rm = TRUE),
    q75 = function(x) quantile(x, 0.75, na.rm = TRUE)
  )
  
  # Calculate statistics for each variable
  if (is.null(by)) {
    # Overall statistics
    results <- lapply(numeric_vars, function(var) {
        vals <- data[[var]]
        stats <- sapply(statistics, function(s) stat_fns[[s]](vals))
        c(variable = var, stats)
    })
    
  summary_df <- as.data.frame(do.call(rbind, results))
  
  # Convert numeric columns
  for (stat in statistics) {
      summary_df[[stat]] <- as.numeric(summary_df[[stat]])
  }

  } else {

  # Statistics by group
  groups <- unique(data[[by]])
  results <- list()
    
  for (var in numeric_vars) {
    for (grp in groups) {
      vals <- data[[var]][data[[by]] == grp]
      stats <- sapply(statistics, function(s) stat_fns[[s]](vals))
      results[[length(results) + 1]] <- c(
        variable = var, 
        group = as.character(grp), 
        stats
      )
    }
  }

  summary_df <- as.data.frame(do.call(rbind, results))
  
    for (stat in statistics) {
      summary_df[[stat]] <- as.numeric(summary_df[[stat]])
    }
  }
  
  # Statistic labels
  stat_labels <- 
    c(
      n = "N",
      mean = "Mean",
      sd = "SD",
      min = "Min",
      max = "Max",
      median = "Median",
      q25 = "Q1",
      q75 = "Q3"
    )
  
  # Build the gt table
  if (is.null(by)) {
    tbl <-
      summary_df |>
      gt(rowname_col = "variable") |>
      tab_stubhead(label = "Variable") |>
      fmt_number(columns = where(is.numeric), decimals = decimals) |>
      fmt_integer(columns = any_of("n")) |>
      cols_label(.list = setNames(
        as.list(stat_labels[statistics]), 
        statistics
      ))

  } else {
    tbl <-
      summary_df |>
      gt(rowname_col = "variable", groupname_col = "group") |>
      tab_stubhead(label = "Variable") |>
      fmt_number(columns = where(is.numeric), decimals = decimals) |>
      fmt_integer(columns = any_of("n")) |>
      cols_label(.list = setNames(
        as.list(stat_labels[statistics]), 
        statistics
      ))
  }
  
  tbl <-
    tbl |>
    tab_header(title = if (is.null(title)) "Descriptive Statistics" else title) |>
    opt_stylize(style = 1) |>
    opt_horizontal_padding(scale = 2)
  
  return(tbl)
}
```

This function provides flexibility in what statistics to compute, allowing users to select from a menu of common options. The `by` parameter enables grouped analyses, producing side-by-side comparisons across categories. Let's see both use cases:

```{r}
gtcars |>
  create_descriptive_stats(
    variables = c("mpg_c", "mpg_h", "hp", "trq"),
    statistics = c("n", "mean", "sd", "min", "median", "max"),
    title = "Vehicle Performance Metrics"
  )
```

And now with grouping by vehicle drivetrain:

```{r}
gtcars |>
  create_descriptive_stats(
    variables = c("mpg_c", "hp"),
    statistics = c("n", "mean", "sd"),
    by = "drivetrain",
    title = "Performance by Drivetrain Type"
  )
```

The grouped version organizes results by drivetrain type, making comparisons across vehicle configurations straightforward. Someone reading this table could immediately see how city fuel economy and horsepower differ between all-wheel drive, rear-wheel drive, and other configurations.

## Providing wrapper functions to modify the table outputs

Not every extension needs to create tables from scratch. Sometimes the greater need is to modify existing tables in consistent ways. A wrapper function takes a **gt** table as input, applies transformations, and returns the modified table. This approach is great when you want to enforce organizational styling, add standard elements like logos or disclaimers, or provide convenient shortcuts for common formatting patterns.

### A theming function for organizational branding

Organizations often have visual identity guidelines specifying colors, fonts, and other design elements. Creating a theming function ensures that all tables produced across the organization share a consistent appearance:

```{r}
apply_corporate_theme <- function(
  gt_tbl,
  primary_color = "#1E3A5F",
  accent_color = "#E85D04",
  header_font = "Georgia",
  body_font = "Arial"
) {
  
  gt_tbl |>
    tab_options(
      # Header styling
      heading.background.color = primary_color,
      heading.title.font.size = px(18),
      heading.subtitle.font.size = px(14),
      
      # Column labels
      column_labels.background.color = primary_color,
      column_labels.font.weight = "bold",
      
      # Table body
      table.font.size = px(13),
      
      # Row striping
      row.striping.background_color = "#F5F5F5",
      row.striping.include_stub = TRUE,
      row.striping.include_table_body = TRUE,
      
      # Borders
      table_body.hlines.color = "#E0E0E0",
      table_body.vlines.color = "transparent",
      
      # Footer
      footnotes.font.size = px(11),
      source_notes.font.size = px(11)
    ) |>
    tab_style(
      style = cell_text(
        color = "white",
        font = header_font
      ),
      locations = list(
        cells_title(),
        cells_column_labels()
      )
    ) |>
    tab_style(
      style = cell_text(font = body_font),
      locations = cells_body()
    ) |>
    tab_style(
      style = cell_borders(
        sides = "bottom",
        color = accent_color,
        weight = px(3)
      ),
      locations = cells_column_labels()
    )
}
```

This theme function transforms any **gt** table to match corporate standards. The deep blue primary color establishes professionalism, the orange accent provides visual interest, and the specified fonts ensure consistency. Let's apply it to a simple table:

```{r}
gtcars |>
  select(mfr, model, year, hp, mpg_c) |>
  slice_head(n = 8) |>
  gt() |>
  tab_header(
    title = "Vehicle Performance Summary",
    subtitle = "Selected models from our database"
  ) |>
  fmt_integer(columns = c(year, hp)) |>
  fmt_number(columns = mpg_c, decimals = 1) |>
  cols_label(
    mfr = "Manufacturer",
    model = "Model",
    year = "Year",
    hp = "Horsepower",
    mpg_c = "City MPG"
  ) |>
  apply_corporate_theme()
```

Any table passed through `apply_corporate_theme()` acquires the organizational look. The function demonstrates how wrapper functions can encapsulate substantial complexity while providing a simple interface. Users need not understand the dozens of `tab_options()` parameters, they simply apply the theme.

### Adding standard elements

Some contexts require standard elements on all tables: disclaimers, data sources, or organizational logos. A wrapper function can add these consistently:

```{r}
add_report_footer <- function(
  gt_tbl,
  data_source = NULL,
  disclaimer = NULL,
  include_date = TRUE
) {
  
  # Add data source if provided
  if (!is.null(data_source)) {
    gt_tbl <-
      gt_tbl |>
      tab_source_note(
        source_note = paste("Data Source:", data_source)
      )
  }
  
  # Add disclaimer if provided
  if (!is.null(disclaimer)) {
    gt_tbl <-
      gt_tbl |>
      tab_source_note(
        source_note = md(paste0("*", disclaimer, "*"))
      )
  }
  
  # Add generation date
  if (include_date) {
    gt_tbl <-
      gt_tbl |>
      tab_source_note(
        source_note = paste("Report generated:", format(Sys.Date(), "%B %d, %Y"))
      )
  }
  
  return(gt_tbl)
}
```

This function adds a customizable footer section to any table. Used consistently, it ensures that all tables in a report carry appropriate attribution and disclaimers:

```{r}
towny |>
  select(name, land_area_km2, population_2021, density_2021) |>
  slice_max(population_2021, n = 5) |>
  gt() |>
  tab_header(title = "Ontario's Largest Municipalities") |>
  fmt_integer(columns = c(population_2021, density_2021)) |>
  fmt_number(columns = land_area_km2, decimals = 1) |>
  cols_label(
    name = "Municipality",
    land_area_km2 = "Area (km²)",
    population_2021 = "Population",
    density_2021 = "Density"
  ) |>
  add_report_footer(
    data_source = "Statistics Canada, 2021 Census",
    disclaimer = "Figures subject to revision"
  )
```

### A significance highlighting function

In statistical reporting, highlighting significant results is common practice. Rather than manually applying conditional formatting each time, a wrapper function can standardize this process:

```{r}
highlight_significant <- function(
  gt_tbl,
  columns,
  threshold = 0.05,
  highlight_color = "#E8F5E9",
  bold = TRUE
) {
  
  # Apply background color to significant cells
  gt_tbl <-
    gt_tbl |>
    tab_style(
      style = cell_fill(color = highlight_color),
      locations = cells_body(
        columns = {{ columns }},
        rows = .data[[rlang::as_name(rlang::enquo(columns))]] < threshold
      )
    )
  
  # Optionally bold the significant values
  if (bold) {
    gt_tbl <-
      gt_tbl |>
      tab_style(
        style = cell_text(weight = "bold"),
        locations = cells_body(
          columns = {{ columns }},
          rows = .data[[rlang::as_name(rlang::enquo(columns))]] < threshold
        )
      )
  }
  
  return(gt_tbl)
}
```

This function takes a p-value column and highlights cells below the significance threshold. The visual emphasis draws attention to statistically significant findings without requiring readers to scan through numbers.

### Building flexible style appliers

Sometimes you want to provide several pre-built styles that users can select. A style applier function with multiple options gives users flexibility while maintaining consistency:

```{r}
apply_table_style <- function(
  gt_tbl, 
  style = c("minimal", "striped", "bordered", "scientific")
) {
  
  style <- match.arg(style)

  if (style == "minimal") {
    gt_tbl <-
      gt_tbl |>
      tab_options(
        table_body.hlines.color = "transparent",
        table_body.vlines.color = "transparent",
        column_labels.border.bottom.color = "black",
        column_labels.border.bottom.width = px(2),
        table_body.border.bottom.color = "black",
        table_body.border.bottom.width = px(2)
      )
      
  } else if (style == "striped") {
    gt_tbl <- 
      gt_tbl |>
      opt_row_striping() |>
      tab_options(
        row.striping.background_color = "#F8F9FA",
        table_body.hlines.color = "transparent"
      )
      
  } else if (style == "bordered") {
    gt_tbl <-
      gt_tbl |>
      tab_options(
        table_body.hlines.color = "#DEE2E6",
        table_body.vlines.color = "#DEE2E6",
        column_labels.border.bottom.color = "#343A40",
        column_labels.border.bottom.width = px(2)
      ) |>
      tab_style(
        style = cell_borders(
          sides = c("left", "right"),
          color = "#DEE2E6"
        ),
        locations = cells_body()
      )
      
  } else if (style == "scientific") {
    gt_tbl <-
      gt_tbl |>
      tab_options(
        table.font.size = px(11),
        heading.title.font.size = px(13),
        heading.subtitle.font.size = px(11),
        table_body.hlines.color = "transparent",
        column_labels.border.bottom.color = "black",
        column_labels.border.top.color = "black",
        table_body.border.bottom.color = "black"
      ) |>
      tab_style(
        style = cell_text(size = px(10)),
        locations = cells_source_notes()
      )
  }
  
  return(gt_tbl)
}
```

Users can select from predefined styles while the function handles all the underlying options:

```{r}
base_table <-
  exibble |>
  select(char, num, currency) |>
  slice(1:5) |>
  gt() |>
  tab_header(title = "Style Comparison", subtitle = "Scientific style") |>
  fmt_number(columns = num, decimals = 2) |>
  fmt_currency(columns = currency)

base_table |>
  apply_table_style(style = "scientific")
```

## Implementation ideas

The examples thus far demonstrate foundational patterns. This section explores more ambitious possibilities: extensions that push into specialized domains or provide capabilities not easily achieved with basic **gt** usage.

### Comparison table generator

Many reports require side-by-side comparisons with calculated differences. A specialized function can automate this pattern:

```{r}
create_comparison_table <- function(
  data,
  group_col,
  value_cols,
  group_labels = NULL,
  show_difference = TRUE,
  show_pct_change = TRUE,
  decimals = 1
) {
  
  groups <- unique(data[[group_col]])
  
  if (length(groups) != 2) {
    stop("Comparison requires exactly two groups")
  }
  
  # Split data by group
  group1_data <- data[data[[group_col]] == groups[1], ]
  group2_data <- data[data[[group_col]] == groups[2], ]
  
  # Create comparison data frame
  comparison_df <- dplyr::tibble(metric = value_cols)

  # Get values for each group (assuming single row per group or aggregating)
  comparison_df[[as.character(groups[1])]] <- sapply(value_cols, function(v) {
    mean(group1_data[[v]], na.rm = TRUE)
  })

  comparison_df[[as.character(groups[2])]] <- sapply(value_cols, function(v) {
    mean(group2_data[[v]], na.rm = TRUE)
  })
  
  # Calculate differences
  if (show_difference) {
    comparison_df$difference <- 
      comparison_df[[as.character(groups[2])]] -
      comparison_df[[as.character(groups[1])]]
  }

  if (show_pct_change) {
    comparison_df$pct_change <-
    (comparison_df[[as.character(groups[2])]] - 
    comparison_df[[as.character(groups[1])]]) /
    comparison_df[[as.character(groups[1])]] * 100
  }
  
  # Build table
  tbl <-
    comparison_df |>
    gt(rowname_col = "metric") |>
    fmt_number(
      columns = c(as.character(groups[1]), as.character(groups[2])), 
      decimals = decimals
    )
  
  if (show_difference) {
    tbl <-
      tbl |>
      fmt_number(
        columns = difference,
        decimals = decimals,
        force_sign = TRUE
      ) |>
      tab_style(
        style = cell_text(color = "green"),
        locations = cells_body(columns = difference, rows = difference > 0)
      ) |>
      tab_style(
        style = cell_text(color = "red"),
        locations = cells_body(columns = difference, rows = difference < 0)
      )
  }
  
  if (show_pct_change) {
    tbl <-
      tbl |>
      fmt_number(
        columns = pct_change,
        decimals = 1,
        force_sign = TRUE, 
        pattern = "{x}%"
      ) |>
      tab_style(
        style = cell_text(color = "green"),
        locations = cells_body(columns = pct_change, rows = pct_change > 0)
      ) |>
      tab_style(
        style = cell_text(color = "red"),
        locations = cells_body(columns = pct_change, rows = pct_change < 0)
      )
  }
  
  # Apply labels if provided
  if (!is.null(group_labels) && length(group_labels) == 2) {
    tbl <-
      tbl |>
      cols_label(
        !!as.character(groups[1]) := group_labels[1],
        !!as.character(groups[2]) := group_labels[2]
      )
  }
  
  if (show_difference) {
    tbl <- tbl |> cols_label(difference = "Diff")
  }
  if (show_pct_change) {
    tbl <- tbl |> cols_label(pct_change = "% Change")
  }
  
  tbl <-
    tbl |>
    tab_header(title = "Comparison Analysis") |>
    tab_stubhead(label = "Metric") |>
    opt_stylize(style = 1)
  
  return(tbl)
}
```

The function handles the tedious work of pivoting data, calculating differences, and applying conditional formatting. The color coding for positive and negative changes provides immediate visual feedback:

```{r}
# Create sample comparison data
comparison_data <-
  dplyr::tibble(
    period = c("Q1", "Q1", "Q2", "Q2"),
    revenue = c(125000, 142000, 125000, 142000),
    expenses = c(98000, 105000, 98000, 105000),
    customers = c(1250, 1340, 1250, 1340)
  ) |>
  dplyr::filter(row_number() <= 2 | row_number() > 2) |>
  dplyr::distinct()

# Simpler approach: create pre-aggregated data
quarterly_metrics <-
  dplyr::tibble(
    quarter = c("Q1 2024", "Q2 2024"),
    revenue = c(125000, 142000),
    expenses = c(98000, 105000),
    customers = c(1250, 1420)
  )

quarterly_metrics |>
  create_comparison_table(
    group_col = "quarter",
    value_cols = c("revenue", "expenses", "customers"),
    group_labels = c("Q1 2024", "Q2 2024")
  )
```

### A grading or scoring table function

Educational and assessment contexts often require tables that map numeric scores to letter grades or performance categories. A specialized function can standardize this presentation:

```{r}
create_grade_table <- function(
  data,
  name_col,
  score_col,
  max_score = 100,
  grade_breaks = c(90, 80, 70, 60),
  grade_labels = c("A", "B", "C", "D", "F"),
  show_percentage = TRUE,
  title = "Grade Report"
) {
  
  # Calculate percentages and grades
  result_df <-
    data |>
    mutate(
      percentage = .data[[score_col]] / max_score * 100,
      grade = cut(
        percentage,
        breaks = c(Inf, grade_breaks, -Inf),
        labels = grade_labels,
        right = FALSE
      )
    ) |>
    select(all_of(c(name_col, score_col)), percentage, grade) |>
    arrange(desc(percentage))
  
  # Grade colors
  grade_colors <- c(
    "A" = "#4CAF50",
    "B" = "#8BC34A", 
    "C" = "#FFC107",
    "D" = "#FF9800",
    "F" = "#F44336"
  )
  
  # Build table
  tbl <-
    result_df |>
    gt(rowname_col = name_col) |>
    tab_header(
      title = title,
      subtitle = paste("Maximum possible score:", max_score)
    ) |>
    fmt_integer(columns = all_of(score_col)) |>
    fmt_number(columns = percentage, decimals = 1, pattern = "{x}%") |>
    tab_stubhead(label = "Student") |>
    cols_label(
      !!score_col := "Score",
      percentage = "Percentage",
      grade = "Grade"
    )
  
  # Apply grade colors
  for (g in names(grade_colors)) {
    tbl <-
      tbl |>
      tab_style(
        style = list(
            cell_fill(color = grade_colors[[g]]),
            cell_text(weight = "bold", color = "white")
        ),
        locations = cells_body(columns = grade, rows = grade == g)
      )
  }
  
  # Add summary
  avg_score <- mean(result_df[[score_col]], na.rm = TRUE)
  avg_pct <- mean(result_df$percentage, na.rm = TRUE)
  
  tbl <-
    tbl |>
    tab_source_note(
      source_note = paste0(
        "Class Average: ", round(avg_score, 1), 
        " (", round(avg_pct, 1), "%)"
      )
    ) |>
    opt_stylize(style = 1)
  
  if (!show_percentage) {
      tbl <- tbl |> cols_hide(columns = percentage)
  }
  
  return(tbl)
}
```

The function calculates grades based on customizable breakpoints, applies color coding to make grade levels immediately visible, and provides class summary statistics:

```{r}
# Sample student scores
student_scores <-
  dplyr::tibble(
    student = c(
      "Alice", "Billy", "Courtney", "Dirk",
      "Eva", "Frank", "Grace", "Henry"
    ),
    exam_score = c(95, 87, 78, 92, 65, 73, 88, 56)
  )

student_scores |>
  create_grade_table(
    name_col = "student",
    score_col = "exam_score",
    title = "Final Examination Results"
  )
```

### Data quality report function

Data quality assessment is crucial before any analysis. A dedicated function can automate the production of quality reports:

```{r}
create_data_quality_report <- function(data, title = "Data Quality Report") {
  
  # Calculate quality metrics for each column
  quality_df <- 
    dplyr::tibble(
      column = names(data),
      data_type = sapply(data, function(x) class(x)[1]),
      total_rows = nrow(data),
      non_missing = sapply(data, function(x) sum(!is.na(x))),
      missing = sapply(data, function(x) sum(is.na(x))),
      missing_pct = sapply(data, function(x) mean(is.na(x)) * 100),
      unique_values = sapply(data, function(x) length(unique(x[!is.na(x)]))),
      completeness = sapply(data, function(x) (1 - mean(is.na(x))) * 100)
    )
  
  # Calculate quality score (simple weighted average)
  quality_df <-
    quality_df |>
    dplyr::mutate(
      quality_score = case_when(
        completeness >= 99 ~ "Excellent",
        completeness >= 95 ~ "Good",
        completeness >= 90 ~ "Fair",
        completeness >= 80 ~ "Poor",
        TRUE ~ "Critical"
    )
  )
  
  # Score colors
  score_colors <- c(
    "Excellent" = "#4CAF50",
    "Good" = "#8BC34A",
    "Fair" = "#FFC107",
    "Poor" = "#FF9800",
    "Critical" = "#F44336"
  )
  
  # Build table
  tbl <-
    quality_df |>
    gt(rowname_col = "column") |>
    tab_header(
      title = title,
      subtitle = paste(nrow(data), "rows analyzed")
    ) |>
    tab_stubhead(label = "Column") |>
    cols_hide(columns = c(total_rows, non_missing)) |>
    fmt_integer(columns = c(missing, unique_values)) |>
    fmt_number(columns = c(missing_pct, completeness), decimals = 1) |>
    cols_label(
      data_type = "Type",
      missing = "Missing",
      missing_pct = "Missing %",
      unique_values = "Unique",
      completeness = "Complete %",
      quality_score = "Quality"
    ) |>
    data_color(
      columns = completeness,
      palette = c("#F44336", "#FF9800", "#FFC107", "#8BC34A", "#4CAF50"),
      domain = c(0, 100)
    )
  
  # Apply quality score colors
  for (score in names(score_colors)) {
    tbl <-
      tbl |>
      tab_style(
        style = list(
          cell_fill(color = score_colors[[score]]),
          cell_text(weight = "bold")
        ),
        locations = cells_body(
          columns = quality_score,
          rows = quality_score == score
        )
      )
  }
  
  # Overall summary
  overall_completeness <- mean(quality_df$completeness)

  tbl <-
    tbl |>
    tab_source_note(
      source_note = paste0(
        "Overall Data Completeness: ", round(overall_completeness, 1), "%"
      )
    ) |>
    opt_stylize(style = 1) |>
    opt_horizontal_padding(scale = 2)

  return(tbl)
}
```

The report provides a comprehensive view of data quality, with visual indicators making problematic columns immediately apparent:

```{r}
# Create sample data with varying quality
quality_test <-
  dplyr::tibble(
    id = 1:100,
    name = sample(
      c("Alice", "Bob", "Carol", NA), 100,
      replace = TRUE, 
      prob = c(0.3, 0.3, 0.3, 0.1)
    ),
    age = sample(c(25:65, NA), 100, replace = TRUE),
    salary = c(rep(NA, 25), sample(50000:150000, 75, replace = TRUE)),
    department = sample(c("Sales", "Engineering", "Marketing"), 100, replace = TRUE)
  )

quality_test |>
  create_data_quality_report(title = "Employee Data Quality Assessment")
```

## Packaging your extensions

The examples in this chapter are presented as standalone functions, but their true power emerges when packaged for reuse. An R package provides structure for documentation, testing, and distribution. It ensures that your extensions are available wherever you work and can be shared with colleagues.

Creating a package from extension functions follows standard R package development practices. The mechanics of package creation (directory structure, documentation with roxygen2, testing, dependency management) are thoroughly covered in [R Packages](https://r-pkgs.org) by Hadley Wickham and Jennifer Bryan. That book provides comprehensive guidance on everything from initial setup to publication on CRAN.

For **gt** extensions specifically, a few considerations warrant attention. Document your functions with clear parameter descriptions and meaningful examples. Since your functions produce visual outputs, consider including example tables in vignettes where readers can see exactly what the functions produce. Think about scope: a package focused on a specific domain (financial reporting, academic publishing, healthcare analytics) will be more useful than a grab bag of unrelated utilities. Even a small collection of utilities that serve your own needs justifies the packaging effort; the discipline of creating a package improves the code itself.

## Beyond basic extensions

The patterns explored in this chapter represent starting points rather than boundaries. More sophisticated extensions might integrate with external data sources, pulling data from databases or APIs and presenting it in formatted tables. They might generate multiple related tables from a single function call, producing suites of outputs for comprehensive reporting. They might provide interactive features for HTML outputs, adding user controls for filtering or sorting.

Some extensions might focus on specific output formats. A package designed for PDF reports might include functions optimized for print layout. A package for dashboards might emphasize compact, information-dense designs. A package for presentations might provide larger text sizes and simplified structures appropriate for projection.

Other extensions might introduce entirely new table components. While **gt** provides a rich vocabulary of table elements, specific domains may have conventions not directly supported. A package could define new structural elements and rendering logic for those conventions.

The key is identifying needs that arise repeatedly in your work and addressing them systematically. Each time you find yourself copying and modifying code from a previous project, that's a signal that a function might be warranted. Each time you explain to a colleague how to format a certain type of table, that's a signal that your explanation could be encoded in software.

Creating extensions for **gt** is an exercise in understanding both the package and your own requirements. It demands clarity about what you want to achieve and how **gt** can help achieve it. The resulting functions, when well designed, become multipliers of your effectiveness. They transform tasks that once required careful attention into operations that happen correctly by default.

Many successful **gt** extension packages began exactly this way. Someone recognized a gap, built functions to address it, and shared the result. Your extensions might start as personal utilities and grow into resources that benefit a wider community. Even if they remain private to your organization, they contribute to better, more consistent, more maintainable reporting. That contribution is the purpose of extending **gt**: not extension for its own sake but extension in service of clearer communication through better tables.

## Summary

This chapter has explored how to extend **gt** by creating your own functions and packages. Whether addressing domain-specific needs or encoding organizational standards, extensions multiply the value of your table-making expertise.

The key approaches we've covered:

- display table functions take data and produce complete, formatted tables. They encapsulate multi-step workflows (data transformation, table creation, formatting, styling) into single function calls with sensible defaults and useful customization options.
- modifier functions accept existing **gt** tables and enhance them. They add consistent styling, domain-specific elements, or standard configurations without requiring users to remember every option.
- data quality and diagnostic tools use **gt**'s presentation capabilities to communicate about data itself: completeness reports, validation summaries, and structural overviews.
- packaging considerations: include clear documentation, meaningful examples, focused scope, and the discipline that formal packaging brings to code quality.

The patterns demonstrated here (dataset overviews, correlation matrices, data quality reports, modifier functions) represent starting points. Your extensions might address entirely different needs: financial reporting conventions, scientific publication requirements, corporate branding standards, or analytical workflows unique to your domain.

The underlying principle remains constant: identify repetitive table-making tasks, understand what varies and what stays constant, then encode the constants in functions while exposing the variations as parameters. Each extension you create reduces future effort while improving consistency.

This book has journeyed from **gt**'s foundational concepts through formatting, styling, and advanced features to the creation of extensions. The destination isn't mastery of a package but rather the ability to communicate data effectively through well-crafted tables. **gt** provides the tools whereas your understanding of your data and your audience provides the direction. Together, they enable tables that inform, clarify, and persuade: tables worthy of the information they present.


---


# Quick reference {#sec-appendix-reference}


This appendix provides a consolidated reference for the **gt** package, including informational functions that display helpful lookup tables, descriptions of all built-in datasets, and a quick guide to the most commonly used helper functions.

## Date and time style references

### `info_date_style()`

Displays all 41 available date formatting styles for use with `fmt_date()` and `fmt_datetime()`.
 
```{r}
info_date_style()
```

The resulting table shows:

- style number: the numeric identifier for each style
- style name: the string identifier (e.g., `"iso"`, `"month_day_year"`)
- example output: how each style renders a sample date
- flexible: whether the style adapts to locale settings

Use style names (or numbers) in your formatting calls:

```r
fmt_date(columns = date_col, date_style = "month_day_year")
fmt_date(columns = date_col, date_style = 14)  
```

### `info_time_style()`

Displays all available time formatting styles for use with `fmt_time()` and `fmt_datetime()`.

```{r}
info_time_style()
```

The table shows similar information to date styles: style numbers, names, example output, and locale flexibility.

## Currency reference

### `info_currencies()`

Displays a comprehensive table of all supported currencies, including their codes, symbols, and names.

```{r}
info_currencies()
```

The table includes:

- currency code: the 3-letter ISO 4217 code (e.g., `"USD"`, `"EUR"`, `"JPY"`)
- currency symbol: the symbol used in formatting (e.g., `$`, `€`, `¥`)
- currency name: the full name of the currency

Use currency codes with `fmt_currency()`:

```r
fmt_currency(columns = price, currency = "EUR")
fmt_currency(columns = price, currency = "JPY")
```

## Locale reference

### `info_locales()`

Displays all supported locales for internationalized formatting. Locales affect number formatting, date formatting, and translated text.

```{r}
info_locales()
```

The table shows locale codes and their corresponding languages/regions. Use these codes with:

- the `locale` argument in `gt()`
- the `locale` argument in formatting functions
- the `locale` argument in `fmt_spelled_num()`

```r
gt(data, locale = "de")
fmt_number(columns = value, locale = "fr")
fmt_date(columns = date, locale = "ja")
```

## Color palette reference

### `info_paletteer()`

The **paletteer** package provides access to hundreds of color palettes from various R packages. The `info_paletteer()` function displays available palettes that work well with `data_color()`.

```{r}
info_paletteer()
```

The table groups palettes by their source package and shows color swatches for each palette. Use palette names with `data_color()`:

```r
data_color(
  columns = value,
  palette = "viridis::plasma"
)
```

Palette names follow the format `"package::palette"`.

## Flag reference

### `info_flags()`

Displays all available country flags that can be rendered with `fmt_flag()`, along with their country codes.

```{r}
info_flags()
```

The table shows:

- country code (2-letter): ISO 3166-1 alpha-2 codes
- country code (3-letter): ISO 3166-1 alpha-3 codes
- country name: full country name
- flag preview: the rendered flag icon

Use these codes with `fmt_flag()`:

```r
fmt_flag(columns = country_code)
```

## Icon reference

### `info_icons()`

Displays all available Font Awesome icons for use with `fmt_icon()`.

```{r}
info_icons()
```

The table shows icon names and rendered previews. Use icon names in your data or with `fmt_icon()`:

```r
dplyr::tibble(
  category = c("file", "folder", "image"),
  icon_name = c("file-alt", "folder", "image")
) |>
  gt() |>
  fmt_icon(columns = icon_name)
```

## Google Fonts reference

### `info_google_fonts()`

Displays recommended Google Fonts for use with **gt** tables, along with information about how to use them.

```{r}
info_google_fonts()
```

Use Google Fonts with `opt_table_font()` or `google_font()`:
 
```r
gt(data) |>
  opt_table_font(font = google_font("Roboto"))

gt(data) |>
  tab_style(
    style = cell_text(font = google_font("Fira Code")),
    locations = cells_body(columns = code_col)
  )
```

## Unit conversion reference

### `info_unit_conversions()`

Displays all unit conversions supported by the `unit_conversion()` helper function. This is useful when you need to convert between measurement units.

```{r}
info_unit_conversions()
```

The table shows:

- unit class: the category of measurement (length, mass, volume, etc.)
- from units: available source units
- to units: available target units
- conversion factors: the multipliers used

Use with `unit_conversion()`:

```r
# Get conversion factor from miles to kilometers
unit_conversion(from = "mi", to = "km")

# Apply in a table
dplyr::tibble(distance_miles = c(10, 25, 100)) |>
  gt() |>
  cols_add(distance_km = distance_miles * unit_conversion("mi", "km")) |>
  fmt_number(columns = everything(), decimals = 1)
```

## TRUE/FALSE style reference

### `info_tf_style()`

Displays all available styles for formatting `TRUE`/`FALSE` values with the `fmt_tf()` function. This is helpful when you want to see the visual appearance of each style option before applying it to your table.

```{r}
info_tf_style()
```

The table shows:

- style name: the string identifier to use in `tf_style` (e.g., `"true-false"`, `"yes-no"`, `"check-mark"`)
- 'true' output: how `TRUE` values render with each style
- 'false' output: how `FALSE` values render with each style

Use style names with `fmt_tf()`:

```r
fmt_tf(columns = available, tf_style = "yes-no")
fmt_tf(columns = completed, tf_style = "check-mark")
```

Some styles use text representations (like `"Yes"`/`"No"` or `"True"`/`"False"`), while others use symbols (checkmarks, circles, etc.). The visual styles are particularly useful for creating scannable tables where readers need to quickly identify positive or negative values.

## Built-in datasets

The **gt** package includes 18 datasets for learning and experimentation. These datasets appear throughout the documentation and examples.

### Small example datasets

These compact datasets are ideal for quick experiments and learning the basics of **gt**.

```{r}
dplyr::tibble(
  Dataset = c("`exibble`", "`gtcars`", "`pizzaplace`"),
  Description = c("A toy tibble with various data types", "Specifications for 47 luxury/supercars", "A year of pizza sales"),
  Rows = c("8", "47", "49,574"),
  `Use Case` = c("Testing formatters", "Car comparisons", "Sales analysis")
) |>
  gt() |>
  fmt_markdown(columns = Dataset)
```

### Country and population data

These datasets provide demographic information useful for geographic visualizations and population analysis.

```{r}
dplyr::tibble(
  Dataset = c("`countrypops`", "`towny`", "`peeps`"),
  Description = c("Country populations 1960-2024", "Ontario municipality populations", "Personal information for fictional people"),
  Rows = c("~13,000", "414", "100"),
  `Use Case` = c("Time series, maps", "Canadian demographics", "Contact directories")
) |>
  gt() |>
  fmt_markdown(columns = Dataset)
```

### Scientific and technical data

These datasets contain scientific measurements and constants, suitable for demonstrating technical table formatting.

```{r}
dplyr::tibble(
  Dataset = c("`sza`", "`constants`", "`reactions`", "`photolysis`", "`nuclides`"),
  Description = c("Solar zenith angles by location/time", "Fundamental physical constants", "Atmospheric reaction rates", "Photolysis rates for organic compounds", "Nuclear data for isotopes"),
  Rows = c("816", "30", "1,344", "1,590", "3,384"),
  `Use Case` = c("Heatmaps", "Scientific tables", "Chemistry data", "Chemistry data", "Nuclear chemistry")
) |>
  gt() |>
  fmt_markdown(columns = Dataset)
```

### Financial and geographic data

These datasets cover financial markets and location-based information for diverse table examples.

```{r}
dplyr::tibble(
  Dataset = c("`sp500`", "`metro`", "`gibraltar`", "`films`"),
  Description = c("S&P 500 daily data 1950-2015", "Paris Metro stations", "May 2023 Gibraltar weather", "Cannes Film Festival competition"),
  Rows = c("16,607", "308", "744", "1,607"),
  `Use Case` = c("Financial analysis", "Geographic data", "Weather data", "Entertainment data")
) |>
  gt() |>
  fmt_markdown(columns = Dataset)
```

### Clinical trial data

These datasets follow pharmaceutical industry conventions, useful for creating clinical study tables.

```{r}
dplyr::tibble(
  Dataset = c("`rx_adsl`", "`rx_addv`", "`illness`"),
  Description = c("ADSL-style clinical trial data", "ADDV-style clinical trial data", "Lab tests for illness tracking"),
  Rows = c("182", "910", "39"),
  `Use Case` = c("Clinical tables", "Clinical tables", "Medical data")
) |>
  gt() |>
  fmt_markdown(columns = Dataset)
```

### Using built-in datasets

All datasets are automatically available when you load the **gt** package, requiring no additional data import steps.

```{r}
# View first few rows
head(exibble)

# Use in a table
gtcars |>
  dplyr::select(mfr, model, year, hp, mpg_c) |>
  dplyr::slice(1:5) |>
  gt()
```

## Helper functions quick reference

### Text and content helpers

These functions allow you to include formatted text in table headers, labels, and notes.

```{r}
dplyr::tibble(
  Function = c("`md()`", "`html()`", "`latex()`"),
  Purpose = c("Interpret text as Markdown", "Interpret text as HTML", "Interpret text as LaTeX"),
  Example = c('`tab_header(title = md("**Bold Title**"))`', '`tab_header(title = html("<em>Styled</em>"))`', '`tab_source_note(latex("\\\\textit{Note}"))`')
) |>
  gt() |>
  fmt_markdown(columns = c(Function, Example))
```

### Unit helpers

These functions specify measurement units for sizing columns and other table elements.

```{r}
dplyr::tibble(
  Function = c("`px()`", "`pct()`"),
  Purpose = c("Specify pixels", "Specify percentage"),
  Example = c("`cols_width(col ~ px(150))`", "`cols_width(col ~ pct(25))`")
) |>
  gt() |>
  fmt_markdown(columns = c(Function, Example))
```

### Dynamic value helpers

These functions enable data-driven formatting by referencing values from other columns or defining custom formats.

```{r}
dplyr::tibble(
  Function = c("`from_column()`", "`currency()`"),
  Purpose = c("Reference column values", "Custom currency symbol"),
  Example = c('`fmt_number(decimals = from_column("precision"))`', '`fmt_currency(currency = currency(symbol = "BTC"))`')
) |>
  gt() |>
  fmt_markdown(columns = c(Function, Example))
```

### Color helpers

These functions help manipulate colors for consistent styling across your tables.

```{r}
dplyr::tibble(
  Function = "`adjust_luminance()`",
  Purpose = "Lighten/darken colors",
  Example = '`adjust_luminance("steelblue", steps = 1)`'
) |>
  gt() |>
  fmt_markdown(columns = c(Function, Example))
```

### Font helpers

These functions provide access to web fonts and system font stacks for typography customization.

```{r}
dplyr::tibble(
  Function = c("`google_font()`", "`default_fonts()`", "`system_fonts()`"),
  Purpose = c("Specify Google Font", "Get default font stack", "Get system font stack"),
  Example = c('`opt_table_font(font = google_font("Roboto"))`', "`default_fonts()`", '`system_fonts("humanist")`')
) |>
  gt() |>
  fmt_markdown(columns = c(Function, Example))
```

### Location helpers (for `tab_style()`, `tab_footnote()`, etc.)

These functions target specific regions of the table for styling, footnotes, or other modifications.

```{r}
dplyr::tibble(
  Function = c("`cells_title()`", "`cells_stubhead()`", "`cells_column_labels()`", "`cells_column_spanners()`", "`cells_row_groups()`", "`cells_stub()`", "`cells_body()`", "`cells_summary()`", "`cells_grand_summary()`", "`cells_stub_summary()`", "`cells_stub_grand_summary()`", "`cells_footnotes()`", "`cells_source_notes()`"),
  Target = c("Table title and subtitle", "Stubhead label", "Column labels", "Column spanner labels", "Row group labels", "Stub (row labels)", "Body cells", "Group summary cells", "Grand summary cells", "Stub cells in summaries", "Stub cells in grand summary", "Footnote area", "Source note area")
) |>
  gt() |>
  fmt_markdown(columns = Function)
```

### Style helpers (for `tab_style()`)

These functions define visual properties that can be applied to targeted table locations.

```{r}
dplyr::tibble(
  Function = c("`cell_text()`", "`cell_fill()`", "`cell_borders()`"),
  Purpose = c("Text styling (color, size, weight, etc.)", "Background color", "Border styling")
) |>
  gt() |>
  fmt_markdown(columns = Function)
```

### Selection helpers (for column selection)

These tidyselect-compatible functions help you specify which columns to target in formatting and styling operations.

```{r}
dplyr::tibble(
  Function = c("`stub()`", "`row_group()`", "`everything()`", "`starts_with()`", "`ends_with()`", "`contains()`", "`matches()`", "`where()`"),
  Purpose = c("Select stub column", "Select row group column", "Select all columns", "Columns starting with prefix", "Columns ending with suffix", "Columns containing string", "Columns matching regex", "Columns matching predicate")
) |>
  gt() |>
  fmt_markdown(columns = Function)
```

### Utility helpers

These functions provide miscellaneous utilities for table IDs, LaTeX output, and special character handling.

```{r}
dplyr::tibble(
  Function = c("`random_id()`", "`escape_latex()`", "`gt_latex_dependencies()`"),
  Purpose = c("Generate a random table ID", "Escape special LaTeX characters", "Get LaTeX package requirements")
) |>
  gt() |>
  fmt_markdown(columns = Function)
```


---


# Datetime formatting patterns {#sec-appendix-datetime}


 
The `fmt_datetime()` function supports two powerful systems for custom datetime formatting: CLDR datetime patterns and strptime format codes. This appendix provides a comprehensive reference for both.

## CLDR datetime patterns

The CLDR (Common Locale Data Repository) datetime pattern system allows you to create highly customized, locale-aware datetime output. A pattern string consists of two types of elements:

**Pattern fields**: one or more repetitions of a specific pattern character (from the reserved sets A–Z and a–z). These fields are replaced with date and time data when formatting.

**Literal text**: any characters outside the reserved sets, including spaces and punctuation. Text between single vertical quotes (e.g., `'at'`) is output verbatim. Use two adjacent single quotes (`''`) to represent a literal single quote.

### Pattern examples

The following examples use the datetime `"2018-07-04T22:05:09.2358(America/Vancouver)"`:

```{r}

dplyr::tibble(
  Pattern = c('"mm/dd/y"', '"EEEE, MMMM d, y"', '"MMM d E"', '"HH:mm"', '"h:mm a"', '"EEEE, MMMM d, y \'at\' h:mm a"'),
  Output = c("05/04/2018", "Wednesday, July 4, 2018", "Jul 4 Wed", "22:05", "10:05 PM", "Wednesday, July 4, 2018 at 10:05 PM")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Year patterns

### Calendar year (`y`)

The calendar year is always numeric. The field length specifies the minimum number of digits, zero-padded as necessary. The exception is `"yy"`, which yields only the two low-order digits.

```{r}

dplyr::tibble(
  Pattern = c('"y"', '"yy"', '"yyy" to "yyyyyyyyy"'),
  Output = c("2018", "18", "2018 to 000002018"),
  Notes = c("Full year", "Two-digit year", "Zero-padded to width")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Week-based year (`Y`)

The year in week-based calendars, where year transitions occur on week boundaries. This may differ from calendar year `"y"` near year transitions. Used with pattern `"w"` for ISO 8601 week dates.

```{r}

dplyr::tibble(
  Pattern = c('"Y"', '"YY"', '"YYY" to "YYYYYYYYY"'),
  Output = c("2018", "18", "2018 to 000002018"),
  Notes = c("Full year", "Two-digit year", "Zero-padded to width")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Quarter patterns

### Quarter of year (`Q` and `q`)

Quarter names vary by width and context. The formatting form (`Q`) is used within complete date strings; the standalone form (`q`) is for independent use (e.g., calendar headers).

```{r}

dplyr::tibble(
  Pattern = c('"Q" / "q"', '"QQ" / "qq"', '"QQQ" / "qqq"', '"QQQQ" / "qqqq"', '"QQQQQ" / "qqqqq"'),
  Output = c("3", "03", "Q3", "3rd quarter", "3"),
  Notes = c("Numeric, one digit", "Numeric, two digits (zero-padded)", "Abbreviated", "Wide", "Narrow")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Month patterns

### Month (`M` and `L`)

Month names vary by width and context. The formatting form (`M`) is used within complete date strings; the standalone form (`L`) is for independent use.

```{r}

dplyr::tibble(
  Pattern = c('"M" / "L"', '"MM" / "LL"', '"MMM" / "LLL"', '"MMMM" / "LLLL"', '"MMMMM" / "LLLLL"'),
  Output = c("7", "07", "Jul", "July", "J"),
  Notes = c("Numeric, minimum digits", "Numeric, two digits (zero-padded)", "Abbreviated", "Wide", "Narrow")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Week patterns

### Week of year (`w`)

Values range from 1 to 53. Week 1 is the first week containing the minimum number of days specified for that locale.

```{r}

dplyr::tibble(
  Pattern = c('"w"', '"ww"'),
  Output = c("27", "27"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Week of month (`W`)

Values range from 1 to 5. The first day of each month is always in week 1.

```{r}

dplyr::tibble(
  Pattern = '"W"',
  Output = "1"
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Day patterns

### Day of month (`d`)

The day of the month, from 1 to 31.

```{r}

dplyr::tibble(
  Pattern = c('"d"', '"dd"'),
  Output = c("4", "04"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Day of year (`D`)

Values range from 1 to 365 (or 366 in leap years). The field length specifies minimum digits with zero-padding.

```{r}

dplyr::tibble(
  Pattern = c('"D"', '"DD"', '"DDD"'),
  Output = c("185", "185", "185"),
  Notes = c("Minimum digits", "Zero-padded to 2", "Zero-padded to 3")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Day of week in month (`F`)
 
Returns the occurrence number of the weekday within the month (e.g., "2nd Monday in March"). Days 1–7 yield 1, days 8–14 yield 2, and so on.

```{r}

dplyr::tibble(
  Pattern = '"F"',
  Output = "1"
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Modified Julian date (`g`)

The number of days since midnight November 17, 1858. Width specifies minimum digits with zero-padding.

```{r}

dplyr::tibble(
  Pattern = '"g" to "ggggggggg"',
  Output = "58303 to 000058303"
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Weekday patterns

### Day of week name (`E`)

The name of the day of the week, available in four different widths.

```{r}

dplyr::tibble(
  Pattern = c('"E", "EE", or "EEE"', '"EEEE"', '"EEEEE"', '"EEEEEE"'),
  Output = c("Wed", "Wednesday", "W", "We"),
  Notes = c("Abbreviated", "Wide", "Narrow", "Short")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Period patterns

### AM/PM (`a`)

Provides AM/PM and the narrow `"a"` and `"p"` forms.

```{r}

dplyr::tibble(
  Pattern = c('"a", "aa", or "aaa"', '"aaaa"', '"aaaaa"'),
  Output = c("PM", "PM", "p"),
  Notes = c("Abbreviated", "Wide", "Narrow")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### AM/PM with noon and midnight (`b`)

Provides AM/PM plus special forms for exactly noon (12:00) and midnight (00:00).

```{r}

dplyr::tibble(
  Pattern = c('"b", "bb", or "bbb"', '"bbbb"', '"bbbbb"'),
  `At Midnight` = c("midnight", "midnight", "mi"),
  `At Noon` = c("noon", "noon", "n"),
  Notes = c("Abbreviated", "Wide", "Narrow")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, `At Midnight`, `At Noon`))
  )
```

### Flexible day periods (`B`)

Locale-specific phrases like "in the afternoon" or "in the evening".

```{r}

dplyr::tibble(
  Pattern = c('"B", "BB", or "BBB"', '"BBBB"', '"BBBBB"'),
  `Morning (08:30)` = c("in the morning", "in the morning", "in the morning"),
  `Afternoon (14:00)` = c("in the afternoon", "in the afternoon", "in the afternoon"),
  Notes = c("Abbreviated", "Wide", "Narrow")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, `Morning (08:30)`, `Afternoon (14:00)`))
  )
```

## Hour, minute, and second patterns

### Hour 0–23 (`H`)

Standard 24-hour clock where midnight is 00:00.

```{r}

dplyr::tibble(
  Pattern = c('"H"', '"HH"'),
  Output = c("8", "08"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Hour 1–12 (`h`)

Standard 12-hour clock where midnight is 12:00.

```{r}

dplyr::tibble(
  Pattern = c('"h"', '"hh"'),
  Output = c("8", "08"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Hour 1–24 (`k`)

Less common 24-hour clock where midnight is 24:00.

```{r}

dplyr::tibble(
  Pattern = c('"k"', '"kk"'),
  Output = c("9", "09"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Hour 0–11 (`K`)

Less common 12-hour clock where midnight is 00:00.

```{r}

dplyr::tibble(
  Pattern = c('"K"', '"KK"'),
  Output = c("7", "07"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Minute (`m`)

This is just the time part for the minute of the hour.

```{r}

dplyr::tibble(
  Pattern = c('"m"', '"mm"'),
  Output = c("5", "05"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Second (`s`)

Provides solely the time part for the second of the minute.

```{r}

dplyr::tibble(
  Pattern = c('"s"', '"ss"'),
  Output = c("9", "09"),
  Notes = c("Minimum digits", "Two digits (zero-padded)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Fractional second (`S`)

Truncates to the specified width. Add a decimal point manually to the pattern if needed.

```{r}

dplyr::tibble(
  Pattern = '"S" to "SSSSSSSSS"',
  Output = "2 to 235000000"
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Milliseconds in day (`A`)

The number of milliseconds since midnight (max 86,400,000).

```{r}

dplyr::tibble(
  Pattern = '"A" to "AAAAAAAAA"',
  Output = "439722 to 000439722"
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Era patterns

### Era designator (`G`)

The Gregorian calendar has two eras: AD (Anno Domini) and BC (Before Christ).

```{r}

dplyr::tibble(
  Pattern = c('"G", "GG", or "GGG"', '"GGGG"', '"GGGGG"'),
  Output = c("AD", "Anno Domini", "A"),
  Notes = c("Abbreviated", "Wide", "Narrow")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## Time zone patterns

### Specific non-location format (`z`)

User-friendly time zone names. Falls back to localized GMT format if unavailable.

```{r}

dplyr::tibble(
  Pattern = c('"z", "zz", or "zzz"', '"zzzz"'),
  Output = c("PDT", "Pacific Daylight Time"),
  Notes = c("Short specific", "Long specific")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Common UTC offset formats (`Z`)

ISO 8601 and localized GMT offset formats for time zones.

```{r}

dplyr::tibble(
  Pattern = c('"Z", "ZZ", or "ZZZ"', '"ZZZZ"', '"ZZZZZ"'),
  Output = c("-0700", "GMT-7:00", "-07:00"),
  Notes = c("ISO 8601 basic format", "Long localized GMT format", "ISO 8601 extended format")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Localized GMT formats (`O`)

GMT-based offset formats that adapt to the user's locale.

```{r}

dplyr::tibble(
  Pattern = c('"O"', '"OOOO"'),
  Output = c("GMT-7", "GMT-07:00"),
  Notes = c("Short (omits zero minutes)", "Long (always includes minutes)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Generic non-location format (`v`)

Useful for recurring events where specific daylight/standard distinction isn't needed.

```{r}

dplyr::tibble(
  Pattern = c('"v"', '"vvvv"'),
  Output = c("PT", "Pacific Time"),
  Notes = c("Short generic", "Long generic")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Time zone ID and exemplar city (`V`)

Formats that display time zone identifiers and representative cities.

```{r}

dplyr::tibble(
  Pattern = c('"V"', '"VV"', '"VVV"', '"VVVV"'),
  Output = c("cavan", "America/Vancouver", "Vancouver", "Vancouver Time"),
  Notes = c("Short time zone ID", "Long time zone ID", "Exemplar city", "Generic location format")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### ISO 8601 formats with Z for UTC (`X`)

Uses `Z` when the local time offset is 0.

```{r}

dplyr::tibble(
  Pattern = c('"X"', '"XX"', '"XXX"', '"XXXX"', '"XXXXX"'),
  Output = c("-07", "-0700", "-07:00", "-0700", "-07:00"),
  Notes = c("Basic (h, optional m)", "Basic (h & m)", "Extended (h & m)", "Basic (h, m, optional s)", "Extended (h, m, optional s)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### ISO 8601 formats without Z (`x`)

Same as `X` patterns but never uses `Z` for UTC.

```{r}

dplyr::tibble(
  Pattern = c('"x"', '"xx"', '"xxx"', '"xxxx"', '"xxxxx"'),
  Output = c("-07", "-0700", "-07:00", "-0700", "-07:00"),
  Notes = c("Basic (h, optional m)", "Basic (h & m)", "Extended (h & m)", "Basic (h, m, optional s)", "Extended (h, m, optional s)")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

## strptime format codes

As an alternative to CLDR patterns, you can use strptime-style format codes. Each code starts with `%` and represents a specific date or time element.

### strptime examples

The following examples use the datetime `"2015-06-08 23:05:37.48"`:

```{r}

dplyr::tibble(
  Pattern = c('"%m/%d/%Y"', '"%A, %B %e, %Y"', '"%b %e %a"', '"%H:%M"', '"%I:%M %p"', '"%A, %B %e, %Y at %I:%M %p"'),
  Output = c("06/08/2015", "Monday, June 8, 2015", "Jun 8 Mon", "23:05", "11:05 pm", "Monday, June 8, 2015 at 11:05 pm")
) |>
  gt() |>
  fmt_markdown(columns = Pattern) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Pattern, Output))
  )
```

### Date codes

Format codes for year, month, day, and week components.

```{r}

dplyr::tibble(
  Code = c('"%a"', '"%A"', '"%w"', '"%u"', '"%y"', '"%Y"', '"%b"', '"%B"', '"%m"', '"%d"', '"%e"', '"%j"', '"%W"', '"%V"', '"%C"'),
  Output = c("Mon", "Monday", "1", "1", "15", "2015", "Jun", "June", "06", "08", "8", "159", "23", "24", "20"),
  Description = c("Abbreviated day of week", "Full day of week", "Day of week (0–6; Sunday = 0)", "Day of week (1–7; Monday = 1)", "Two-digit year", "Full year", "Abbreviated month", "Full month", "Month number (zero-padded)", "Day number (zero-padded)", "Day number (no padding)", "Day of year (zero-padded)", "Week number", "ISO 8601 week number", "Century number")
) |>
  gt() |>
  fmt_markdown(columns = Code) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Code, Output))
  )
```

### Time codes

Format codes for hour, minute, second, and AM/PM components.

```{r}

dplyr::tibble(
  Code = c('"%H"', '"%I"', '"%M"', '"%S"', '"%OS3"', '"%p"'),
  Output = c("23", "11", "05", "37", "37.480", "pm"),
  Description = c("Hour (24-hour clock)", "Hour (12-hour clock)", "Minute", "Second", "Seconds with decimals (3 places shown)", "AM/PM indicator")
) |>
  gt() |>
  fmt_markdown(columns = Code) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Code, Output))
  )
```

### Other codes

Additional format codes for time zones and special characters.

```{r}

dplyr::tibble(
  Code = c('"%z"', '"%F"', '"%%"'),
  Output = c("+0000", "2015-06-08", "%"),
  Description = c("Signed time zone offset", "ISO 8601 date format", "Literal percent sign")
) |>
  gt() |>
  fmt_markdown(columns = Code) |>
  tab_style(
    style = cell_text(font = system_fonts(name = "monospace-code")),
    locations = cells_body(columns = c(Code, Output))
  )
```
