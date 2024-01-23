package com.java.menus.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;
import com.java.menus.domain.Patient;
import com.java.menus.domain.Prescription;
import com.java.menus.repository.PatientRepository;
import com.java.menus.repository.PrescriptionRepository;

public class PatientService implements AppService{
	
	private final PatientRepository patientRepository = new PatientRepository();
	private final PrescriptionRepository prescriptionRepository = new PrescriptionRepository();
	
	@Override
	public void start() {
		while(true) {
			PatientScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1: // 신규 환자 등록
				addPatient();
				break;
			case 2: // 처방전 작성
				addPrescription();
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()

	//신규 환자 등록
	private void addPatient() {
		System.out.println("\n============= 신규 환자 등록 ==============");
		System.out.print("이름: ");
		String name = inputString();
		
		System.out.print("\n환자 주민등록번호('-'포함): ");
		String id = inputString();
		
		if(patientRepository.searchDuplicate(id)) {
			System.out.println("");
			System.out.println("이미 등록된 환자입니다. 다시 시도해주세요.");
			return;
		}
		
		System.out.print("\n주소: ");
		String address = inputString();
		
		System.out.print("\n전화번호('-'포함): ");
		String phone = inputString();
		
		Patient patient = new Patient();
		patient.setPatientName(name);
		patient.setPatientId(id);
		patient.setPatientAddress(address);
		patient.setPatientPhone(phone);
		
		patientRepository.addPatient(patient);			
		
		
	}//end addPatient()
	
	//처방전 작성
	private void addPrescription() {
		System.out.println("\n============= 처방전 작성 ==============");
		System.out.print("\n환자 주민등록번호('-'포함): ");
		String Id = inputString(); 
		if(!patientRepository.searchDuplicate(Id)) {
			System.out.println("\n등록되지 않은 환자입니다");
			return;
		}
		//여기서 투약중인 약 이름 성분 출력 
		prescriptionRepository.showDrugInfo(Id);
		
		System.out.print("\n담당의사 이름: ");
		String docName = inputString();
		
		System.out.print("\n의약품 번호: ");
		int medNumber = inputInteger();
		
		System.out.print("\n투약 일수: ");
		int daysMed = inputInteger();
		
		Prescription prescription = new Prescription();
		prescription.setPatientId(Id);
		prescription.setDoctorName(docName);
		prescription.setDrugNumber(medNumber);
		prescription.setDaysMedication(daysMed);
		
		prescriptionRepository.addPrecription(prescription);
		
	}//end addPrescription


}//end class
