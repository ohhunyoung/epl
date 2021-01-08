package epl.plaers.result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StatDAO {
	
	// 싱글톤 생성
	private static StatDAO instance = new StatDAO();
	private StatDAO() {}
	public static StatDAO getInstance() { return instance;}
	
	// 커넥션풀
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	// 데이터 입력
	public void inputStat(StatDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "insert into eplrank values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPlayer());
			pstmt.setInt(2, dto.getGoals());
			pstmt.setInt(3, dto.getAssist());
			pstmt.setInt(4, dto.getAttackp());
			pstmt.setInt(5, dto.getShooting());
			pstmt.setInt(6, dto.getFoul());
			pstmt.setInt(7, dto.getYcard());
			pstmt.setInt(8, dto.getRcard());
			pstmt.setInt(9, dto.getConner());
			pstmt.setInt(10, dto.getPk());
			pstmt.setInt(11, dto.getOffside());
			pstmt.setInt(12, dto.getAshoot());
			pstmt.setInt(13, dto.getGames());
			pstmt.setString(14, dto.getTeamlogo());
			pstmt.setString(15, dto.getTeam());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception e) { e.printStackTrace(); }
			if(conn != null) try { conn.close(); }catch(Exception e) { e.printStackTrace(); }
		}
	}
	
	// 선수기록 불러오기
	public List<StatDTO> getAllPlayers(String sort) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StatDTO> allList = null;
		try {
			conn = getConnection();
			String sql = "SELECT * " + 
					" FROM (SELECT ROW_NUMBER() OVER(ORDER BY "+sort+" DESC) r,  \r\n" + 
					" rank() OVER (ORDER BY "+sort+" DESC) RANKED, EPLRANK.*\r\n" + 
					" FROM EPLRANK ORDER BY ranked,player) WHERE r >= 1 AND r <= 20";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				allList = new ArrayList<StatDTO>();
				do {
					StatDTO dto = new StatDTO();
					dto.setRanked(rs.getInt("ranked"));
					dto.setPlayer(rs.getString("player"));
					dto.setGoals(rs.getInt("goals"));
					dto.setAssist(rs.getInt("assist"));
					dto.setAttackp(rs.getInt("attackp"));
					dto.setShooting(rs.getInt("shooting"));
					dto.setFoul(rs.getInt("foul"));
					dto.setYcard(rs.getInt("ycard"));
					dto.setRcard(rs.getInt("rcard"));
					dto.setConner(rs.getInt("conner"));
					dto.setPk(rs.getInt("pk"));
					dto.setOffside(rs.getInt("offside"));
					dto.setAshoot(rs.getInt("ashoot"));
					dto.setGames(rs.getInt("games"));
					dto.setTeamlogo(rs.getString("teamlogo"));
					dto.setTeam(rs.getString("team"));
					allList.add(dto);
					
				}while(rs.next());
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(Exception e) { e.printStackTrace(); }
			if(pstmt != null) try { pstmt.close(); }catch(Exception e) { e.printStackTrace(); }
			if(conn != null) try { conn.close(); }catch(Exception e) { e.printStackTrace(); }
		}
		
		
		return allList;
		
	}
	
	
		
	
	
	
}
