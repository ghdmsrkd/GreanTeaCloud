import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;
 
 
public class FileClient {
 
    public static void main(String[] args) throws IOException {
       
        Socket socket = new Socket("127.0.0.1", 9999);
        //Socket socket = new Socket("172.16.20.2", 9999);
        System.out.println("서버접속 완료");
       
        Scanner s = new Scanner(System.in);
       
        //데이터를 통신을 위해서 소켓의 스트림 얻기.
        InputStream in = socket.getInputStream();
        DataInputStream dis = new DataInputStream(in);
       
        OutputStream out = socket.getOutputStream();
        DataOutputStream dos = new DataOutputStream(out);
       
        System.out.println("받고 싶은 파일의 이름을 입력해주세요!");
        String fileNameMsg = s.nextLine();
        dos.writeUTF(fileNameMsg);
        System.out.println("서버에 파일 요청을 했습니다.");
        System.out.println("서버에서 파일 데이터를 받아옵니다.");
        FileOutputStream fos = new FileOutputStream(fileNameMsg);
        //BufferedOutputStream bos = new BufferedOutputStream(fos);
        //byte[] buffer = new byte[1024];
       
        while(true){
            int data=dis.read(/*buffer*/);
            if(data == -1) break;
            fos.write(data);
            //bos.write(buffer,0,data);
        }
       
        System.out.println("전송 작업이 완료되었습니다.");
       
        //스트림 , 소켓 닫기
        //fos.close();
        dos.close();
        dis.close();
        out.close();
        in.close();
        socket.close();
       
       
    }//main()-----------
 
}
