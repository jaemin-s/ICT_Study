package com.music.mrs.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class WeatherVO {
	private String date;
	private String time;
	private String category;
	private int nX;
	private int nY;
	private String obsrValue; 
}
