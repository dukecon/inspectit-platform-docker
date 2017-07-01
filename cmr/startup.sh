#!/bin/sh
mkdir -p logs
while true; do
	./jre/bin/java -Xms1536m -Xmx1536m -Xmn512M -XX:MaxPermSize=192m -XX:PermSize=128m -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=80 -XX:+UseCMSInitiatingOccupancyOnly -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+DisableExplicitGC -XX:SurvivorRatio=5 -XX:TargetSurvivorRatio=90 -XX:AutoBoxCacheMax=20000 -XX:BiasedLockingStartupDelay=500 -XX:+UseFPUForSpilling -XX:+UseFastAccessorMethods -XX:+UseBiasedLocking -XX:+UseCompressedOops -XX:+HeapDumpOnOutOfMemoryError -server -verbose:gc -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+PrintTenuringDistribution -Xloggc:logs/gc.log ${JAVA_EXTENDED_OPTIONS} -jar inspectit-cmr.jar
	CMR_STATUS=$?
	if [ "$CMR_STATUS" -eq 10 ]; then
		echo "Restarting CMR..."
	else
      		exit $CMR_STATUS
  	 fi
done
