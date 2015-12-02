On branch master:

1)Without seed data:
Fails on:

 <arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>
    
<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

<arrivalphase phase="3" duration="30" unit="second">
  <users arrivalrate="8" unit="second"></users>
</arrivalphase>

2)With seed data:
num_total_users = 100
confirmed_friendships_per_user = 5         #multiply this by 2 for total friendships
unconfirmed_friendships_per_user = 5
events_per_user = 5
users_per_group = 3

Fails on:

 <arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>
    
<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

<arrivalphase phase="3" duration="30" unit="second">
  <users arrivalrate="6" unit="second"></users>
</arrivalphase>

3)With seed data:
num_total_users = 5000
confirmed_friendships_per_user = 5         #multiply this by 2 for total friendships
unconfirmed_friendships_per_user = 5
events_per_user = 5
users_per_group = 3

Fails much before, report on:

 <arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>
    
<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

<arrivalphase phase="3" duration="30" unit="second">
  <users arrivalrate="8" unit="second"></users>
</arrivalphase>