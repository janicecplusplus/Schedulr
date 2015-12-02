Without seed data:
1) 1 arrival phase 1 user 1 second
2) 1 arrival phase 1 user 30 sec
3) 1 arrival phase 2 user 30 second
4) 2 arrival phases:

<arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>

<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

5) 3 arrival phases: (404s..can't handle!)

<arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>
    
<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

<arrivalphase phase="3" duration="30" unit="second">
  <users arrivalrate="8" unit="second"></users>
</arrivalphase>

-------------------
With seed data:

num_total_users = 100
confirmed_friendships_per_user = 5
unconfirmed_friendships_per_user = 5
events_per_user = 5
users_per_group = 3 

6) 1 arrival phase 1 user 1 second
7) 1 arrival phase 1 user 30 sec
8) 1 arrival phase 2 user 30 second
9) 2 arrival phases:

arrivalphase phase="1" duration="30" unit="second">
      <users arrivalrate="2" unit="second"></users>
    </arrivalphase>  
    <arrivalphase phase="2" duration="30" unit="second">
      <users arrivalrate="4" unit="second"></users>
    </arrivalphase>

10) 3 arrival phases: (404s..can't handle!)

<arrivalphase phase="1" duration="30" unit="second">
      <users arrivalrate="2" unit="second"></users>
    </arrivalphase>
    
    <arrivalphase phase="2" duration="30" unit="second">
      <users arrivalrate="4" unit="second"></users>
    </arrivalphase>

    <arrivalphase phase="3" duration="30" unit="second">
      <users arrivalrate="6" unit="second"></users>
    </arrivalphase>

11) 3 arrival phases: (404s..can't handle!)

<arrivalphase phase="1" duration="30" unit="second">
      <users arrivalrate="2" unit="second"></users>
    </arrivalphase>
    
    <arrivalphase phase="2" duration="30" unit="second">
      <users arrivalrate="4" unit="second"></users>
    </arrivalphase>

    <arrivalphase phase="3" duration="30" unit="second">
      <users arrivalrate="5" unit="second"></users>
    </arrivalphase>

------------------
Without seed and after dropping db i.e. fresh db:
12) <arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>
    
<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

<arrivalphase phase="3" duration="30" unit="second">
  <users arrivalrate="8" unit="second"></users>
</arrivalphase>

13) <arrivalphase phase="1" duration="30" unit="second">
  <users arrivalrate="2" unit="second"></users>
</arrivalphase>
    
<arrivalphase phase="2" duration="30" unit="second">
  <users arrivalrate="4" unit="second"></users>
</arrivalphase>

<arrivalphase phase="3" duration="30" unit="second">
  <users arrivalrate="6" unit="second"></users>
</arrivalphase>