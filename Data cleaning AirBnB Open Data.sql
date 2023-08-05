-- Data Cleaning --

-- Change data types, remove duplicate values, detect and correct inconsistent value, change Null value --



----------------------------------------------------------------------------------------------------------------------
-- Convert last review comlumn from string value to date value --

select `last review`, 
		str_to_date(`last review`,'%m/%d/%Y') as last_review
from portfolioproject.airbnb_open_data


alter table portfolioproject.airbnb_open_data
add column last_review date


update portfolioproject.airbnb_open_data
set last_review = str_to_date(`last review`,'%m/%d/%Y')
where `last review` is not null and `last review` != ''

-- Delete last review column --

alter table portfolioproject.airbnb_open_data
drop column `last review`

----------------------------------------------------------------------------------------------------------------------
-- Detect and remove duplicate records with the same name and lat, long address



-- Find out if there are more than one rental having the same name and staying in the same lat long value --

alter table portfolioproject.airbnb_open_data
add column latlong varchar(100)

update portfolioproject.airbnb_open_data
set latlong = concat(lat, ",", `long`)

select name, latlong, count(latlong), count(name) from portfolioproject.airbnb_open_data
group by latlong, name
having count(latlong) > 1
order by name

-- Remove rows that have the same rental name and latlong address --

select 
	id, 
	latlong, 
    ROW_NUMBER() OVER ( 
		PARTITION BY latlong 
        ORDER BY latlong
	) AS row_num 
FROM portfolioproject.airbnb_open_data


select id from
	(select 
		id, 
		latlong, 
		ROW_NUMBER() OVER ( 
			PARTITION BY latlong 
			ORDER BY latlong
		) AS row_num 
	FROM portfolioproject.airbnb_open_data) t
where row_num > 1


delete from portfolioproject.airbnb_open_data
where id in 
(
	select id from
		(select 
			id, 
			latlong, 
			ROW_NUMBER() OVER ( 
				PARTITION BY latlong 
				ORDER BY latlong
			) AS row_num 
		FROM portfolioproject.airbnb_open_data
        ) t
	where row_num > 1
)

----------------------------------------------------------------------------------------------------------------------
-- Detect if there are missing strings in host identity verified column

select * from portfolioproject.airbnb_open_data
where char_length(host_identity_verified) = 0

-- Replace missing strings with "unconfirmed"

alter table portfolioproject.airbnb_open_data
add column host_id_verified varchar(50)

update portfolioproject.airbnb_open_data
set host_id_verified = 
	case when char_length(host_identity_verified) = 0
    then "unconfirmed"
    else host_identity_verified
    end

alter table portfolioproject.airbnb_open_data
drop column host_identity_verified

----------------------------------------------------------------------------------------------------------------------
-- Detect if there are missing strings in host name column

select * from portfolioproject.airbnb_open_data
where char_length(`host name`) = 0

-- Replace missing strings with "unknown"

alter table portfolioproject.airbnb_open_data
add column host_name varchar(50);

update portfolioproject.airbnb_open_data
set host_name = 
	case when char_length(`host name`) = 0
    then "unknown"
    else `host name`
    end

alter table portfolioproject.airbnb_open_data
drop column `host name`
----------------------------------------------------------------------------------------------------------------------
-- Detect if there are missing strings in neighbourhood group column --

select * from portfolioproject.airbnb_open_data
where char_length(`neighbourhood group`) = 0

-- 12 rows of neighbourhood group are recorded to be missed, represents neighbourhood in Bedford-Stuyvesant, Bushwick, Chinatown, Clinton Hill, East Village, Harlem, Queens Village, Upper West Side, Williamsburg
-- Since each neighbourhood belongs to 1 neighbourhood group, find out and fill neighbourhood group name corressponsing to the above neighbourhood --

-- For Bedford-Stuyvesant

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Bedford-Stuyvesant"

-- Neighbourhood group of Bedford-Stuyvesant is Brooklyn, so replace mssing strings with Brooklyn

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Brooklyn" 
where neighbourhood = "Bedford-Stuyvesant"


-- For Bushwick

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Bushwick"

-- Neighbourhood group of Bushwick is Brooklyn, so replace mssing strings with Brooklyn

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Brooklyn" 
where neighbourhood = "Bushwick"


-- For Chinatown

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Chinatown"

-- Neighbourhood group of Chinatown is Manhattan, so replace mssing strings with Manhattan

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Manhattan" 
where neighbourhood = "Chinatown"


-- For Clinton Hill

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Clinton Hill"

-- Neighbourhood group of Clinton Hill is Brooklyn, so replace mssing strings with Brooklyn

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Brooklyn" 
where neighbourhood = "Clinton Hill"



