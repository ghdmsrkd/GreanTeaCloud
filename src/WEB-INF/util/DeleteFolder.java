package util;

import java.io.File;

public class DeleteFolder {

//	public static void main(String[] args) {
//		String path = "C:\\Users\\ghdms\\OneDrive\\바탕 화면\\testDIr\\root_park\\no\\부엉이\\[Ohys-Raws]+Kimetsu+no+Yaiba+BS11+1280x720+x264+AAC.torrent";
//		System.out.println(path);
//		deleteFolder(path);
//	}

	public static void deleteFolder(String path) {

		File folder = new File(path);
		try {
			if(folder.isDirectory()) {
				if (folder.exists()) {
					File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기

					for (int i = 0; i < folder_list.length; i++) {
						if (folder_list[i].isFile()) {
							folder_list[i].delete();
							System.out.println("파일이 삭제되었습니다.");
						} else {
							deleteFolder(folder_list[i].getPath()); // 재귀함수호출
							System.out.println("폴더가 삭제되었습니다.");
						}
						folder_list[i].delete();
					}
					folder.delete(); // 폴더 삭제
				}
			} else {
				folder.delete();
				System.out.println("파일이 삭제되었습니다.");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

}
