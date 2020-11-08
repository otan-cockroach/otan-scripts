from github import Github
import os
from datetime import datetime, timedelta
import csv
import math

g = Github(os.environ.get('GITHUB_API_KEY'))
repo = g.get_repo("cockroachdb/cockroach")

issues = {}
for issue in g.search_issues('repo:cockroachdb/cockroach state:closed label:"good first issue"'):
    if issue.closed_at <= datetime.strptime('2019-11-01', '%Y-%m-%d'):
        continue
    issues[issue.number] = issue

print('number of good first issues: {}'.format(len(issues)))

#for issue in g.search_issues('repo:cockroachdb/cockroach state:closed label:"E-easy"'):
#    if issue.closed_at <= datetime.strptime('2019-11-01', '%Y-%m-%d'):
#        continue
#    issues[issue.number] = issue

#print('number of issues including E-Easy: {}'.format(len(issues)))

org = g.get_organization('cockroachdb')
members = {}
for member in org.get_members():
    members[member.login] = member

external_closed_issues = {}
time_to_action = {}
time_to_close = {}
for issue in issues.values():
    labeled = None
    actioned = False
    for event in issue.get_events():
        if event.event == "labeled":
            labeled = event.created_at
        if (event.event == "commented") and event.actor.login not in members and labeled is not None:
            if not actioned:
                actioned = True
                time_to_action[issue.number] = event.created_at - labeled
        if event.event == "closed":
            if not actioned:
                time_to_action[issue.number] = event.created_at - labeled
            time_to_close[issue.number] = event.created_at - labeled

with open('time_to_action.csv', 'w') as f:
    writer = csv.writer(f)

    for issue, time in time_to_action.items():
        writer.writerow([issue, math.floor(time.total_seconds() / 86400)])

with open('time_to_close.csv', 'w') as f:
    writer = csv.writer(f)

    for issue, time in time_to_close.items():
        writer.writerow([issue, math.floor(time.total_seconds() / 86400)])




