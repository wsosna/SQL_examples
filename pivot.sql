select * from WypElementy ;

DECLARE @collumns AS NVARCHAR(MAX),
		@str  AS NVARCHAR(MAX)

select @collumns = STUFF((SELECT ', ' + QUOTENAME(Nazwa) 
                    from WypElementy
                    group by Nazwa
                    order by Nazwa
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') ,1,1,'')

set @str = 'SELECT Pracownik,' + @collumns + ' from 
             (
                select Pracownik, Nazwa, Wartosc
                from WypElementy 
				where DatePart(yy, OkresTo) = 2017 AND DATEPART(mm, OkresTo) = 12
            ) x
            pivot 
            (
                sum(Wartosc)
                for Nazwa in (' + @collumns + ')
            ) p 
			order by Pracownik'
	execute(@str);
