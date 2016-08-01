package edms.core;

public class SizeCalculator {
	public static double quotaLimit=100000000000000.0;
	public static double quotaUsed=1000000.0;
	public static void addFile(double size){
		if(!isLimitReached(size)){
			quotaUsed+=size;
		}
	}
	public static void removeFile(double size){
		quotaUsed-=size;
	}	
	public static void checkRemainingQuota(){
		
	}
	public static boolean isLimitReached(double size){
		return false;
	}
	
	

}
