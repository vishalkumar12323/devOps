# CRON is a time based background daemon (crond) that executes tasks automatically
# SYNTAX
# * * * * *   /path/to/command

# * => Minute (0 - 59)
# * => Hour (0 - 23)
# * => Day of the month (1 - 31)
# * => Month (1 - 12)
# * => Day of the week (0 - 6, sunday to saturday)

# Example 1: Cron Job that runs on every Tuesday at 3:30AM
30 3 * * 2 /path/to/script

# Example 2: A Cron job that runs every 15 minute but only during working hours(from 9:00AM to 5:00PM) Monday through Friday?
*/15 9-16 * * 1-5 /path/to/script