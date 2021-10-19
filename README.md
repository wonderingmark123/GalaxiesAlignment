# Galaxies Alignment
## Code

## Data

### sdss_merge
Names and meanings of different columns in the dataset.

| Index | Name |Meaning|
| --------   |  :----: |----|
|1|ra|right ascension|
|2|dec|declination|
|3|int_flux|Integrated radio flux|
|4|rmag|r magnitudes |
|5|umag|u magnitudes |
|6|first_pa|FIRST PA*(radio)|
|7|sdss_r_pa|SDSS PA(optical, r band)|
|8|con|concentration|
|9|axial_sdss|
|10|sdss_r_maj|
|11|sfr|
|12|mass|
|13|class|
|14|zzz|redshift|
|15|stmass|
|16|stage|
|17|frac|
|18|first_maj|Major axis in FIRST|
|19|first_min|Minor axis in FIRST|
|20|peak_flux|
|21|a4|
* PA: Position Angle

### FIRST original data
These data are available in http://sundog.stsci.edu/first/catalogs/catalog_14dec17.bin.gz.
And the detailed information of each column is in https://heasarc.gsfc.nasa.gov/W3Browse/all/first.html.

SDSS:
Sciserver Jupyter Notebook website:
https://apps.sciserver.org/compute/


The catalog I need for this project is r-mag u-mag i-mag(for double-check) PA
### Nearest Neighbor Search (Cross-ID): Table-valued Functions without Cursors
This is an example of using a table-valued function (functions that return a table of values rather than a single scalar value) in a query and applying its results to a query on another table. In this case we do a nearest neighbor search, and we use the CROSS APPLY and OUTER APPLY SQL constructs. You can use the same prescription to apply the results of other table-valued functions.

Assume that you have already created or imported a MyDB table called MyRaDecPairs that contains a list of ra,dec pairs for the locations that you want to find neighbors. The table also has an "id" as the first column that is either an enumerator or some other unique id for each point. The first version of the nearest neighbor query returns only the matching SDSS objects, whereas the second version (using the OUTER APPLY instead of CROSS APPLY) also returns non-matches.

Version 1:

    SELECT
        m.id, m.ra AS ra1, m.dec AS dec1,
        n.objid, n.distance,
        o.ra AS ra2, o.dec AS dec2
    FROM MyDB.MyRaDecPairs AS m
        CROSS APPLY dbo.fGetNearestObjEq( m.ra, m.dec, 0.5) AS n
        JOIN PhotoObj AS o ON n.objid=o.objid
Version 2:

    SELECT
        m.id, m.ra AS ra1, m.dec AS dec1,
        n.objid, n.distance,
        o.ra AS ra2, o.dec AS dec2
    FROM MyDB.MyRaDecPairs AS m
        OUTER APPLY dbo.fGetNearestObjEq( m.ra, m.dec, 0.5) AS n
        LEFT JOIN PhotoObj AS o ON n.objid=o.objid

