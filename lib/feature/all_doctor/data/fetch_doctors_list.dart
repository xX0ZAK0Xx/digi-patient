import 'package:digi_patient/feature/home/data/model/doctor_model.dart';

List<DoctorModel> fetchDoctorsList() {
  return [
    DoctorModel(
      name: "Dr. John Carter",
      image: "https://images.pexels.com/photos/5452268/pexels-photo-5452268.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Cardiologist",
      experience: 10,
      fees: 1000.0,
      totalReview: 45,
      rating: 4.5,
      qualifications: [
        "MBBS from Harvard Medical School, USA",
        "MD in Internal Medicine from Johns Hopkins University",
        "DM in Cardiology from Cleveland Clinic, USA",
        "Fellow of the American College of Cardiology (FACC)",
        "Member of Royal College of Physicians (MRCP, UK)"
      ],
      description: "With over a decade of specialized experience in cardiology, Dr. John Carter is renowned for his expertise in interventional cardiology and heart failure management. He has performed over 3,000 successful angioplasties and is a pioneer in minimally invasive cardiac procedures. His patient-centric approach combines cutting-edge technology with compassionate care, ensuring optimal heart health for all his patients.",
      patientsServed: 5200,
    ),
    DoctorModel(
      name: "Dr. Sarah Lee",
      image: "https://images.pexels.com/photos/5207117/pexels-photo-5207117.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Dermatologist",
      experience: 8,
      fees: 800.0,
      totalReview: 25,
      rating: 4,
      qualifications: [
        "MBBS from University of California, San Francisco",
        "MD in Dermatology from Stanford University",
        "Diploma in Venereology and Dermatology (DVD) from AIIMS, India",
        "Fellow of American Academy of Dermatology (FAAD)",
        "Diplomate of National Board (DNB) in Dermatology"
      ],
      description: "Dr. Sarah Lee is a board-certified dermatologist specializing in medical, surgical, and cosmetic dermatology. Her expertise ranges from treating complex skin conditions to performing advanced cosmetic procedures. She's particularly known for her innovative approaches to acne treatment and skin rejuvenation, having helped thousands achieve healthy, radiant skin through personalized treatment plans.",
      patientsServed: 3800,
    ),
    DoctorModel(
      name: "Dr. Alex Morgan",
      image: "https://images.pexels.com/photos/8460090/pexels-photo-8460090.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Neurologist",
      experience: 12,
      fees: 1200.0,
      totalReview: 48,
      rating: 5,
      qualifications: [
        "DM in Neurology from National Institute of Mental Health and Neurosciences, India",
        "PhD in Neurophysiology from University of Oxford, UK",
        "Fellow of Royal College of Physicians (FRCP, London)",
        "Fellow of American Academy of Neurology (FAAN)"
      ],
      description: "A leading neurologist with specialized training in epilepsy and movement disorders, Dr. Alex Morgan combines clinical excellence with groundbreaking research. His holistic approach to neurological care addresses both symptoms and root causes, offering patients comprehensive treatment plans. He's particularly skilled in managing complex cases of Parkinson's disease and multiple sclerosis, with numerous successful patient outcomes.",
      patientsServed: 6500,
    ),
    DoctorModel(
      name: "Dr. Lisa Brown",
      image: "https://images.pexels.com/photos/5998482/pexels-photo-5998482.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Pediatrician",
      experience: 7,
      fees: 900.0,
      totalReview: 43,
      rating: 4.5,
      qualifications: [
        "MBBS from University of Toronto, Canada",
        "MD in Pediatrics from Boston Children's Hospital",
        "Diplomate of National Board (DNB) in Pediatrics",
        "Member of Royal College of Paediatrics and Child Health (MRCPCH, UK)",
        "Fellow of Indian Academy of Pediatrics (IAP)"
      ],
      description: "Dr. Lisa Brown is a compassionate pediatrician dedicated to providing exceptional healthcare for children from infancy through adolescence. Her practice emphasizes preventive care, early intervention, and family education. Specializing in developmental pediatrics, she has helped countless families navigate childhood illnesses, behavioral challenges, and special healthcare needs with patience and expertise.",
      patientsServed: 4200,
    ),
    DoctorModel(
      name: "Dr. Michael Smith",
      image: "https://images.pexels.com/photos/14438788/pexels-photo-14438788.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Psychiatrist",
      experience: 11,
      fees: 950.0,
      totalReview: 46,
      rating: 4.5,
      qualifications: [
        "MBBS from University of Sydney, Australia",
        "MD in Psychiatry from Columbia University, USA",
        "Diploma in Psychological Medicine (DPM) from Maudsley Hospital, UK",
        "Fellow of Royal Australian and New Zealand College of Psychiatrists (FRANZCP)",
        "American Board of Psychiatry and Neurology (ABPN) certified"
      ],
      description: "With extensive experience in both clinical and academic psychiatry, Dr. Michael Smith offers comprehensive mental health care for adults and adolescents. His integrative approach combines psychotherapy, medication management, and lifestyle interventions to treat conditions ranging from depression and anxiety to bipolar disorder. Known for his empathetic listening skills, he creates tailored treatment plans that address each patient's unique needs.",
      patientsServed: 5800,
    ),
    DoctorModel(
      name: "Dr. Emma Wilson",
      image: "https://images.pexels.com/photos/5207098/pexels-photo-5207098.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Gynecologist",
      experience: 9,
      fees: 850.0,
      totalReview: 35,
      rating: 5,
      qualifications: [
        "MBBS from University of London, UK",
        "MD in Obstetrics & Gynecology from King's College Hospital",
        "Diploma in Gynecology and Obstetrics (DGO) from RCOG",
        "Fellow of Indian College of Obstetricians & Gynecologists (FICOG)",
        "Fellow of Royal College of Obstetricians and Gynecologists (FRCOG)"
      ],
      description: "Dr. Emma Wilson is a highly skilled gynecologist and obstetrician specializing in women's health across all life stages. Her expertise includes minimally invasive gynecological surgeries, high-risk pregnancy care, and reproductive health management. She's particularly known for her gentle approach to sensitive women's health issues and her commitment to empowering patients through education and personalized care.",
      patientsServed: 4700,
    ),
    DoctorModel(
      name: "Dr. Daniel Johnson",
      image: "https://images.pexels.com/photos/6129573/pexels-photo-6129573.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Ophthalmologist",
      experience: 10,
      fees: 700.0,
      totalReview: 68,
      rating: 5,
      qualifications: [
        "MBBS from All India Institute of Medical Sciences",
        "MS in Ophthalmology from LV Prasad Eye Institute",
        "Diploma in Ophthalmic Medicine & Surgery (DOMS) from University of London",
        "Fellow of Royal College of Surgeons (FRCS) in Ophthalmology",
        "Fellow of All India Collegium of Ophthalmology (FAICO)"
      ],
      description: "A visionary in eye care, Dr. Daniel Johnson specializes in cataract surgery, refractive procedures, and retinal diseases. With thousands of successful surgeries performed, he's renowned for his precision and patient satisfaction. His practice incorporates the latest technologies in laser eye surgery and offers comprehensive care for conditions like glaucoma, diabetic retinopathy, and macular degeneration.",
      patientsServed: 7200,
    ),
    DoctorModel(
      name: "Dr. Olivia Martin",
      image: "https://images.pexels.com/photos/8459997/pexels-photo-8459997.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Orthopedic",
      experience: 6,
      fees: 1100.0,
      totalReview: 75,
      rating: 4.5,
      qualifications: [
        "MBBS from University of Pennsylvania, USA",
        "MS in Orthopedics from Hospital for Special Surgery, New York",
        "Diplomate of National Board (DNB) in Orthopedics",
        "Fellow of Royal College of Surgeons (FRCS) in Trauma & Orthopedics",
        "Fellow of Japanese Orthopaedic Association (FJOA)"
      ],
      description: "Specializing in sports medicine and joint replacement, Dr. Olivia Martin is a skilled orthopedic surgeon helping patients regain mobility and quality of life. Her expertise includes arthroscopic procedures, minimally invasive surgeries, and complex trauma cases. She takes a rehabilitation-focused approach, working closely with physiotherapists to ensure optimal recovery for every patient.",
      patientsServed: 3500,
    ),
    DoctorModel(
      name: "Dr. William Anderson",
      image: "https://images.pexels.com/photos/7108250/pexels-photo-7108250.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Radiologist",
      experience: 13,
      fees: 1000.0,
      totalReview: 15,
      rating: 4,
      qualifications: [
        "MBBS from University of Edinburgh, UK",
        "MD in Radiology from Massachusetts General Hospital",
        "Diploma in Medical Radio-Diagnosis (DMRD) from AIIMS",
        "Fellow of Royal College of Radiologists (FRCR, UK)",
        "European Diploma in Radiology (EDIR)"
      ],
      description: "As a diagnostic radiologist with subspecialty training in neuroradiology, Dr. William Anderson brings exceptional skill in interpreting complex imaging studies. His precise readings help guide treatment plans for numerous specialists. He's particularly known for his work in early cancer detection through advanced imaging techniques and his contributions to interventional radiology procedures.",
      patientsServed: 28000,
    ),
    DoctorModel(
      name: "Dr. Emily Davis",
      image: "https://images.pexels.com/photos/5998468/pexels-photo-5998468.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Oncologist",
      experience: 15,
      fees: 1300.0,
      totalReview: 78,
      rating: 5,
      qualifications: [
        "MBBS from University of Melbourne, Australia",
        "DM in Medical Oncology from MD Anderson Cancer Center, USA",
        "PhD in Cancer Biology from Cambridge University",
        "Fellow of American College of Physicians (FACP)",
        "European Society for Medical Oncology (ESMO) certified"
      ],
      description: "A leading medical oncologist specializing in breast and gastrointestinal cancers, Dr. Emily Davis combines cutting-edge treatments with compassionate care. Her research-driven approach incorporates the latest in targeted therapies and immunotherapy. Known for her dedication to patient support, she leads a multidisciplinary team that addresses all aspects of cancer care from diagnosis through survivorship.",
      patientsServed: 6200,
    ),
    DoctorModel(
      name: "Dr. Thomas Garcia",
      image: "https://images.pexels.com/photos/8460157/pexels-photo-8460157.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Dentist",
      experience: 5,
      fees: 600.0,
      totalReview: 120,
      rating: 4,
      qualifications: [
        "Bachelor of Dental Surgery (BDS) from New York University",
        "Master of Dental Surgery (MDS) in Prosthodontics from University of Southern California",
        "Fellow of International Congress of Oral Implantologists (FICOI)",
        "American Academy of Implant Dentistry (AAID) certified"
      ],
      description: "Dr. Thomas Garcia is a cosmetic and implant dentist known for creating beautiful, natural-looking smiles. His practice focuses on comprehensive dental care including advanced restorative procedures, teeth whitening, and Invisalign treatments. With a gentle chairside manner and commitment to pain-free dentistry, he's transformed the dental experience for thousands of anxious patients.",
      patientsServed: 5800,
    ),
    DoctorModel(
      name: "Dr. Ava Martinez",
      image: "https://images.pexels.com/photos/8376277/pexels-photo-8376277.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Endocrinologist",
      experience: 9,
      fees: 950.0,
      totalReview: 26,
      rating: 4.5,
      qualifications: [
        "MBBS from University of Barcelona, Spain",
        "DM in Endocrinology from Mayo Clinic, USA",
        "Fellow of Royal College of Physicians (FRCP, London)",
        "Fellow of American College of Endocrinology (FACE)",
        "European Association for Study of Diabetes (EASD) certified"
      ],
      description: "Specializing in diabetes and thyroid disorders, Dr. Ava Martinez provides expert care for complex endocrine conditions. Her holistic approach addresses hormonal imbalances through personalized treatment plans that incorporate medication, lifestyle modifications, and continuous monitoring. She's particularly known for her work in helping patients achieve better diabetes control through innovative management techniques.",
      patientsServed: 4900,
    ),
    DoctorModel(
      name: "Dr. James Robinson",
      image: "https://images.pexels.com/photos/5327656/pexels-photo-5327656.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Gastroenterologist",
      experience: 11,
      fees: 1100.0,
      totalReview: 42,
      rating: 5,
      qualifications: [
        "MBBS from University of Cape Town, South Africa",
        "DM in Gastroenterology from Johns Hopkins University",
        "Fellow of Royal College of Physicians (FRCP, London)",
        "Fellow of American College of Gastroenterology (FACG)",
        "American Gastroenterological Association (AGA) certified"
      ],
      description: "With expertise in advanced endoscopic procedures and digestive health, Dr. James Robinson treats a wide range of gastrointestinal conditions. His specialties include inflammatory bowel disease, liver disorders, and functional GI problems. Known for his thorough diagnostic approach, he combines clinical expertise with the latest therapeutic techniques to provide comprehensive digestive care.",
      patientsServed: 6700,
    ),
    DoctorModel(
      name: "Dr. Isabella Clark",
      image: "https://images.pexels.com/photos/4031690/pexels-photo-4031690.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Hematologist",
      experience: 10,
      fees: 1000.0,
      totalReview: 26,
      rating: 4.5,
      qualifications: [
        "MBBS from University of Oxford, UK",
        "DM in Hematology from Memorial Sloan Kettering Cancer Center",
        "Fellow of Royal College of Pathologists (FRCPath)",
        "Fellow of American Society of Clinical Oncology (FASCO)",
        "American Society of Hematology (ASH) certified"
      ],
      description: "Specializing in blood disorders and cancers, Dr. Isabella Clark provides expert care for conditions ranging from anemia to leukemia. Her research-focused practice incorporates the latest developments in hematology, including targeted therapies and stem cell transplantation. She's particularly known for her compassionate approach to treating patients with chronic blood disorders.",
      patientsServed: 3800,
    ),
    DoctorModel(
      name: "Dr. Benjamin Rodriguez",
      image: "https://images.pexels.com/photos/26886763/pexels-photo-26886763/free-photo-of-portrait-of-a-bearded-man-using-a-stethoscope.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Nephrologist",
      experience: 7,
      fees: 900.0,
      totalReview: 95,
      rating: 4,
      qualifications: [
        "MBBS from University of Buenos Aires, Argentina",
        "DM in Nephrology from Brigham and Women's Hospital, USA",
        "Fellow of Royal College of Physicians (FRCP, London)",
        "Fellow of American Society of Nephrology (FASN)",
        "European Renal Association (ERA) certified"
      ],
      description: "A kidney specialist with expertise in chronic kidney disease management, Dr. Benjamin Rodriguez provides comprehensive care for patients with renal conditions. His practice includes dialysis management, hypertension treatment, and kidney transplantation follow-up. Known for his patient education initiatives, he helps individuals preserve kidney function through early intervention and lifestyle modifications.",
      patientsServed: 3200,
    ),
    DoctorModel(
      name: "Dr. Mia Lewis",
      image: "https://images.pexels.com/photos/6749778/pexels-photo-6749778.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Pulmonologist",
      experience: 6,
      fees: 800.0,
      totalReview: 39,
      rating: 4,
      qualifications: [
        "MBBS from University of Amsterdam, Netherlands",
        "DM in Pulmonary Medicine from National Jewish Health, USA",
        "Fellow of American College of Chest Physicians (FCCP)",
        "European Respiratory Society (ERS) certified",
        "American Thoracic Society (ATS) certified"
      ],
      description: "Specializing in respiratory medicine, Dr. Mia Lewis treats conditions ranging from asthma and COPD to complex interstitial lung diseases. Her expertise includes advanced bronchoscopy procedures and sleep medicine. She's particularly known for her work in helping severe asthma patients achieve better control through personalized treatment plans and innovative therapies.",
      patientsServed: 2900,
    ),
    DoctorModel(
      name: "Dr. Lucas Lee",
      image: "https://images.pexels.com/photos/8460094/pexels-photo-8460094.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Rheumatologist",
      experience: 8,
      fees: 850.0,
      totalReview: 18,
      rating: 4.5,
      qualifications: [
        "MBBS from National University of Singapore",
        "DM in Rheumatology from Karolinska Institute, Sweden",
        "Fellow of Royal College of Physicians (FRCP, London)",
        "European League Against Rheumatism (EULAR) certified",
        "American College of Rheumatology (ACR) certified"
      ],
      description: "Dr. Lucas Lee specializes in diagnosing and treating autoimmune and inflammatory conditions affecting joints and connective tissues. His expertise includes rheumatoid arthritis, lupus, and vasculitis management. Taking a comprehensive approach, he combines medication management with physical therapy coordination to help patients maintain mobility and quality of life.",
      patientsServed: 2500,
    ),
    DoctorModel(
      name: "Dr. Charlotte Walker",
      image: "https://images.pexels.com/photos/7904471/pexels-photo-7904471.jpeg?auto=compress&cs=tinysrgb&w=400",
      speciality: "Urologist",
      experience: 9,
      fees: 1000.0,
      totalReview: 78,
      rating: 4,
      qualifications: [
        "MBBS from University of Sydney, Australia",
        "MS in Urology from Cleveland Clinic, USA",
        "Diplomate of National Board (DNB) in Urology",
        "Fellow of Royal College of Surgeons (FRCS) in Urology",
        "American Urological Association (AUA) certified"
      ],
      description: "A specialist in both male and female urological health, Dr. Charlotte Walker treats conditions ranging from kidney stones to prostate disorders. Her surgical expertise includes minimally invasive and robotic-assisted procedures. Known for her compassionate approach to sensitive urological issues, she provides comprehensive care with an emphasis on patient comfort and education.",
      patientsServed: 4100,
    ),
  ];
}