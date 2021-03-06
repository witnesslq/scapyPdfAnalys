package ServerTools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import NetReptile.DataFormat.LogTool;

public class FileReadTools {
	public static String TextFileRead(File file){
		StringBuilder jsonString=new StringBuilder();
		try{
			BufferedReader in = new BufferedReader(new InputStreamReader(
					new FileInputStream(file),"UTF-8"));
			int ch;
			while((ch=in.read())!=-1)
				jsonString.append((char)ch);
			in.close();
		}catch(Exception e){
			LogTool.E("error in FileReadTools --->"+e.toString());
		}
		return jsonString.toString();
	}
}
