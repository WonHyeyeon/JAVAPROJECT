package pro02; //같은 패키지에 ZipcodeBean이 있어서 임포트 안해줘도 사용 가능한듯
/*
 * 회원인증, 가입, 우편번호처리하는 자바 소스
 * 주로 db와 연결하여 값을 얻어오거나 삽입할때 이용한다.(pool이용)
 * */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//ID중복확인
	public boolean checkId(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con =pool.getConnection();
			sql = "select id from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  id);
			flag = pstmt.executeQuery().next();
		}catch(Exception e) {
			e.printStackTrace(); // 예외 출력
		}finally {
			pool.freeConnection(con, pstmt, rs); // pool재사용 위하여 반납
		}
		return flag;
	}
	
	//우편번호 검색
	//area3이용하여 나머지 값들 다 알아내는 함수
	public Vector<ZipcodeBean> zipcodeRead(String area3)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblZipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) 
			{
				//쿼리의 결과값을 zipcodebean에넣음.
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				vlist.addElement(bean); //빈 벡터를 생성
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//회원가입
	//db에 데이터 삽입.
	public boolean insertMember(Memberbean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblmember(id,pwd, name, gender, birthday, email, zipcode,address, hobby,job)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6,  bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			String hobby[] = bean.getHobby(); //hobby는 string배열이라서
			char hb[] = {'0', '0', '0', '0', '0'};
			String lists[] = {"인터넷", "여행", "게임", "영화", "운동"};
			for(int i = 0; i<hobby.length; i++)
			{
				for(int j = 0; j<lists.length; j++)
				{
					if(hobby[i].equals(lists[i]))
					{
						hb[j] = '1';
					}
				}
			}
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, bean.getJob());
			if(pstmt.executeUpdate() == 1) { //모든 입력이 정상적으로 처리 되었는지 체크
				flag = true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
