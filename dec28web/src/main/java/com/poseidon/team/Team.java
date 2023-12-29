package com.poseidon.team;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Team {
	public List<String> getTeam() {
		List<String> team = new ArrayList<String>();
		List<String> members = new ArrayList<String>();

		String temp[] = new String[] { "강기병", "김지훈", "나우석", "노재희", "박대종", // 21
				"박선우", "박시호", "배현배", "박건하", "손현석", // 16
				"신동일", "신유진", "신진수", "오상민", "오초록", // 11
				"이남규", "이문희", "이민우", "이수현", "이지은", // 6
				"이진선", "정은숙", "정진수", "정효진", "채영선", // 1
				"한솔범" };

		for (int i = 0; i < temp.length; i++) {
			members.add(temp[i]);
		}

		Collections.shuffle(members);

//		for (int i = 0; i < members.size() / 5; i++) {
//			String teamMem = "";
//			if (i != 4) {
//				teamMem = i + "팀 " + members.subList(i * 5, i * 5 + 5).toString();
//			} else {
//				teamMem = i + "팀 " + members.subList(i * 5, members.size() - 1).toString();
//			}
//			team.add(teamMem);
//		}
//
//		for (int i = 0; i < 5; i++) {
//			String memTemp = i + "팀 : ";
//			if (i != 4) {
//				for (int j = 0; j < 5; j++) {
//					memTemp += members.get((i * 5) + j)+" ";
//				}
//				team.add(memTemp);
//			} else {
//				for (int j = 0; j < 6; j++) {
//					memTemp += members.get((i * 5) + j)+" ";
//				}
//				team.add(memTemp);
//			}
//		}
		
		return members;
	}

	public static void main(String[] args) {
		Team team = new Team();
		System.out.println(team.getTeam());

	}

}
