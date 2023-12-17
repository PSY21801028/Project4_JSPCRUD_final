package com.crud.dao;

import com.crud.bean.TeamVO;
import com.crud.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeamDAO {

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String TEAM_INSERT = "insert into team (snumber, name, birth, email, residence, phone, major) values (?,?,?,?,?,?,?)";
	private final String TEAM_UPDATE = "update team set name=?, birth=?, email=?, residence=?, phone=?, major=? where seq=?";
	private final String TEAM_DELETE = "delete from team where seq=?";
	private final String TEAM_GET = "select * from team where seq=?";
	private final String TEAM_LIST = "select * from team order by seq desc";

	public int insertTeam(TeamVO vo) {
		System.out.println("===> JDBC insertTeam() 추가완료!");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEAM_INSERT);
			stmt.setInt(1, vo.getSnumber());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getBirth());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getResidence());
			stmt.setString(6, vo.getPhone());
			stmt.setString(7, vo.getMajor());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public void deleteTeam(TeamVO vo) {
		System.out.println("===> JDBC deleteTeam() 삭제!");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEAM_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateTeam(TeamVO vo) {
		System.out.println("===> JDBC updateTeam() 수정완료!");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEAM_UPDATE);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getBirth());
			stmt.setString(3, vo.getEmail());
			stmt.setString(4, vo.getResidence());
			stmt.setString(5, vo.getPhone());
			stmt.setString(6, vo.getMajor());
			stmt.setInt(7, vo.getSeq());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public TeamVO getTeam(int seq) {
		TeamVO one = new TeamVO();
		System.out.println("===> JDBC getTeam() 불러오기");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEAM_GET);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if (rs.next()) {
				one.setSeq(rs.getInt("seq"));
				one.setSnumber(rs.getInt("snumber"));
				one.setName(rs.getString("name"));
				one.setBirth(rs.getString("birth"));
				one.setEmail(rs.getString("email"));
				one.setResidence(rs.getString("residence"));
				one.setPhone(rs.getString("phone"));
				one.setMajor(rs.getString("major"));
				one.setRegdate(rs.getTimestamp("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}

	public List<TeamVO> getTeamList() {
		List<TeamVO> list = new ArrayList<TeamVO>();
		System.out.println("===> JDBC getTeamList() 불러오기");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEAM_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				TeamVO one = new TeamVO();
				one.setSeq(rs.getInt("seq"));
				one.setSnumber(rs.getInt("snumber"));
				one.setName(rs.getString("name"));
				one.setBirth(rs.getString("birth"));
				one.setEmail(rs.getString("email"));
				one.setResidence(rs.getString("residence"));
				one.setPhone(rs.getString("phone"));
				one.setMajor(rs.getString("major"));
				one.setRegdate(rs.getTimestamp("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
