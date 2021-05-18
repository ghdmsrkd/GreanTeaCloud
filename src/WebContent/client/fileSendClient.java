import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;
 
public class test{
    public static void main(String[] args){
        OutputStream out;
        FileInputStream fin;
        
        try{
            Socket soc = new Socket("127.0.0.1",9091); //127.0.0.1은 루프백 아이피로 자신의 아이피를 반환해주고,
            System.out.println("Server Start!");        //11111은 서버접속 포트입니다.
            out =soc.getOutputStream();                 //서버에 바이트단위로 데이터를 보내는 스트림을 개통합니다.
            DataOutputStream dout = new DataOutputStream(out); //OutputStream을 이용해 데이터 단위로 보내는 스트림을 개통합니다.
            
            
            Scanner s = new Scanner(System.in);   //파일 이름을 입력받기위해 스캐너를 생성합니다.
            
            
            while(true){
                String filename = s.next();    //스캐너를 통해 파일의 이름을 입력받고,
            fin = new FileInputStream(new File(filename)); //FileInputStream - 파일에서 입력받는 스트림을 개통합니다.
            
        byte[] buffer = new byte[1024];        //바이트단위로 임시저장하는 버퍼를 생성합니다.
        int len;                               //전송할 데이터의 길이를 측정하는 변수입니다.
        int data=0;                            //전송횟수, 용량을 측정하는 변수입니다.
        
        while((len = fin.read(buffer))>0){     //FileInputStream을 통해 파일에서 입력받은 데이터를 버퍼에 임시저장하고 그 길이를 측정합니다.
            data++;                        //데이터의 양을 측정합니다.
        }
        
        int datas = data;                      //아래 for문을 통해 data가 0이되기때문에 임시저장한다.
 
        fin.close();
        fin = new FileInputStream(filename);   //FileInputStream이 만료되었으니 새롭게 개통합니다.
        dout.writeInt(data);                   //데이터 전송횟수를 서버에 전송하고,
        dout.writeUTF(filename);               //파일의 이름을 서버에 전송합니다.
        
         len = 0;
        
        for(;data>0;data--){                   //데이터를 읽어올 횟수만큼 FileInputStream에서 파일의 내용을 읽어옵니다.
            len = fin.read(buffer);        //FileInputStream을 통해 파일에서 입력받은 데이터를 버퍼에 임시저장하고 그 길이를 측정합니다.
            out.write(buffer,0,len);       //서버에게 파일의 정보(1kbyte만큼보내고, 그 길이를 보냅니다.
        }
        
        System.out.println("약 "+datas+" kbyte");
            }
        }catch(Exception e){
        }
        
    }
}


