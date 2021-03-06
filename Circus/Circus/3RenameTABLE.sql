USE [CircusAuditDB]
GO
EXEC sys.sp_addextendedproperty
@name=N'Activity_Set', 
@value=N'Словарь возможной активности животных.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Activity_Set'

GO
EXEC sys.sp_addextendedproperty
@name=N'Animals', 
@value=N'База данных животных в цирке.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Animals'

GO
EXEC sys.sp_addextendedproperty
@name=N'Blood_Group_Set', 
@value=N'Словарь возможных групп крови животных.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Blood_Group_Set'

GO
EXEC sys.sp_addextendedproperty
@name=N'Education_Set', 
@value=N'Словарь возможных уровней образования.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Education_Set'

GO
EXEC sys.sp_addextendedproperty
@name=N'Job_1klass', 
@value=N'Типы персонала(основная специальность).' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Job_1klass'

GO
EXEC sys.sp_addextendedproperty
@name=N'Job_2klass', 
@value=N'Специализация персонала.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Job_2klass'

GO
EXEC sys.sp_addextendedproperty
@name=N'Personnel', 
@value=N'База персонала в цирке.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Personnel'

GO
EXEC sys.sp_addextendedproperty
@name=N'Posters', 
@value=N'База афиш(события в цирке).' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Posters'

GO
EXEC sys.sp_addextendedproperty
@name=N'Responsers', 
@value=N'База ответственных за животных.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Responsers'

GO
EXEC sys.sp_addextendedproperty
@name=N'Turns', 
@value=N'База номеров/выступлений в цирке.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Turns'

GO
EXEC sys.sp_addextendedproperty
@name=N'Type_turn_Set', 
@value=N'Словарь возможных номеров.' , @level0type=N'SCHEMA',
@level0name=N'dbo', 
@level1type=N'TABLE',
@level1name=N'Type_turn_Set'
GO
