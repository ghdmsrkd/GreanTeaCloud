package util;
import java.io.File;
 
public class DirList{
	public static File[] getFileInfo() {
		String dirName = "/var/lib/tomcat9/webapps/ROOT/GreanTeaCloud/src/util";
        File dir = new File(dirName);
        File[] files = dir.listFiles();
		return files;
	}
}