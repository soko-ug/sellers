// To parse this JSON data, do
//
//     final profiles = profilesFromJson(jsonString);

import 'dart:convert';

List<Profiles> profilesFromJson(String str) => List<Profiles>.from(json.decode(str).map((x) => Profiles.fromJson(x)));

String profilesToJson(List<Profiles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profiles {
    String? userId;
    String? bloodType;
    DateTime? createdAt;
    bool? criminalRecord;
    String? currentEmployer;
    String? currentJobTitle;
    DateTime? dob;
    String? drivingLicense;
    String? email;
    String? emailAddress;
    String? emergencyContactName;
    String? emergencyContactPhone;
    String? emergencyContactRelationship;
    String? employmentStatus;
    dynamic facialData;
    String? fathersName;
    dynamic fingerprintData;
    String? firstName;
    String? frontPhotoUrl;
    String? gender;
    String? highestEducation;
    String? lastName;
    DateTime? lastUpdated;
    String? leftPhotoUrl;
    String? mailingAddress;
    String? maritalStatus;
    String? medicalHistory;
    String? middleName;
    String? militaryServiceRecord;
    String? mothersName;
    String? nationalId;
    String? nationality;
    String? passportNumber;
    String? password;
    String? phoneNumber;
    String? placeOfBirth;
    bool? privacyPolicyAck;
    DateTime? registrationDate;
    String? residentialAddress;
    dynamic retinaScan;
    String? rightPhotoUrl;
    String? skillsOrQualifications;
    String? spouseName;
    String? ssn;
    bool? termsAndConditionsAck;
    String? username;
    dynamic auditLogs;
    dynamic employmentHistory;
    dynamic graduationYears;
    dynamic institutionsAttended;
    dynamic knownAllergies;
    dynamic languagesSpoken;

    Profiles({
        this.userId,
        this.bloodType,
        this.createdAt,
        this.criminalRecord,
        this.currentEmployer,
        this.currentJobTitle,
        this.dob,
        this.drivingLicense,
        this.email,
        this.emailAddress,
        this.emergencyContactName,
        this.emergencyContactPhone,
        this.emergencyContactRelationship,
        this.employmentStatus,
        this.facialData,
        this.fathersName,
        this.fingerprintData,
        this.firstName,
        this.frontPhotoUrl,
        this.gender,
        this.highestEducation,
        this.lastName,
        this.lastUpdated,
        this.leftPhotoUrl,
        this.mailingAddress,
        this.maritalStatus,
        this.medicalHistory,
        this.middleName,
        this.militaryServiceRecord,
        this.mothersName,
        this.nationalId,
        this.nationality,
        this.passportNumber,
        this.password,
        this.phoneNumber,
        this.placeOfBirth,
        this.privacyPolicyAck,
        this.registrationDate,
        this.residentialAddress,
        this.retinaScan,
        this.rightPhotoUrl,
        this.skillsOrQualifications,
        this.spouseName,
        this.ssn,
        this.termsAndConditionsAck,
        this.username,
        this.auditLogs,
        this.employmentHistory,
        this.graduationYears,
        this.institutionsAttended,
        this.knownAllergies,
        this.languagesSpoken,
    });

    factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
        userId: json["user_id"],
        bloodType: json["blood_type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        criminalRecord: json["criminal_record"],
        currentEmployer: json["current_employer"],
        currentJobTitle: json["current_job_title"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        drivingLicense: json["driving_license"],
        email: json["email"],
        emailAddress: json["email_address"],
        emergencyContactName: json["emergency_contact_name"],
        emergencyContactPhone: json["emergency_contact_phone"],
        emergencyContactRelationship: json["emergency_contact_relationship"],
        employmentStatus: json["employment_status"],
        facialData: json["facial_data"],
        fathersName: json["fathers_name"],
        fingerprintData: json["fingerprint_data"],
        firstName: json["first_name"],
        frontPhotoUrl: json["front_photo_url"],
        gender: json["gender"],
        highestEducation: json["highest_education"],
        lastName: json["last_name"],
        lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
        leftPhotoUrl: json["left_photo_url"],
        mailingAddress: json["mailing_address"],
        maritalStatus: json["marital_status"],
        medicalHistory: json["medical_history"],
        middleName: json["middle_name"],
        militaryServiceRecord: json["military_service_record"],
        mothersName: json["mothers_name"],
        nationalId: json["national_id"],
        nationality: json["nationality"],
        passportNumber: json["passport_number"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        placeOfBirth: json["place_of_birth"],
        privacyPolicyAck: json["privacy_policy_ack"],
        registrationDate: json["registration_date"] == null ? null : DateTime.parse(json["registration_date"]),
        residentialAddress: json["residential_address"],
        retinaScan: json["retina_scan"],
        rightPhotoUrl: json["right_photo_url"],
        skillsOrQualifications: json["skills_or_qualifications"],
        spouseName: json["spouse_name"],
        ssn: json["ssn"],
        termsAndConditionsAck: json["terms_and_conditions_ack"],
        username: json["username"],
        auditLogs: json["audit_logs"],
        employmentHistory: json["employment_history"],
        graduationYears: json["graduation_years"],
        institutionsAttended: json["institutions_attended"],
        knownAllergies: json["known_allergies"],
        languagesSpoken: json["languages_spoken"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "blood_type": bloodType,
        "created_at": createdAt?.toIso8601String(),
        "criminal_record": criminalRecord,
        "current_employer": currentEmployer,
        "current_job_title": currentJobTitle,
        "dob": dob?.toIso8601String(),
        "driving_license": drivingLicense,
        "email": email,
        "email_address": emailAddress,
        "emergency_contact_name": emergencyContactName,
        "emergency_contact_phone": emergencyContactPhone,
        "emergency_contact_relationship": emergencyContactRelationship,
        "employment_status": employmentStatus,
        "facial_data": facialData,
        "fathers_name": fathersName,
        "fingerprint_data": fingerprintData,
        "first_name": firstName,
        "front_photo_url": frontPhotoUrl,
        "gender": gender,
        "highest_education": highestEducation,
        "last_name": lastName,
        "last_updated": lastUpdated?.toIso8601String(),
        "left_photo_url": leftPhotoUrl,
        "mailing_address": mailingAddress,
        "marital_status": maritalStatus,
        "medical_history": medicalHistory,
        "middle_name": middleName,
        "military_service_record": militaryServiceRecord,
        "mothers_name": mothersName,
        "national_id": nationalId,
        "nationality": nationality,
        "passport_number": passportNumber,
        "password": password,
        "phone_number": phoneNumber,
        "place_of_birth": placeOfBirth,
        "privacy_policy_ack": privacyPolicyAck,
        "registration_date": registrationDate?.toIso8601String(),
        "residential_address": residentialAddress,
        "retina_scan": retinaScan,
        "right_photo_url": rightPhotoUrl,
        "skills_or_qualifications": skillsOrQualifications,
        "spouse_name": spouseName,
        "ssn": ssn,
        "terms_and_conditions_ack": termsAndConditionsAck,
        "username": username,
        "audit_logs": auditLogs,
        "employment_history": employmentHistory,
        "graduation_years": graduationYears,
        "institutions_attended": institutionsAttended,
        "known_allergies": knownAllergies,
        "languages_spoken": languagesSpoken,
    };
}
