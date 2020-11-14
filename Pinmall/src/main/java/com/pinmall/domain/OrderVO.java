package com.pinmall.domain;

import java.util.Date;

public class OrderVO {
	
    
		private int	odr_code;      
		private String	memt_id;         
		private String	odr_name;     
		private String	odr_zipcode;  
		private String odr_add;       
		private String odr_dadd;     
		private String odr_ph;     
		private String odr_totalby;  
		private Date odr_date;
		
		
		public int getOdr_code() {
			return odr_code;
		}
		public void setOdr_code(int odr_code) {
			this.odr_code = odr_code;
		}
		public String getMemt_id() {
			return memt_id;
		}
		public void setMemt_id(String memt_id) {
			this.memt_id = memt_id;
		}
		public String getOdr_name() {
			return odr_name;
		}
		public void setOdr_name(String odr_name) {
			this.odr_name = odr_name;
		}
		public String getOdr_zipcode() {
			return odr_zipcode;
		}
		public void setOdr_zipcode(String odr_zipcode) {
			this.odr_zipcode = odr_zipcode;
		}
		public String getOdr_add() {
			return odr_add;
		}
		public void setOdr_add(String odr_add) {
			this.odr_add = odr_add;
		}
		public String getOdr_dadd() {
			return odr_dadd;
		}
		public void setOdr_dadd(String odr_dadd) {
			this.odr_dadd = odr_dadd;
		}
		public String getOdr_ph() {
			return odr_ph;
		}
		public void setOdr_ph(String odr_ph) {
			this.odr_ph = odr_ph;
		}
		public String getOdr_totalby() {
			return odr_totalby;
		}
		public void setOdr_totalby(String odr_totalby) {
			this.odr_totalby = odr_totalby;
		}
		public Date getOdr_date() {
			return odr_date;
		}
		public void setOdr_date(Date odr_date) {
			this.odr_date = odr_date;
		}
		
		@Override
		public String toString() {
			return "OrderVO [odr_code=" + odr_code + ", memt_id=" + memt_id + ", odr_name=" + odr_name + ", odr_zipcode="
					+ odr_zipcode + ", odr_add=" + odr_add + ", odr_dadd=" + odr_dadd + ", odr_ph=" + odr_ph
					+ ", odr_totalby=" + odr_totalby + ", odr_date=" + odr_date + "]";
		} 

		
		
}