-- For East Village

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "East Village"

-- Neighbourhood group of Clinton Hill is Manhattan, so replace mssing strings with Manhattan

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Manhattan" 
where neighbourhood = "East Village"



-- For Harlem

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Harlem"

-- Neighbourhood group of Harlem is Manhattan, so replace mssing strings with Manhattan

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Manhattan" 
where neighbourhood = "Harlem"


-- For Queens Village

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Queens Village"

-- Neighbourhood group of Queens Village is Queens, so replace mssing strings with Queens

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Queens" 
where neighbourhood = "Queens Village"


-- For Upper West Side

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Upper West Side"

-- Neighbourhood group of Upper West Side is Manhattan, so replace mssing strings with Manhattan

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Manhattan" 
where neighbourhood = "Upper West Side"



-- For Williamsburg

select `neighbourhood group` from portfolioproject.airbnb_open_data
where neighbourhood = "Williamsburg"

-- Neighbourhood group of Williamsburg is Brooklyn, so replace mssing strings with Brooklyn

update portfolioproject.airbnb_open_data
set `neighbourhood group` = "Brooklyn" 
where neighbourhood = "Williamsburg"

----------------------------------------------------------------------------------------------------------------------
-- Detect if there are missing strings in neighbourhood column --

select * from portfolioproject.airbnb_open_data
where char_length(`neighbourhood`) = 0

-- Replace missing strings with "unknown"

update portfolioproject.airbnb_open_data
set neighbourhood = "unknown"
where char_length(neighbourhood) = 0

----------------------------------------------------------------------------------------------------------------------
-- Unify the country column with "United States" --

update portfolioproject.airbnb_open_data
set country = "United States"

----------------------------------------------------------------------------------------------------------------------
-- Unify the country code column with "US" --

update portfolioproject.airbnb_open_data
set `country code` = "US"
----------------------------------------------------------------------------------------------------------------------
-- Detect and replace missing strings in instant bookable column with "UNKNOWN"

update portfolioproject.airbnb_open_data
set instant_bookable = "UNKNOWN"
where char_length(instant_bookable) = 0

----------------------------------------------------------------------------------------------------------------------
-- Detect and replace missing strings in cancellation policy column with "unknown"

update portfolioproject.airbnb_open_data
set cancellation_policy = "unknown"
where char_length(cancellation_policy) = 0



----------------------------------------------------------------------------------------------------------------------
-- Standardize Decimal format for price column --

-- Remove "$" and "," character in price column

update portfolioproject.airbnb_open_data
set price = (select replace(substring(price, 2),",", ""))

-- Fill in missing values with 0
update portfolioproject.airbnb_open_data
set price = "0"
where char_length(price) = 0

-- Change to decimal format

alter table portfolioproject.airbnb_open_data
modify price decimal(13,2)

-- Rename column to price_$

alter table portfolioproject.airbnb_open_data
rename column price to price_$


----------------------------------------------------------------------------------------------------------------------
-- Standardize Decimal format for service fee column --

-- Remove "$" and "," character in service fee column

update portfolioproject.airbnb_open_data
set `service fee` = (select replace(substring(`service fee`, 2),",", ""))

-- Fill in missing values with 0

update portfolioproject.airbnb_open_data
set `service fee` = "0"
where char_length(`service fee`) = 0

-- Change to decimal format

alter table portfolioproject.airbnb_open_data
modify `service fee` decimal(13,2)

-- Rename column to servicefee_$

alter table portfolioproject.airbnb_open_data
rename column `service fee` to servicefee_$

----------------------------------------------------------------------------------------------------------------------
-- Detect and correct negative integer to positive integer in minimum nights column

-- Detect negative integer --

select id, `minimum nights` from portfolioproject.airbnb_open_data
where `minimum nights` < 0

-- Correct them to positive integer

update portfolioproject.airbnb_open_data
set `minimum nights` = `minimum nights` *(-1)
where `minimum nights` < 0


----------------------------------------------------------------------------------------------------------------------
-- Replace missing values in minimum nights column with 0 for records having no reviews
update portfolioproject.airbnb_open_data
set `reviews per month` = 0 
where `number of reviews` = 0

----------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------
-- Detect and correct inconsistent value in Neighbourhood group column --


----------------------------------------------------------------------------------------------------------------------
-- Detect negtive interger values of Minimum nights and set them as "unknown" --

----------------------------------------------------------------------------------------------------------------------
-- Detect missing values in name and check if they are duplicated with other values --

----------------------------------------------------------------------------------------------------------------------
-- Detect null values for other columns and set them as "unknown"