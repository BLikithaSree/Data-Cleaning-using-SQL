   ----- EDA-------
   
   select *
   from layoff_staging2;
   
     select max(total_laid_off),max(percentage_laid_off),sum(total_laid_off)
   from layoff_staging2;
   
      select *
   from layoff_staging2
   where percentage_laid_off =1
   order by funds_raised_millions desc;
   
   select company , sum(total_laid_off)
   from layoff_staging2
   group by company
   order by 2 desc;
   
   select min(`date`),max(`date`)
   from layoff_staging2 ;
   
    select industry , sum(total_laid_off)
   from layoff_staging2
   group by industry
   order by 2 desc;
   
   
    select year(`date`) , sum(total_laid_off)
   from layoff_staging2
   group by year(`date`)
   order by sum(total_laid_off) desc;
   
       select stage, sum(total_laid_off)
   from layoff_staging2
   group by stage
   order by 2 desc;
   
       select stage, sum(percentage_laid_off)
   from layoff_staging2
   group by stage
   order by 2 desc;
   
 with rolling_total as
 (
 select substring(`date`,1,7) as `month`,sum(total_laid_off) as total_off
      from layoff_staging2
      where substring(`date`,1,7) is not null
      group by `month`
      order by 2 asc  
      )
select`month` ,
total_off, sum(total_off) over (order by `month`)
from rolling_total;