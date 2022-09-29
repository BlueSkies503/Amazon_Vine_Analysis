-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Step 1
SELECT * INTO new_vine_table
FROM vine_table AS vt
WHERE vt.total_votes >= 20

SELECT * FROM new_vine_table

-- Step 2 Select reviews that were mostly helpful
SELECT * INTO helpful_vine_table
FROM new_vine_table AS nvt
WHERE CAST(nvt.helpful_votes AS FLOAT)/CAST(nvt.total_votes AS FLOAT) >= 0.5

SELECT * FROM helpful_vine_table

-- Step 3 Reviews part of Vine
SELECT * INTO vine_review_table
FROM helpful_vine_table AS hvt
WHERE hvt.vine = 'Y'

SELECT * FROM vine_review_table

-- Step 4 Reviews not from Vine
SELECT * INTO no_vine_review_table
FROM helpful_vine_table AS hvt
WHERE hvt.vine = 'N'

SELECT * FROM no_vine_review_table

-- Total number of Vine reviews (ANSWER: 613)
SELECT COUNT(*) FROM vine_review_table

-- Total number of non-Vine reviews (ANSWER: 64968)
SELECT COUNT(*) FROM no_vine_review_table

-- Total number of reviews (ANSWER: 65,581)

-- Total number of 5-star Vine reviews (ANSWER: 222)
SELECT COUNT(*) FROM vine_review_table
WHERE star_rating = 5

-- Total number of 5-star non-Vine reviews (ANSWER: 30543)
SELECT COUNT(*) FROM no_vine_review_table
WHERE star_rating = 5
