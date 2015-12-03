h4-advanced
AppInstances 	4
AppInstanceType 	m3.2xlarge
Branch 	allinone_hv
DBInstanceType 	db.m3.2xlarge
MemcachedInstanceType 	m3.2xlarge
ProcessParallelism 	4
RubyVM 	MRI
TeamName 	J10
ThreadParallelism 	16

 <load>
  <arrivalphase phase="1" duration="30" unit="second">
    <users arrivalrate="1" unit="second"></users>
  </arrivalphase>

  <arrivalphase phase="2" duration="30" unit="second">
    <users arrivalrate="2" unit="second"></users>
  </arrivalphase>
    
  <arrivalphase phase="3" duration="30" unit="second">
    <users arrivalrate="4" unit="second"></users>
  </arrivalphase>

  <arrivalphase phase="4" duration="30" unit="second">
    <users arrivalrate="8" unit="second"></users>
  </arrivalphase>

  <arrivalphase phase="5" duration="30" unit="second">
    <users arrivalrate="16" unit="second"></users>
  </arrivalphase>

  <arrivalphase phase="6" duration="30" unit="second">
    <users arrivalrate="32" unit="second"></users>
  </arrivalphase>
    
  <arrivalphase phase="7" duration="30" unit="second">
    <users arrivalrate="50" unit="second"></users>
  </arrivalphase>

  <arrivalphase phase="8" duration="30" unit="second">
    <users arrivalrate="60" unit="second"></users>
  </arrivalphase>

  </load>