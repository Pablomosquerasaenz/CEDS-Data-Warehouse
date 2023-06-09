
/*    

	Copyright 2021 Common Education Data Standards
	----------------------------------------------
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	    http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.


	Common Education Data Standards (CEDS)
    Version 9.1.0.0
	CEDS Junk Table Dimension Population Script
	  
    This script populates multiple Junk Dimension tables in the CEDS Data Warehouse
	version 9.1.0.0. It does not populate all of the tables. Additional work is underway
	to fully populate all of the Junk Dimension tables. The tables populated for this release are
	primarily related to the CEDS Data Warehouse Expansion Project along with some additional
	tables that were already coded.

	You must have the CEDS Data Warehouse version 9.1.0.0 installed first as it
	will already have the CEDS schema in place. You must also have run the "Create CEDS Element Tables"
	script to create the seven CED schema tables which house the element and option set information.
	These seven tables act as a source for the junk table dimension population. This script first
	pulls data from those seven tables to build the CEDS.CedsOptionSetMapping table which contains all
	elements from CEDS version 9.0.0.0. It then additionally adds options related to the data warehouse
	expansion project which have been approved by the community making this a version 9.1.0.0 warehouse.
      
    Questions on this script can be sent to https://ceds.ed.gov/ContactUs.aspx
      
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov.
		
*/    


USE [CEDS-Data-Warehouse-V9-1-0-0]
GO

DECLARE @CEDSVersion VARCHAR(10)
SET @CEDSVersion = '9'

CREATE TABLE CEDS.CedsOptionSetMapping
	(CedsElementName VARCHAR(1000)
	,CedsElementTechnicalName VARCHAR(1000)
	,CedsGlobalId VARCHAR(1000)
	,CedsOptionSetCode VARCHAR(1000)
	,CedsOptionSetDescription VARCHAR(1000)
	,CedsOptionSetDefinition VARCHAR(3000)
	,EdFactsElementName VARCHAR(1000)
	,EdFactsOptionSetCode VARCHAR(1000))

INSERT INTO CEDS.CedsOptionSetMapping
	(CedsElementName
	,CedsElementTechnicalName
	,CedsGlobalId
	,CedsOptionSetCode
	,CedsOptionSetDescription
	,CedsOptionSetDefinition
	,EdFactsElementName
	,EdFactsOptionSetCode)

SELECT DISTINCT t.Name, t.XMLName, t.GlobalID, c.Code, c.Description, c.CodeDefinition, NULL, NULL
FROM CEDS.dbo.Term t
JOIN CEDS.dbo.TermxCodeSet tcs
	ON t.TermID = tcs.TermID
JOIN CEDS.dbo.CodeSet cs
	ON tcs.CodeSetID = cs.CodeSetID
JOIN CEDS.dbo.CodeSetxCode csxc
	ON cs.CodeSetID = csxc.CodeSetID
JOIN CEDS.dbo.Code c
	ON csxc.CodeID = c.CodeID
WHERE t.Version = @CEDSVersion
	AND t.HasCodeSet = '1'


		-------------------------------------------------------------------------
		----Add in additional codes from the Data Warehouse Expansion Project ---
		----that have been approved by the community						  ---
		-------------------------------------------------------------------------

		INSERT INTO [CEDS].[CedsOptionSetMapping]
           ([CedsElementName]
           ,[CedsElementTechnicalName]
           ,[CedsGlobalId]
           ,[CedsOptionSetCode]
           ,[CedsOptionSetDescription]
           ,[CedsOptionSetDefinition]
           ,[EdFactsElementName]
           ,[EdFactsOptionSetCode])

		VALUES
			('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1000', 'Incarceration in a correctional institution or resident of 24-hour support facility', 'The participant exits the program because he or she has become incarcerated in a correctional institution or has become a resident of an institution or facility providing 24-hour support such as a hospital or treatment center during the course of receiving services as a participant.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1001', 'Medical treatment', 'The participant exits the program because of medical treatment and that treatment is expected to last longer than 90 days and precludes entry into unsubsidized employment or continued participation in the program.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1002', 'National guard or other reserve active duty', 'The participant exits the program because the participant is a member of the National Guard or other reserve military unit of the armed forces and is called to active duty for at least 90 days.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1003', 'Deceased', 'The participant is deceased. ', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1004', 'Permanently incapacitated', 'The participant is permanently incapacitated.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1005', 'Voluntary exit', 'The participant voluntarily exited the program without completing.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1006', 'Moved out of state', 'The participant moved out of state.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1007', 'Program completion without credential or certification', 'The participant completed the program without credentials or certifications.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1008', 'Program discontinued', 'The participant exited the program because the program was discontinued.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1009', 'Unknown', 'It is unknown why the participant exited the program.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1010', 'Program completion with credential or certification', 'The participant completed the program with one or more credentials or certifications.', NULL, NULL)
			,('Adult Education Program Exit Reason', 'AdultEducationProgramExitReason', 'TBD', '1999', 'Other', 'The reason why the person is no longer being served in the adult education program is not yet defined in CEDS.', NULL, NULL)


			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '807', 'Displaced homemaker', 'The participant has been providing unpaid services to family members in the home and (a) has been dependent on the income of another family member but is no longer supported by that income; (b) is the dependent spouse of a member of the armed forces on active duty whose family income is significantly reduced because of (i) a deployment or a call or order to active duty pursuant to a provision of law, (ii) a permanent change of station, or (iii) the service-connected death or disability of the member; and (c) is unemployed or underemployed and is experiencing difficulty in obtaining or upgrading employment.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '803', 'English language learner', 'The participant has limited ability in speaking, reading, writing, or understanding the English language that may serve as a hindrance to employment.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '804', 'Low literacy level', 'The participant has an inability to compute and solve problems, or read, write, or speak English at a level necessary to function on the job in the participant�s family or in society that may serve as a hindrance to employment.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '805', 'Cultural barriers', 'The participant has a perception of him-or herself as possessing attitudes, beliefs, customs, or practices that influence a way of thinking, acting, or working that may serve as a hindrance to employment.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '601', 'Exhausting Temporary Assistance for Needy Families (TANF) within 2 years', 'The participant is within 2 years of exhausting lifetime eligibility under Part A of Title IV of the Social Security Act (42 U.S.C. 601 et seq.), regardless of whether he or she is receiving these benefits at program entry.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '801', 'Ex-offender', 'The participant is a person who either (a) has been subject to any stage of the criminal justice process for committing a status offense or delinquent act, or(b) requires assistance in overcoming barriers to employment resulting from a record of arrest or conviction.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '800', 'Homeless or runaway youth', 'The participant lacks a fixed, regular, and adequate nighttime residence; has a primary nighttime residence that is a public or private place not designed for or ordinarily used as a regular sleeping accommodation for human beings; is a migratory child who in the preceding 36 months was required to move from one school district to another due to changes in the parent�s or parent�s spouse�s seasonal employment in agriculture, dairy, or fishing work; or is under 18 years of age and absents himself or herself from home or place of legal residence without the permission of his or her family (i.e., runaway youth). However, a participant who may be sleeping in a temporary accommodation while away from home should not, as a result of that fact alone, be recorded as homeless.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '402', 'Long-term unemployed', 'The participant has been unemployed for 27 or more consecutive weeks.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '802', 'Low-income', 'The participant (a) receives, or in the 6 months prior to application to the program has received, or is a member of a family that is receiving in the past 6 months assistance through the Supplemental Nutrition Assistance Program (SNAP), the TANF program, the Supplemental Security Income (SSI) program, or State or local income-based public assistance; (b) is in a family with total family income that does not exceed the higher of the poverty line or 70% of the lower living standard income level; (c) is a youth who receives, or is eligible to receive, a free or reduced-price lunch; (d) is a foster child on behalf of whom State or local government payments are made; (e) is a participant with a disability whose own income is the poverty line but who is a member of a family whose income does not meet this requirement; (f) is a homeless participant or homeless child or youth or runaway youth; or (g) is a youth living in a high-poverty area.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '808', 'Migrant and seasonal farmworker', 'The participant is a low-income individual who for 12 consecutive months out of the 24 months prior to application for the program involved has been primarily employed in agriculture or fish farming labor that is characterized by chronic unemployment or underemployment, and faces multiple barriers to economic self-sufficiency.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '202', 'Individual with disabilities', 'The participant indicates that he or she has any disability, defined as a physical or mental impairment that substantially limits one or more of the person''s major life activities, as defined under the Americans with Disabilities Act of 1990.', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '806', 'Single parent', 'The participant is a single, separated, divorced, or widowed individual who has primary responsibility for one or more dependent children under age 18 (including single pregnant women).', NULL, NULL)
			,('WIOA Barriers to Employment', 'WIOABarrierstoEmployment', 'TBD', '704', 'Youth in foster care or who has aged out of system', 'The participant is a person who is currently in foster care or has aged out of the foster care system.', NULL, NULL)


			,('WIOA Career Services', 'WIOACareerServices', 'TBD', 'Yes', 'Yes', 'The individual has received WIOA defined career services.', NULL, NULL)
			,('WIOA Career Services', 'WIOACareerServices', 'TBD', 'No', 'No', 'The individual has not received WIOA defined career services.', NULL, NULL)
			,('WIOA Career Services', 'WIOACareerServices', 'TBD', 'Unknown', 'Unknown', 'It is not known if the individual received WIOA defined career services.', NULL, NULL)


			,('WIOA Training Services', 'WIOATrainingServices', 'TBD', 'Yes', 'Yes', 'The individual has received WIOA defined training services.', NULL, NULL)
			,('WIOA Training Services', 'WIOATrainingServices', 'TBD', 'No', 'No', 'The individual has not received WIOA defined training services', NULL, NULL)
			,('WIOA Training Services', 'WIOATrainingServices', 'TBD', 'Unknown', 'Unknown', 'It is not known if the individual received WIOA defined training services.', NULL, NULL)


			,('Adult Education Special Program Type', 'AdultEducationSpecialProgramType', '000782', 'OtherInstitutional', 'Other Institutional Programs', 'Any other medical or special institution.', NULL, NULL)
			,('Adult Education Special Program Type', 'AdultEducationSpecialProgramType', '000782', 'CommunityCorrections', 'Community Corrections Programs', 'A community-based rehabilitation facility or halfway house.', NULL, NULL)
			,('Adult Education Special Program Type', 'AdultEducationSpecialProgramType', '000782', 'IntegratedEducationTraining', 'Integrated Education and Training (IET)', 'A service approach that provides adult education and literacy activities concurrently and contextually with workforce preparation activities and workforce training for a specific occupation or occupational cluster for the purpose of educational and career advancement.', NULL, NULL)


			,('Adult Education Instructional Program Type', 'AdultEducationInstructionalProgramType', '001077', 'ELA', 'English as a Second Language/English Language Acquisition Program', 'A program of instruction designed to help eligible individuals who are English language learners (ELLs) to achieve competence in reading, writing, speaking, and comprehension of the English language, and that leads to attainment of a secondary school diploma or its recognized equivalent and transition to postsecondary education and training or employment.', NULL, NULL)
			,('Adult Education Instructional Program Type', 'AdultEducationInstructionalProgramType', '001077', 'IEL', 'Integrated English Literacy and Civics Education', 'A program of instruction funded under WIOA, Section 243, which includes education services provided to English language learners who are adults, including professionals with degrees and credentials in their native countries, that enables such adults to achieve competency in the English language and acquire the basic and more advanced skills needed to function effectively as parents, workers, and citizens in the United States. It includes instruction in literacy and English language acquisition and instruction on the rights and responsibilities of citizenship and civic participation and may include workforce training. In addition, the program must be provided in combination with Integrated Education and Training (IET).', NULL, NULL)

			,('Adult Education Credential Attainment Postsecondary Enrollment Indicator', 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator', 'TBD', 'Yes', 'Yes', 'The adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.', NULL, NULL)
			,('Adult Education Credential Attainment Postsecondary Enrollment Indicator', 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator', 'TBD', 'No', 'No', 'The adult education participant did not receive a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.', NULL, NULL)
			,('Adult Education Credential Attainment Postsecondary Enrollment Indicator', 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator', 'TBD', 'Unknown', 'Unknown', 'It is not known whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.', NULL, NULL)


			,('Adult Education Credential Attainment Employed Indicator', 'AdultEducationCredentialAttainmentEmployedIndicator', 'TBD', 'Yes', 'Yes', 'The adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.', NULL, NULL)
			,('Adult Education Credential Attainment Employed Indicator', 'AdultEducationCredentialAttainmentEmployedIndicator', 'TBD', 'No', 'No', 'The adult education participant did not receive a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.', NULL, NULL)
			,('Adult Education Credential Attainment Employed Indicator', 'AdultEducationCredentialAttainmentEmployedIndicator', 'TBD', 'Unknown', 'Unknown', 'It is not known whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.', NULL, NULL)

			,('Adult Education Credential Attainment Postsecondary Credential Indicator', 'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator', 'TBD', 'Yes', 'Yes', 'The adult education participant received a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.', NULL, NULL)
			,('Adult Education Credential Attainment Postsecondary Credential Indicator', 'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator', 'TBD', 'No', 'No', 'The adult education participant did not receive a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.', NULL, NULL)
			,('Adult Education Credential Attainment Postsecondary Credential Indicator', 'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator', 'TBD', 'Unknown', 'Unknown', 'It is not known whether the adult education participant received a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.', NULL, NULL)


			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73055', 'Work-based Learning', 'Sustained interactions with industry or community professionals in real workplace settings, to the extent practicable, or simulated environments at an educational institution that foster in-depth, firsthand engagement with the tasks required in a given career field, that are aligned to curriculum and instruction.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73056', 'Community based career training for Special Education', 'Career education and training provided specifically to students with disabilities in community work settings.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73057', 'Community based career training', 'Career education and training provided to all students in community work settings.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73058', 'Individual career education', 'Career education and training provided to students in a personalized or individual setting.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73059', 'Individual career education for special education', 'Career education provided specifically to students with disabilities in a personalized or individual setting.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73060', 'Homebound or Hospitalized', 'Services provided to students in the home or in the hospital who are at home or who have been hospitalized.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73061', 'School Psychologist', 'Services provided by a school psychologist directly to the student.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73062', 'Teacher consultant for autism', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of autism, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73063', 'Teacher Consultant for intellectual disability', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of intellectual disability, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73064', 'Teacher Consultant for disturbance emotional', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of emotional disturbance, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73065', 'Teacher consultant for specifical learning disability', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of specific learning disability, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73066', 'Teacher consultant for hearing impairment', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of hearing impairment, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73067', 'Teacher consultant for visual impairment', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of visual impairment, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73068', 'Teacher consultant for orthopedic impairment', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of orthopedic impairment, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)
			,('Student Support Service Type', 'StudentSupportServiceType', '000273', '73069', 'Teacher consultant for other health impairment', 'Services provided by a staff member who specializes in helping teachers by providing in classroom strategies for working with students with an IDEA Disability Type of other health impairment, providing professional development to local educators, and assisting in developing strategies to help parents work with their child at home.', NULL, NULL)


			,('Responsible District Type', 'ResponsibleDistrictType', '000594', 'IEPServiceProvider', 'Individualized education program service provider', 'The role/relationship type assigned to an organization, institution, or agency responsible for providing services to meet the requirements of the student''s Individualized Education Program (IEP).', NULL, NULL)


			,('Responsible School Type', 'ResponsibleSchoolType', '000595', 'IEPServiceProvider', 'Individualized education program service provider', 'The role/relationship type assigned to an organization, institution, or agency responsible for providing services to meet the requirements of the student''s Individualized Education Program (IEP).', NULL, NULL)


			,('Program Type', 'ProgramType', '000225', '75002', 'Mild cognitive disability program', 'A program specifically designed for students who have been determined to have a mild cognitive disability.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75003', 'Moderate cognitive disability program', 'A program specifically designed for students who have been determined to have a moderate cognitive disability.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75004', 'Significant cognitive disability program', 'A program specifically designed for students who have been determined to have a significant cognitive disability.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75005', 'Emotional disturbance program', 'A program specifically designed for students with the IDEA Disability Type emotional disturbance.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75006', 'Specific learning disability program', 'A program specifically designed for students with the IDEA Disability Type specific learning disability', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75007', 'Hearing impairment program', 'A program specifically designed for students with the IDEA Disability Type hearing impairment.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75008', 'Visual impairment program', 'A program specifically designed for students with the IDEA Disability Type visual health impairment.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75009', 'Other health impairment', 'A program specifically designed for students with the IDEA Disability Type other health impairments.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75010', 'Orthopedic impairment', 'A program specifically designed for students with the IDEA Disability Type orthopedic impairments.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75011', 'Multiple disabilities program', 'A program specifically designed for students with the IDEA Disability type   multiple disabilities.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75012', 'Speech or language impairment program', 'A program specifically designed for students with the IDEA Disability Type speech or language impairment.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75013', 'Autism program', 'A program specifically designed for students with the IDEA Disability Type autism.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75014', 'Early childhood special education tier one program', 'A program specifically designed for early childhood special education students that provides services to special education students with an intensity defined by the state or other authoritative organization.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75015', 'Early childhood special education tier two program', 'A program specifically designed for early childhood special education students that provides services to special education students with an intensity, as defined by the state or other authoritative organization, greater than the early childhood special education tier one program.', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '75016', 'K12 Resource Program', 'A program designed to provide additional resources to special education students.', NULL, NULL)

			----Additional Program Types identified in Use by Generate but not in CEDS yet - See CEDS Elements issue 310 
			----https://github.com/CEDStandards/CEDS-Elements/issues/310
			,('Program Type', 'ProgramType', '000225', '76000', 'Homeless program', 'Homeless program', NULL, NULL)
			,('Program Type', 'ProgramType', '000225', '77000', 'Title III program', 'Title III program', NULL, NULL)

			----New Elements identified in use by Generate but not in cEDS yes - See CEDS Element issues 209 and 210:
			----https://github.com/CEDStandards/CEDS-Elements/issues/209
			----https://github.com/CEDStandards/CEDS-Elements/issues/210

			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'EARNGED', 'Earned a GED', 'The student earned a GED while enrolled in the program.', NULL, 'EARNGED')
			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'EARNDIPL', 'Obtained high school diploma', 'The student obtained a high school diploma while enrolled in the program.', NULL, 'EARNDIPL')
			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'EARNCRE', 'Earned high school course credits', 'The student earned high school course credits while enrolled in the program.', NULL, 'EARNCRE')
			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'ENROLLGED', 'Enrolled in a GED program', 'The student enrolled in a GED program while enrolled in the program.', NULL, 'ENROLLGED')
			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'POSTSEC', 'Were accepted and/or enrolled into postsecondary education', 'The student was accepted and/or enrolled into postsecondary education while enrolled in the program.', NULL, 'POSTSEC')
			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'ENROLLTRAIN', 'Enrolled in job training courses/programs', 'The student enrolled in job training courses/programs while enrolled in the program.', NULL, 'ENROLLTRAIN')
			,('EDFacts Academic or Career and Technical Outcome Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeType', 'TBD', 'OBTAINEMP', 'Obtained employment', 'The student obtained employment while enrolled in the program.', NULL, 'OBTAINEMP')

			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'ENROLLSCH', 'Enrolled in local district school', 'The student enrolled in a local school district after exiting the facility or program.', NULL, 'ENROLLSCH')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'EARNGED', 'Earned a GED', 'The student earned a GED after exiting the facility or program.', NULL, 'EARNGED')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'EARNDIPL', 'Obtained high school diploma', 'The student obtained a high school diploma after exiting the facility or program.', NULL, 'EARNDIPL')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'EARNCRE', 'Earned high school course credits', 'The student earned high school course credits after exiting the facility or program.', NULL, 'EARNCRE')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'ENROLLGED', 'Enrolled in a GED program', 'The student enrolled in a GED program after exiting the facility or program.', NULL, 'ENROLLGED')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'POSTSEC', 'Were accepted and/or enrolled into postsecondary education', 'The student was accepted and/or enrolled into postsecondary education after exiting the facility or program.', NULL, 'POSTSEC')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'ENROLLTRAIN', 'Enrolled in job training courses/programs', 'The student enrolled in job training courses/programs after exiting the facility or program.', NULL, 'ENROLLTRAIN')
			,('EDFacts Academic or Career and Technical Outcome Exit Type', 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType', 'TBD', 'OBTAINEMP', 'Obtained employment', 'The student obtained employment after exiting the facility or program.', NULL, 'OBTAINEMP')

			----New Race element approved by the CEDS community - See Elements issue 125
			----https://github.com/CEDStandards/CEDS-Elements/issues/125
			,('Race', 'Race', 'TBD', 'AmericanIndianOrAlaskaNative', 'American Indian or Alaska Native', 'A person having origins in any of the original peoples of North and South America (including Central America), and who maintains cultural identification through tribal affiliation or community attachment.', NULL, NULL)
			,('Race', 'Race', 'TBD', 'Asian', 'Asian', 'A person having origins in any of the original peoples of the Far East, Southeast Asia, or the Indian Subcontinent. This area includes, for example, Cambodia, China, India, Japan, Korea, Malaysia, Pakistan, the Philippine Islands, Thailand, and Vietnam.', NULL, NULL)
			,('Race', 'Race', 'TBD', 'BlackOrAfricanAmerican', 'Black or African American', 'A person having origins in any of the black racial groups of Africa.', NULL, NULL)
			,('Race', 'Race', 'TBD', 'NativeHawaiianOrOtherPacificIslander', 'Native Hawaiian or Other Pacific Islander', 'A person having origins in any of the original peoples of Hawaii, Guam, Samoa, or other Pacific Islands.', NULL, NULL)
			,('Race', 'Race', 'TBD', 'White', 'White', 'A person having origins in any of the original peoples of Europe, Middle East, or North Africa.', NULL, NULL)
			,('Race', 'Race', 'TBD', 'DemographicRaceTwoOrMoreRaces', 'Demographic Race Two or More Races', 'A person having origins in any of more than one of the racial groups.', NULL, NULL)
			,('Race', 'Race', 'TBD', 'RaceAndEthnicityUnknown', 'Race and Ethnicity Unknown', 'The category used to report a person whose race and ethnicity are not known.', NULL, NULL)


			---------------------------------------------------------------
			---- Update existing options that have been changed -----------
			---- from version 9.0.0.0 to CEDS Version 10 when it-----------
			---- is released. These changes have been approved  -----------
			---- by the community.								-----------
			---------------------------------------------------------------

			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Correctional education program', CedsOptionSetDefinition = 'A program of Adult Basic Education ABE), Adult Secondary Education (ASE), or English Language Learner (ELL) instruction for adult criminal offenders in correctional institutions.' WHERE CedsElementName = 'Adult Education Special Program Type' AND CedsOptionSetCode = 'CorrectionalEducation'
			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Family Literacy Program',  CedsOptionSetDefinition = 'A program with a literacy component for parents and children or other intergenerational literacy components.' WHERE CedsElementName = 'Adult Education Special Program Type' AND CedsOptionSetCode = 'FamilyLiteracy'
			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Distance Education', CedsOptionSetDefinition = 'Formal learning activity where students and instructors are separated by geography, time, or both for the majority of the instructional period. Distance learning materials are delivered through a variety of media, including but not limited to, print, audio recording, videotape, broadcasts, computer software, Web-based programs, and other online technology. Teachers support distance learners through communication by mail, telephone, e-mail, or online technologies and software.' WHERE CedsElementName = 'Adult Education Special Program Type' AND CedsOptionSetCode = 'DistanceEducation'
			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Workplace Adult Education and Literacy Activities', CedsOptionSetDefinition = 'Adult education and literacy activities offered by an eligible provider in collaboration with an employer or employee organization at a workplace or an off-site location that is designed to improve the productivity of the workforce.' WHERE CedsElementName = 'Adult Education Special Program Type' AND CedsOptionSetCode = 'WorkplaceLiteracy'

			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Adult Basic Education', CedsOptionSetDefinition = 'A program of academic instruction and education services below the secondary level that increase an individual�s ability to read, write, and speak in English and perform mathematics necessary to attain a secondary school diploma or its recognized equivalent, transition to postsecondary education or training, and obtain employment.' WHERE CedsElementName = 'Adult Education Instructional Program Type' AND CedsOptionSetCode = 'ABE'
			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Adult Secondary Education', CedsOptionSetDefinition = 'A program of academic instruction and education services at the secondary level that increase an individual�s ability to read, write, and perform mathematics necessary to attain a secondary school diploma or its recognized equivalent, transition to postsecondary education or training, and obtain employment.' WHERE CedsElementName = 'Adult Education Instructional Program Type' AND CedsOptionSetCode = 'ASE'


			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Individualized education program (IEP)', CedsOptionSetDefinition = 'The role/relationship type assigned to an organization, institution, or agency responsible for creating and maintaining the student�s IEP, a written instructional plan for students with disabilities designated as special education students under the Individuals with Disabilities Education Act (IDEA-Part B) which includes: 1) a statement of present levels of educational performance of a child; 2) a statement of annual goals including short-term instructional objectives; 3) a statement of specific education and related services to be provided and the extent to which the child will be able to participate in regular educational programs; 4) a projected date for initiation and anticipated duration of services; and 5) appropriate objectives, criteria and evaluation procedures and schedules for determining, on at least an annual basis, whether instructional objectives are being achieved.' WHERE CedsElementName = 'Responsible District Type' AND CedsOptionSetCode = 'IndividualizedEducationProgram'


			UPDATE CEDS.CedsOptionSetMapping SET CedsOptionSetDescription = 'Individualized education program (IEP)', CedsOptionSetDefinition = 'The role/relationship type assigned to an organization, institution, or agency responsible for creating and maintaining the student�s IEP, a written instructional plan for students with disabilities designated as special education students under the Individuals with Disabilities Education Act (IDEA-Part B) which includes: 1) a statement of present levels of educational performance of a child; 2) a statement of annual goals including short-term instructional objectives; 3) a statement of specific education and related services to be provided and the extent to which the child will be able to participate in regular educational programs; 4) a projected date for initiation and anticipated duration of services; and 5) appropriate objectives, criteria and evaluation procedures and schedules for determining, on at least an annual basis, whether instructional objectives are being achieved.' WHERE CedsElementName = 'Responsible School Type' AND CedsOptionSetCode = 'IndividualizedEducationProgram'


	------------------------------------------------
	-- Populate DimAeDemgraphics				 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeDemographics d WHERE d.DimAeDemographicId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAeDemographics ON

		INSERT INTO [RDS].[DimAeDemographics]
			   ([DimAeDemographicId]
			   ,[EconomicDisadvantageStatusCode]
			   ,[EconomicDisadvantageStatusDescription]
			   ,[HomelessnessStatusCode]
			   ,[HomelessnessStatusDescription]
			   ,[EnglishLearnerStatusCode]
			   ,[EnglishLearnerStatusDescription]
			   ,[MigrantStatusCode]
			   ,[MigrantStatusDescription]
			   ,[MilitaryConnectedStudentIndicatorCode]
			   ,[MilitaryConnectedStudentIndicatorDescription]
			   ,[HomelessPrimaryNighttimeResidenceCode]
			   ,[HomelessPrimaryNighttimeResidenceDescription]
			   ,[HomelessUnaccompaniedYouthStatusCode]
			   ,[HomelessUnaccompaniedYouthStatusDescription]
			   ,[SexCode]
			   ,[SexDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeDemographics OFF

	END
	

		CREATE TABLE #EconomicDisadvantageStatus (EconomicDisadvantageStatusCode VARCHAR(50), EconomicDisadvantageStatusDescription VARCHAR(200))

		INSERT INTO #EconomicDisadvantageStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #EconomicDisadvantageStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EconomicDisadvantageStatus'

		CREATE TABLE #HomelessnessStatus (HomelessnessStatusCode VARCHAR(50), HomelessnessStatusDescription VARCHAR(200))

		INSERT INTO #HomelessnessStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #HomelessnessStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessnessStatus'

		CREATE TABLE #EnglishLearnerStatus (EnglishLearnerStatusCode VARCHAR(50), EnglishLearnerStatusDescription VARCHAR(200))

		INSERT INTO #EnglishLearnerStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #EnglishLearnerStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EnglishLearnerStatus'

		CREATE TABLE #MigrantStatus (MigrantStatusCode VARCHAR(50), MigrantStatusDescription VARCHAR(200))

		INSERT INTO #MigrantStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #MigrantStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MigrantStatus'

		CREATE TABLE #MilitaryConnectedStudentIndicator (MilitaryConnectedStudentIndicatorCode VARCHAR(50), MilitaryConnectedStudentIndicatorDescription VARCHAR(200))

		INSERT INTO #MilitaryConnectedStudentIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #MilitaryConnectedStudentIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MilitaryConnectedStudentIndicator'

		CREATE TABLE #HomelessPrimaryNighttimeResidence (HomelessPrimaryNighttimeResidenceCode VARCHAR(50), HomelessPrimaryNighttimeResidenceDescription VARCHAR(200))

		INSERT INTO #HomelessPrimaryNighttimeResidence VALUES ('MISSING', 'MISSING')
		INSERT INTO #HomelessPrimaryNighttimeResidence 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

		CREATE TABLE #HomelessUnaccompaniedYouthStatus (HomelessUnaccompaniedYouthStatusCode VARCHAR(50), HomelessUnaccompaniedYouthStatusDescription VARCHAR(200))

		INSERT INTO #HomelessUnaccompaniedYouthStatus VALUES ('MISSING', 'MISSING')
		INSERT INTO #HomelessUnaccompaniedYouthStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessUnaccompaniedYouthStatus'

		CREATE TABLE #Sex (SexCode VARCHAR(50), SexDescription VARCHAR(200))

		INSERT INTO #Sex VALUES ('MISSING', 'MISSING')
		INSERT INTO #Sex 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'Sex'


		INSERT INTO [RDS].[DimAeDemographics]
				([EconomicDisadvantageStatusCode]
				,[EconomicDisadvantageStatusDescription]
				,[HomelessnessStatusCode]
				,[HomelessnessStatusDescription]
				,[EnglishLearnerStatusCode]
				,[EnglishLearnerStatusDescription]
				,[MigrantStatusCode]
				,[MigrantStatusDescription]
				,[MilitaryConnectedStudentIndicatorCode]
				,[MilitaryConnectedStudentIndicatorDescription]
				,[HomelessPrimaryNighttimeResidenceCode]
				,[HomelessPrimaryNighttimeResidenceDescription]
				,[HomelessUnaccompaniedYouthStatusCode]
				,[HomelessUnaccompaniedYouthStatusDescription]
				,[SexCode]
				,[SexDescription])
		SELECT DISTINCT
			  a.EconomicDisadvantageStatusCode
			, a.EconomicDisadvantageStatusDescription
			, b.HomelessnessStatusCode
			, b.HomelessnessStatusDescription
			, c.EnglishLearnerStatusCode
			, c.EnglishLearnerStatusDescription
			, d.MigrantStatusCode
			, d.MigrantStatusDescription
			, e.MilitaryConnectedStudentIndicatorCode
			, e.MilitaryConnectedStudentIndicatorDescription
			, f.HomelessPrimaryNighttimeResidenceCode
			, f.HomelessPrimaryNighttimeResidenceDescription
			, g.HomelessUnaccompaniedYouthStatusCode
			, g.HomelessUnaccompaniedYouthStatusDescription
			, h.SexCode
			, h.SexDescription
		FROM #EconomicDisadvantageStatus a
		CROSS JOIN #HomelessnessStatus b
		CROSS JOIN #EnglishLearnerStatus c
		CROSS JOIN #MigrantStatus d
		CROSS JOIN #MilitaryConnectedStudentIndicator e
		CROSS JOIN #HomelessPrimaryNighttimeResidence f
		CROSS JOIN #HomelessUnaccompaniedYouthStatus g
		CROSS JOIN #Sex h
		LEFT JOIN rds.DimAeDemographics main
			ON a.EconomicDisadvantageStatusCode = main.EconomicDisadvantageStatusCode
			AND b.HomelessnessStatusCode = main.HomelessnessStatusCode
			AND c.EnglishLearnerStatusCode = main.EnglishLearnerStatusCode
			AND d.MigrantStatusCode = main.MigrantStatusCode
			AND e.MilitaryConnectedStudentIndicatorCode = main.MilitaryConnectedStudentIndicatorCode
			AND f.HomelessPrimaryNighttimeResidenceCode = main.HomelessPrimaryNighttimeResidenceCode
			AND g.HomelessUnaccompaniedYouthStatusCode = main.HomelessUnaccompaniedYouthStatusCode
			AND h.SexCode = main.SexCode
		WHERE main.DimAeDemographicId IS NULL


		DROP TABLE #EconomicDisadvantageStatus
		DROP TABLE #HomelessnessStatus
		DROP TABLE #EnglishLearnerStatus
		DROP TABLE #MigrantStatus
		DROP TABLE #MilitaryConnectedStudentIndicator
		DROP TABLE #HomelessPrimaryNighttimeResidence
		DROP TABLE #HomelessUnaccompaniedYouthStatus
		DROP TABLE #Sex



	------------------------------------------------
	-- Populate DimAeProgramTypes				 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeProgramTypes d WHERE d.DimAeProgramTypeId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAeProgramTypes ON

		INSERT INTO [RDS].[DimAeProgramTypes]
           ([DimAeProgramTypeId]
		   ,[AeInstructionalProgramTypeCode]
           ,[AeInstructionalProgramTypeDescription]
           ,[AeSpecialProgramTypeCode]
           ,[AeSpecialProgramTypeDescription]
           ,[WioaCareerServicesCode]
           ,[WioaCareerServicesDescription]
           ,[WioaTrainingServicesCode]
           ,[WioaTrainingServicesDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeProgramTypes OFF

	END
	

		CREATE TABLE #AeInstructionalProgramType (AeInstructionalProgramTypeCode VARCHAR(50), AeInstructionalProgramTypeDescription VARCHAR(200))

		INSERT INTO #AeInstructionalProgramType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeInstructionalProgramType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationInstructionalProgramType'

		CREATE TABLE #AeSpecialProgramType (AeSpecialProgramTypeCode VARCHAR(50), AeSpecialProgramTypeDescription VARCHAR(200))

		INSERT INTO #AeSpecialProgramType VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeSpecialProgramType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationSpecialProgramType'

		CREATE TABLE #WioaCareerServiceType (WioaCareerServicesCode VARCHAR(50), WioaCareerServicesDescription VARCHAR(200))

		INSERT INTO #WioaCareerServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaCareerServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'WioaCareerServices'

		CREATE TABLE #WioaTrainingServiceType (WioaTrainingServicesCode VARCHAR(50), WioaTrainingServicesDescription VARCHAR(200))

		INSERT INTO #WioaTrainingServiceType VALUES ('MISSING', 'MISSING')
		INSERT INTO #WioaTrainingServiceType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'WioaTrainingServices'


		INSERT INTO [RDS].[DimAeProgramTypes]
			([AeInstructionalProgramTypeCode]
			,[AeInstructionalProgramTypeDescription]
			,[AeSpecialProgramTypeCode]
			,[AeSpecialProgramTypeDescription]
			,[WioaCareerServicesCode]
			,[WioaCareerServicesDescription]
			,[WioaTrainingServicesCode]
			,[WioaTrainingServicesDescription])
		SELECT DISTINCT
			 a.[AeInstructionalProgramTypeCode]
			,a.[AeInstructionalProgramTypeDescription]
			,b.[AeSpecialProgramTypeCode]
			,b.[AeSpecialProgramTypeDescription]
			,c.[WioaCareerServicesCode]
			,c.[WioaCareerServicesDescription]
			,d.[WioaTrainingServicesCode]
			,d.[WioaTrainingServicesDescription]
		FROM #AeInstructionalProgramType a
		CROSS JOIN #AeSpecialProgramType b
		CROSS JOIN #WioaCareerServiceType c
		CROSS JOIN #WioaTrainingServiceType d
		LEFT JOIN rds.DimAeProgramTypes main
			ON a.AeInstructionalProgramTypeCode = main.AeInstructionalProgramTypeCode
			AND b.AeSpecialProgramTypeCode = main.AeSpecialProgramTypeCode
			AND c.WioaCareerServicesCode = main.WioaCareerServicesCode
			AND d.WioaTrainingServicesCode = main.WioaTrainingServicesCode
		WHERE main.DimAeProgramTypeId IS NULL


		DROP TABLE #AeInstructionalProgramType
		DROP TABLE #AeSpecialProgramType
		DROP TABLE #WioaCareerServiceType
		DROP TABLE #WioaTrainingServiceType


	------------------------------------------------
	-- Populate DimAeStudentStatuses			 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimAeStudentStatuses d WHERE d.DimAeStudentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimAeStudentStatuses ON

		INSERT INTO [RDS].[DimAeStudentStatuses]
           ([DimAeStudentStatusId]
		   ,[AeFunctioningLevelAtIntakeCode]
           ,[AeFunctioningLevelAtIntakeDescription]
           ,[AeFunctioningLevelAtPosttestCode]
           ,[AeFunctioningLevelAtPosttestDescription]
           ,[AePostsecondaryTransitionActionCode]
           ,[AePostsecondaryTransitionActionDescription]
           ,[EmployedWhileEnrolledCode]
           ,[EmployedWhileEnrolledDescription]
           ,[EmployedAfterExitCode]
           ,[EmployedAfterExitDescription]
           ,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
           ,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
           ,[AdultEducationCredentialAttainmentEmployedIndicatorCode]
           ,[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
           ,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
           ,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimAeStudentStatuses OFF
	END
	

		CREATE TABLE #AeFunctioningLevelAtIntake (AeFunctioningLevelAtIntakeCode VARCHAR(50), AeFunctioningLevelAtIntakeDescription VARCHAR(200))

		INSERT INTO #AeFunctioningLevelAtIntake VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeFunctioningLevelAtIntake 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtIntake'

		CREATE TABLE #AeFunctioningLevelAtPosttest (AeFunctioningLevelAtPosttestCode VARCHAR(50), AeFunctioningLevelAtPosttestDescription VARCHAR(200))

		INSERT INTO #AeFunctioningLevelAtPosttest VALUES ('MISSING', 'MISSING')
		INSERT INTO #AeFunctioningLevelAtPosttest 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AeFunctioningLevelAtPosttest'

		CREATE TABLE #AePostsecondaryTransitionAction (AePostsecondaryTransitionActionCode VARCHAR(50), AePostsecondaryTransitionActionDescription VARCHAR(200))

		INSERT INTO #AePostsecondaryTransitionAction VALUES ('MISSING', 'MISSING')
		INSERT INTO #AePostsecondaryTransitionAction 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AePostsecondaryTransitionAction'

		CREATE TABLE #EmployedWhileEnrolled (EmployedWhileEnrolledCode VARCHAR(50), EmployedWhileEnrolledDescription VARCHAR(200))

		INSERT INTO #EmployedWhileEnrolled VALUES ('MISSING', 'MISSING')
		INSERT INTO #EmployedWhileEnrolled 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EmployedWhileEnrolled'

		CREATE TABLE #EmployedAfterExit (EmployedAfterExitCode VARCHAR(50), EmployedAfterExitDescription VARCHAR(200))

		INSERT INTO #EmployedAfterExit VALUES ('MISSING', 'MISSING')
		INSERT INTO #EmployedAfterExit 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EmployedAfterExit'

		CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator (AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator'

		CREATE TABLE #AdultEducationCredentialAttainmentEmployedIndicator (AdultEducationCredentialAttainmentEmployedIndicatorCode VARCHAR(50),AdultEducationCredentialAttainmentEmployedIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentEmployedIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentEmployedIndicator'

		CREATE TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator (AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode VARCHAR(50), AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription VARCHAR(200))

		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator VALUES ('MISSING', 'MISSING')
		INSERT INTO #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator'

		INSERT INTO [RDS].[DimAeStudentStatuses]
			([AeFunctioningLevelAtIntakeCode]
			,[AeFunctioningLevelAtIntakeDescription]
			,[AeFunctioningLevelAtPosttestCode]
			,[AeFunctioningLevelAtPosttestDescription]
			,[AePostsecondaryTransitionActionCode]
			,[AePostsecondaryTransitionActionDescription]
			,[EmployedWhileEnrolledCode]
			,[EmployedWhileEnrolledDescription]
			,[EmployedAfterExitCode]
			,[EmployedAfterExitDescription]
			,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
			,[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
			,[AdultEducationCredentialAttainmentEmployedIndicatorCode]
			,[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
			,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
			,[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription])
		SELECT DISTINCT
			 a.[AeFunctioningLevelAtIntakeCode]
			,a.[AeFunctioningLevelAtIntakeDescription]
			,b.[AeFunctioningLevelAtPosttestCode]
			,b.[AeFunctioningLevelAtPosttestDescription]
			,c.[AePostsecondaryTransitionActionCode]
			,c.[AePostsecondaryTransitionActionDescription]
			,d.[EmployedWhileEnrolledCode]
			,d.[EmployedWhileEnrolledDescription]
			,e.[EmployedAfterExitCode]
			,e.[EmployedAfterExitDescription]
			,f.[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]
			,f.[AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription]
			,g.[AdultEducationCredentialAttainmentEmployedIndicatorCode]
			,g.[AdultEducationCredentialAttainmentEmployedIndicatorDescription]
			,h.[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]
			,h.[AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription]
		FROM #AeFunctioningLevelAtIntake a
		CROSS JOIN #AeFunctioningLevelAtPosttest b
		CROSS JOIN #AePostsecondaryTransitionAction c
		CROSS JOIN #EmployedWhileEnrolled d
		CROSS JOIN #EmployedAfterExit e
		CROSS JOIN #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator f
		CROSS JOIN #AdultEducationCredentialAttainmentEmployedIndicator g
		CROSS JOIN #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator h
		LEFT JOIN rds.DimAeStudentStatuses main
			ON a.AeFunctioningLevelAtIntakeCode = main.AeFunctioningLevelAtIntakeCode
			AND b.AeFunctioningLevelAtPosttestCode = main.AeFunctioningLevelAtPosttestCode
			AND c.AePostsecondaryTransitionActionCode = main.AePostsecondaryTransitionActionCode
			AND d.EmployedWhileEnrolledCode = main.EmployedWhileEnrolledCode
			AND e.EmployedAfterExitCode = main.EmployedAfterExitCode
			AND f.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode = main.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode
			AND g.AdultEducationCredentialAttainmentEmployedIndicatorCode = main.AdultEducationCredentialAttainmentEmployedIndicatorCode
			AND h.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode = main.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode
		WHERE main.DimAeStudentStatusId IS NULL


		DROP TABLE #AeFunctioningLevelAtIntake
		DROP TABLE #AeFunctioningLevelAtPosttest
		DROP TABLE #AePostsecondaryTransitionAction
		DROP TABLE #EmployedWhileEnrolled
		DROP TABLE #EmployedAfterExit
		DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator
		DROP TABLE #AdultEducationCredentialAttainmentEmployedIndicator
		DROP TABLE #AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator

	------------------------------------------------
	-- Populate DimRaces						 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimRaces d WHERE d.RaceCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimRaces ON

		INSERT INTO RDS.DimRaces (DimRaceId, RaceCode, RaceDescription, RaceEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimRaces OFF
	END

	INSERT INTO RDS.DimRaces
		(
			  RaceCode
			, RaceDescription
			, RaceEdFactsCode
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimRaces main
		ON ceds.CedsOptionSetCode = main.RaceCode
	WHERE main.RaceCode IS NULL
		AND ceds.CedsElementTechnicalName = 'Race'


	-------------------
	-- Populate DimAges
	-------------------
	-- Create MISSING record 
	IF NOT EXISTS (SELECT 1 FROM RDS.DimAges WHERE DimAgeId = -1) BEGIN 
		SET IDENTITY_INSERT RDS.DimAges ON;
		INSERT INTO RDS.DimAges (DimAgeId, AgeCode, AgeDescription, AgeEdFactsCode, AgeValue) VALUES (-1, 'MISSING', 'MISSING', 'MISSING', -1)
		SET IDENTITY_INSERT RDS.DimAges OFF;  
	END

	-- Create a temp table and fill it with ages 1-130
	CREATE TABLE #Ages (Age INT IDENTITY(1,1))

	DECLARE @loop INT = 1
	WHILE @loop <= 130 BEGIN
		INSERT INTO #Ages DEFAULT VALUES
		SET @loop = @loop + 1
	END

	-- Insert ages that aren't already in DimAges
	INSERT INTO RDS.DimAges
	SELECT CAST(Age AS VARCHAR(3)), 'Age ' + CAST(Age AS VARCHAR(3)), CAST(Age AS VARCHAR(3)), Age 
	FROM #Ages a
	LEFT JOIN RDS.DimAges da
		ON CAST(a.Age AS VARCHAR(3)) = da.AgeCode
	WHERE da.AgeCode IS NULL

	-- Drop the temp table
	DROP TABLE #Ages


	---------------------------------
	-- Populate DimK12ProgramTypes
	---------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12ProgramTypes WHERE ProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12ProgramTypes ON

		INSERT INTO RDS.DimK12ProgramTypes (DimK12ProgramTypeId, ProgramTypeCode, ProgramTypeDescription, ProgramTypeDefinition)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12ProgramTypes OFF
	END

	INSERT INTO RDS.DimK12ProgramTypes
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.CedsOptionSetDefinition
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimK12ProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.ProgramTypeCode IS NULL
		AND ceds.CedsElementName = 'Program Type'

	---------------------------------
	-- Populate DimSchoolYears
	---------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimSchoolYears s WHERE s.SchoolYear = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimSchoolYears ON

		INSERT INTO RDS.DimSchoolYears (DimSchoolYearId, SchoolYear, SessionBeginDate, SessionEndDate)
			VALUES (-1, -1, '1/1/1900', '1/1/1900')

		SET IDENTITY_INSERT RDS.DimSchoolYears OFF
	END

	------------------------------------------------
	-- Populate DimK12CourseStatuses			 ---
	------------------------------------------------
	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12CourseStatuses d WHERE d.CourseLevelCharacteristicCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12CourseStatuses ON

		INSERT INTO RDS.DimK12CourseStatuses(DimK12CourseStatusId,CourseLevelCharacteristicCode, CourseLevelCharacteristicDescription)
		VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12CourseStatuses OFF
	END

	INSERT INTO RDS.DimK12CourseStatuses
		(
		  CourseLevelCharacteristicCode        
		, CourseLevelCharacteristicDescription     
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimK12CourseStatuses main
		ON ceds.CedsOptionSetCode = main.CourseLevelCharacteristicCode
	WHERE main.DimK12CourseStatusId IS NULL
		AND ceds.CedsElementName = 'Course Level Characteristic'

	------------------------------------------------
	-- Populate DimDates						 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimDates d WHERE d.DimDateId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimDates ON

		INSERT INTO RDS.DimDates ([DimDateId], [DateValue], [Day], [DayOfWeek], [DayOfYear], [Month], [MonthName], SubmissionYear, [Year] )
			VALUES (-1, '1/1/1900', -1, 'MISSING', -1, -1, 'MISSING', 'MISSING', -1)

		SET IDENTITY_INSERT RDS.DimDates OFF
	END

	DECLARE @start DATE = '2000-01-01', @end DATE= '2050-12-31'

	WHILE @start <= @end
	BEGIN
		INSERT INTO RDS.DimDates (
			  DateValue
			, [Day]
			, [DayOfWeek]
			, [DayOfYear]
			, [Month]
			, [MonthName]
			, SubmissionYear
			, [Year] )
		SELECT 
			  @start
			, DATEPART(dd,@start)
			, DATEPART(dw,@start)
			, DATEPART(dy,@start) 
			, DATEPART(mm,@start)
			, DATENAME(mm,@start)
			, CASE 
				WHEN CAST(DATEPART(mm, @start) AS INT) >= 7 THEN YEAR(@start) + 1
				ELSE YEAR(@start)
			  END
			, YEAR(@start)
		WHERE NOT EXISTS (SELECT 1 FROM RDS.DimDates WHERE DateValue = @start)
	
		SET @start = DATEADD(dd,1,@start)
	  END


	------------------------------------------------
	-- Populate DimPsAcademicAwardStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsAcademicAwardStatuses d WHERE d.DimPsAcademicAwardStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsAcademicAwardStatuses ON

		INSERT INTO [RDS].[DimPsAcademicAwardStatuses]
           ([DimPsAcademicAwardStatusId]
		   ,[PescAwardLevelTypeCode]
           ,[PescAwardLevelTypeDescription]
           ,[ProfessionalOrTechnicalCredentialConferredCode]
           ,[ProfessionalOrTechnicalCredentialConferredDescription])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsAcademicAwardStatuses OFF
	END


	CREATE TABLE #PescAwardLevelType (PescAwardLevelTypeCode VARCHAR(50), PescAwardLevelTypeDescription VARCHAR(200))

	INSERT INTO #PescAwardLevelType VALUES ('MISSING', 'MISSING')
	INSERT INTO #PescAwardLevelType 
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PescAwardLevelType'

	CREATE TABLE #ProfessionalOrTechnicalCredentialConferred (ProfessionalOrTechnicalCredentialConferredCode VARCHAR(50), ProfessionalOrTechnicalCredentialConferredDescription VARCHAR(200))

	INSERT INTO #ProfessionalOrTechnicalCredentialConferred VALUES ('MISSING', 'MISSING')
	INSERT INTO #ProfessionalOrTechnicalCredentialConferred
	SELECT
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ProfessionalOrTechnicalCredentialConferred'

	-- Populate RDS.DimPsAcademicAwardStatuses
	INSERT INTO RDS.DimPsAcademicAwardStatuses
	SELECT
		  a.PescAwardLevelTypeCode
		, a.PescAwardLevelTypeDescription
		, b.ProfessionalOrTechnicalCredentialConferredCode
		, b.ProfessionalOrTechnicalCredentialConferredDescription
	FROM #PescAwardLevelType a
	CROSS JOIN #ProfessionalOrTechnicalCredentialConferred b
	LEFT JOIN RDS.DimPsAcademicAwardStatuses main
		ON a.PescAwardLevelTypeCode = main.PescAwardLevelTypeCode
		AND b.ProfessionalOrTechnicalCredentialConferredCode = main.ProfessionalOrTechnicalCredentialConferredCode
	WHERE main.DimPsAcademicAwardStatusId IS NULL

	DROP TABLE #PescAwardLevelType
	DROP TABLE #ProfessionalOrTechnicalCredentialConferred


	------------------------------------------------
	-- Populate DimPsEnrollmentStatuses			 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsEnrollmentStatuses d WHERE d.PostsecondaryExitOrWithdrawalTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimPsEnrollmentStatuses ON

		INSERT INTO RDS.DimPsEnrollmentStatuses (DimPsEnrollmentStatusId, PostsecondaryExitOrWithdrawalTypeCode, PostsecondaryExitOrWithdrawalTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimPsEnrollmentStatuses OFF
	END

	INSERT INTO RDS.DimPsEnrollmentStatuses
		(
			  PostsecondaryExitOrWithdrawalTypeCode
			, PostsecondaryExitOrWithdrawalTypeDescription
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimPsEnrollmentStatuses main
		ON ceds.CedsOptionSetCode = main.PostsecondaryExitOrWithdrawalTypeCode
	WHERE main.DimPsEnrollmentStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'PostsecondaryExitOrWithdrawalType'


	------------------------------------------------
	-- Populate DimK12EnrollmentStatuses			 ---
	------------------------------------------------


	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12EnrollmentStatuses d WHERE d.DimK12EnrollmentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses ON

		INSERT INTO [RDS].[DimK12EnrollmentStatuses]
           ([DimK12EnrollmentStatusId]
		   ,[EnrollmentStatusCode]
           ,[EnrollmentStatusDescription]
           ,[EntryTypeCode]
           ,[EntryTypeDescription]
           ,[ExitOrWithdrawalTypeCode]
           ,[ExitOrWithdrawalTypeDescription]
           ,[PostSecondaryEnrollmentStatusCode]
           ,[PostSecondaryEnrollmentStatusDescription]
           ,[PostSecondaryEnrollmentStatusEdFactsCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription]
           ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12EnrollmentStatuses OFF
	END

	CREATE TABLE #EnrollmentStatus (EnrollmentStatusCode VARCHAR(50), EnrollmentStatusDescription VARCHAR(200))

	INSERT INTO #EnrollmentStatus VALUES ('MISSING', 'MISSING')
	INSERT INTO #EnrollmentStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EnrollmentStatus'

	CREATE TABLE #EntryType (EntryTypeCode VARCHAR(50), EntryTypeDescription VARCHAR(200))

	INSERT INTO #EntryType VALUES ('MISSING', 'MISSING')
	INSERT INTO #EntryType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EntryType'

	CREATE TABLE #ExitOrWithdrawalType (ExitOrWithdrawalTypeCode VARCHAR(50), ExitOrWithdrawalTypeDescription VARCHAR(200))

	INSERT INTO #ExitOrWithdrawalType VALUES ('MISSING', 'MISSING')
	INSERT INTO #ExitOrWithdrawalType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ExitOrWithdrawalType'

	CREATE TABLE #PostSecondaryEnrollmentStatus (PostSecondaryEnrollmentStatusCode VARCHAR(50), PostSecondaryEnrollmentStatusDescription VARCHAR(200), PostSecondaryEnrollmentStatusEdFactsCode VARCHAR(50))

	INSERT INTO #PostSecondaryEnrollmentStatus VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #PostSecondaryEnrollmentStatus 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PostSecondaryEnrollmentStatus'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType (EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeType'

	CREATE TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType (EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode VARCHAR(50), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription VARCHAR(200), EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode VARCHAR(50))

	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType VALUES ('MISSING', 'MISSING', 'MISSING')
	INSERT INTO #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
		, EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'EdFactsAcademicOrCareerAndTechnicalOutcomeExitType'


	INSERT INTO RDS.DimK12EnrollmentStatuses
		([EnrollmentStatusCode]
		,[EnrollmentStatusDescription]
		,[EntryTypeCode]
		,[EntryTypeDescription]
		,[ExitOrWithdrawalTypeCode]
		,[ExitOrWithdrawalTypeDescription]
		,[PostSecondaryEnrollmentStatusCode]
		,[PostSecondaryEnrollmentStatusDescription]
		,[PostSecondaryEnrollmentStatusEdFactsCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription]
        ,[EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode])
	SELECT DISTINCT
		  a.EnrollmentStatusCode
		, a.EnrollmentStatusDescription
		, b.EntryTypeCode
		, b.EntryTypeDescription
		, c.ExitOrWithdrawalTypeCode
		, c.ExitOrWithdrawalTypeDescription
		, d.PostSecondaryEnrollmentStatusCode
		, d.PostSecondaryEnrollmentStatusDescription
		, d.PostSecondaryEnrollmentStatusEdFactsCode
		, e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode
		, e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription
		, e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode
		, f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
		, f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription
		, f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode
	FROM #EnrollmentStatus a
	CROSS JOIN #EntryType b
	CROSS JOIN #ExitOrWithdrawalType c
	CROSS JOIN #PostSecondaryEnrollmentStatus d
	CROSS JOIN #EdFactsAcademicOrCareerAndTechnicalOutcomeType e
	CROSS JOIN #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType f
	LEFT JOIN rds.DimK12EnrollmentStatuses main
		ON a.EnrollmentStatusCode = main.EnrollmentStatusCode
		AND b.EntryTypeCode = main.EntryTypeCode
		AND c.ExitOrWithdrawalTypeCode = main.ExitOrWithdrawalTypeCode
		AND d.PostSecondaryEnrollmentStatusCode = main.PostSecondaryEnrollmentStatusCode
		AND e.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode = main.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode
		AND f.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode = main.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode
	WHERE main.DimK12EnrollmentStatusId IS NULL

	DROP TABLE #EnrollmentStatus
	DROP TABLE #EntryType
	DROP TABLE #ExitOrWithdrawalType
	DROP TABLE #PostSecondaryEnrollmentStatus
	DROP TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeType
	DROP TABLE #EdFactsAcademicOrCareerAndTechnicalOutcomeExitType



	------------------------------------------------
	-- Populate DimPsInstitutionStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimPsInstitutionStatuses d WHERE d.DimPsInstitutionStatusId= -1) BEGIN
		SET IDENTITY_INSERT RDS.DimPsInstitutionStatuses ON

		INSERT INTO RDS.DimPsInstitutionStatuses (
			  DimPsInstitutionStatusId
			, LevelOfInstitutionCode
			, LevelOfInstitutionDescription
			, ControlOfInstitutionCode
			, ControlOfInstitutionDescription
			, VirtualIndicatorCode
			, VirtualIndicatorDescription
			, CarnegieBasicClassificationCode
			, CarnegieBasicClassificationDescription
			, MostPrevalentLevelOfInstitutionCode
			, MostPrevalentLevelOfInstitutionDescription
			, PredominantCalendarSystemCode
			, PredominantCalendarSystemDescription
			)
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimPsInstitutionStatuses OFF
	END

	CREATE TABLE #LevelOfInstitution (LevelOfInstitutionCode VARCHAR(50), LevelOfInstitutionDescription VARCHAR(200))

	INSERT INTO #LevelOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #LevelOfInstitution 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'LevelOfInstitution'

	CREATE TABLE #ControlOfInstitution (ControlOfInstitutionCode VARCHAR(50), ControlOfInstitutionDescription VARCHAR(200))

	INSERT INTO #ControlOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #ControlOfInstitution
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'ControlOfInstitution'

	CREATE TABLE #CarnegieBasicClassification (CarnegieBasicClassificationCode VARCHAR(50), CarnegieBasicClassificationDescription VARCHAR(200))

	INSERT INTO #CarnegieBasicClassification VALUES ('MISSING', 'MISSING')
	INSERT INTO #CarnegieBasicClassification 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'CarnegieBasicClassification'

	CREATE TABLE #VirtualIndicator (VirtualIndicatorCode VARCHAR(50), VirtualIndicatorDescription VARCHAR(200))

	INSERT INTO #VirtualIndicator VALUES ('MISSING', 'MISSING')
	INSERT INTO #VirtualIndicator 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'VirtualIndicator'

	CREATE TABLE #MostPrevalentLevelOfInstitution (MostPrevalentLevelOfInstitutionStatusCode VARCHAR(50), MostPrevalentLevelOfInstitutionDescription VARCHAR(200))

	INSERT INTO #MostPrevalentLevelOfInstitution VALUES ('MISSING', 'MISSING')
	INSERT INTO #MostPrevalentLevelOfInstitution 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'MostPrevalentLevelOfInstitution'
	
	CREATE TABLE #PredominantCalendarSystem (PredominantCalendarSystemCode VARCHAR(50), PredominantCalendarSystemDescription VARCHAR(200))

	INSERT INTO #PredominantCalendarSystem VALUES ('MISSING', 'MISSING')
	INSERT INTO #PredominantCalendarSystem 
	SELECT 
		  CedsOptionSetCode
		, CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping
	WHERE CedsElementTechnicalName = 'PredominantCalendarSystem'

	
	INSERT INTO RDS.DimPsInstitutionStatuses (
			  LevelOfInstitutionCode
			, LevelOfInstitutionDescription
			, ControlOfInstitutionCode
			, ControlOfInstitutionDescription
			, VirtualIndicatorCode
			, VirtualIndicatorDescription
			, CarnegieBasicClassificationCode
			, CarnegieBasicClassificationDescription
			, MostPrevalentLevelOfInstitutionCode
			, MostPrevalentLevelOfInstitutionDescription
			, PredominantCalendarSystemCode
			, PredominantCalendarSystemDescription
			)		
	SELECT DISTINCT
		  a.LevelOfInstitutionCode
		, a.LevelOfInstitutionDescription
		, b.ControlOfInstitutionCode
		, b.ControlOfInstitutionDescription
		, c.CarnegieBasicClassificationCode
		, c.CarnegieBasicClassificationDescription
		, d.VirtualIndicatorCode
		, d.VirtualIndicatorDescription
		, e.MostPrevalentLevelOfInstitutionStatusCode
		, e.MostPrevalentLevelOfInstitutionDescription
		, f.PredominantCalendarSystemCode
		, f.PredominantCalendarSystemDescription
	FROM #LevelOfInstitution a
	CROSS JOIN #ControlOfInstitution b
	CROSS JOIN #CarnegieBasicClassification c
	CROSS JOIN #VirtualIndicator d
	CROSS JOIN #MostPrevalentLevelOfInstitution e
	CROSS JOIN #PredominantCalendarSystem f
	LEFT JOIN rds.DimPsInstitutionStatuses main
		ON a.LevelOfInstitutionCode = main.LevelOfInstitutionCode
		AND b.ControlOfInstitutionCode = main.ControlOfInstitutionCode
		AND c.CarnegieBasicClassificationCode = main.CarnegieBasicClassificationCode
		AND d.VirtualIndicatorCode = main.VirtualIndicatorCode
		AND e.MostPrevalentLevelOfInstitutionStatusCode = main.MostPrevalentLevelOfInstitutionCode
		AND f.PredominantCalendarSystemCode = main.PredominantCalendarSystemCode
	WHERE main.DimPsInstitutionStatusId IS NULL

	DROP TABLE #LevelOfInstitution
	DROP TABLE #CarnegieBasicClassification
	DROP TABLE #ControlOfInstitution
	DROP TABLE #VirtualIndicator
	DROP TABLE #MostPrevalentLevelOfInstitution
	DROP TABLE #PredominantCalendarSystem


	------------------------------------------------
	-- Populate DimProgramTypes					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimProgramTypes d WHERE d.ProgramTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimProgramTypes ON

		INSERT INTO RDS.DimProgramTypes (DimProgramTypeId, ProgramTypeCode, ProgramTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimProgramTypes OFF
	END

	INSERT INTO RDS.DimProgramTypes
		(
			  ProgramTypeCode
			, ProgramTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN rds.DimProgramTypes main
		ON ceds.CedsOptionSetCode = main.ProgramTypeCode
	WHERE main.DimProgramTypeId IS NULL


	------------------------------------------------
	-- Populate DimAcademicTermDesignators		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimAcademicTermDesignators d WHERE d.AcademicTermDesignatorCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimAcademicTermDesignators ON

		INSERT INTO RDS.DimAcademicTermDesignators (DimAcademicTermDesignatorId, AcademicTermDesignatorCode, AcademicTermDesignatorDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimAcademicTermDesignators OFF
	END

	INSERT INTO RDS.DimAcademicTermDesignators
		(
			  AcademicTermDesignatorCode
			, AcademicTermDesignatorDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimAcademicTermDesignators main
		ON ceds.CedsOptionSetCode = main.AcademicTermDesignatorCode
	WHERE main.DimAcademicTermDesignatorId IS NULL
		AND ceds.CedsElementTechnicalName = 'AcademicTermDesignator'


	-----------------------------------------------------
	-- Populate DimK12Demographics                     --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12Demographics d WHERE d.DimK12DemographicId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12Demographics ON

		INSERT INTO [RDS].[DimK12Demographics]
           ([DimK12DemographicId]
		   ,[EconomicDisadvantageStatusCode]
           ,[EconomicDisadvantageStatusDescription]
           ,[EconomicDisadvantageStatusEdFactsCode]
           ,[HomelessnessStatusCode]
           ,[HomelessnessStatusDescription]
           ,[HomelessnessStatusEdFactsCode]
           ,[EnglishLearnerStatusCode]
           ,[EnglishLearnerStatusDescription]
           ,[EnglishLearnerStatusEdFactsCode]
           ,[MigrantStatusCode]
           ,[MigrantStatusDescription]
           ,[MigrantStatusEdFactsCode]
           ,[MilitaryConnectedStudentIndicatorCode]
           ,[MilitaryConnectedStudentIndicatorDescription]
           ,[MilitaryConnectedStudentIndicatorEdFactsCode]
           ,[HomelessPrimaryNighttimeResidenceCode]
           ,[HomelessPrimaryNighttimeResidenceDescription]
           ,[HomelessPrimaryNighttimeResidenceEdFactsCode]
           ,[HomelessUnaccompaniedYouthStatusCode]
           ,[HomelessUnaccompaniedYouthStatusDescription]
           ,[HomelessUnaccompaniedYouthStatusEdFactsCode]
           ,[SexCode]
           ,[SexDescription]
           ,[SexEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12Demographics OFF

	END

		CREATE TABLE #K12EconomicDisadvantageStatus (EconomicDisadvantageStatusCode VARCHAR(50), EconomicDisadvantageStatusDescription VARCHAR(200), EconomicDisadvantageStatusEdFactsCode VARCHAR(200))

		INSERT INTO #K12EconomicDisadvantageStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12EconomicDisadvantageStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EconomicDisadvantageStatus'

		CREATE TABLE #K12HomelessnessStatus (HomelessnessStatusCode VARCHAR(50), HomelessnessStatusDescription VARCHAR(200), HomelessnessStatusEdFactsCode VARCHAR(200))

		INSERT INTO #K12HomelessnessStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12HomelessnessStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessnessStatus'

		CREATE TABLE #K12EnglishLearnerStatus (EnglishLearnerStatusCode VARCHAR(50), EnglishLearnerStatusDescription VARCHAR(200), EnglishLearnerStatusEdFactsCode VARCHAR(200))

		INSERT INTO #K12EnglishLearnerStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12EnglishLearnerStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EnglishLearnerStatus'

		CREATE TABLE #K12MigrantStatus (MigrantStatusCode VARCHAR(50), MigrantStatusDescription VARCHAR(200), MigrantStatusEdFactsCode VARCHAR(200))

		INSERT INTO #K12MigrantStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12MigrantStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MigrantStatus'

		CREATE TABLE #K12MilitaryConnectedStudentIndicator (MilitaryConnectedStudentIndicatorCode VARCHAR(50), MilitaryConnectedStudentIndicatorDescription VARCHAR(200), MilitaryConnectedStudentIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #K12MilitaryConnectedStudentIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12MilitaryConnectedStudentIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'MilitaryConnectedStudentIndicator'

		CREATE TABLE #K12HomelessPrimaryNighttimeResidence (HomelessPrimaryNighttimeResidenceCode VARCHAR(50), HomelessPrimaryNighttimeResidenceDescription VARCHAR(200), HomelessPrimaryNighttimeResidenceEdFactsCode VARCHAR(200))

		INSERT INTO #K12HomelessPrimaryNighttimeResidence VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12HomelessPrimaryNighttimeResidence 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessPrimaryNighttimeResidence'

		CREATE TABLE #K12HomelessUnaccompaniedYouthStatus (HomelessUnaccompaniedYouthStatusCode VARCHAR(50), HomelessUnaccompaniedYouthStatusDescription VARCHAR(200), HomelessUnaccompaniedYouthStatusEdFactsCode VARCHAR(200))

		INSERT INTO #K12HomelessUnaccompaniedYouthStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12HomelessUnaccompaniedYouthStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessUnaccompaniedYouthStatus'

		CREATE TABLE #K12Sex (SexCode VARCHAR(50), SexDescription VARCHAR(200), SexEdFactsCode VARCHAR(200))

		INSERT INTO #K12Sex VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #K12Sex 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'Sex'


		INSERT INTO [RDS].[DimK12Demographics]
           ([EconomicDisadvantageStatusCode]
           ,[EconomicDisadvantageStatusDescription]
           ,[EconomicDisadvantageStatusEdFactsCode]
           ,[HomelessnessStatusCode]
           ,[HomelessnessStatusDescription]
           ,[HomelessnessStatusEdFactsCode]
           ,[EnglishLearnerStatusCode]
           ,[EnglishLearnerStatusDescription]
           ,[EnglishLearnerStatusEdFactsCode]
           ,[MigrantStatusCode]
           ,[MigrantStatusDescription]
           ,[MigrantStatusEdFactsCode]
           ,[MilitaryConnectedStudentIndicatorCode]
           ,[MilitaryConnectedStudentIndicatorDescription]
           ,[MilitaryConnectedStudentIndicatorEdFactsCode]
           ,[HomelessPrimaryNighttimeResidenceCode]
           ,[HomelessPrimaryNighttimeResidenceDescription]
           ,[HomelessPrimaryNighttimeResidenceEdFactsCode]
           ,[HomelessUnaccompaniedYouthStatusCode]
           ,[HomelessUnaccompaniedYouthStatusDescription]
           ,[HomelessUnaccompaniedYouthStatusEdFactsCode]
           ,[SexCode]
           ,[SexDescription]
           ,[SexEdFactsCode])
		SELECT DISTINCT
			  a.EconomicDisadvantageStatusCode
			, a.EconomicDisadvantageStatusDescription
			, a.EconomicDisadvantageStatusEdFactsCode
			, b.HomelessnessStatusCode
			, b.HomelessnessStatusDescription
			, b.HomelessnessStatusEdFactsCode
			, c.EnglishLearnerStatusCode
			, c.EnglishLearnerStatusDescription
			, c.EnglishLearnerStatusEdFactsCode
			, d.MigrantStatusCode
			, d.MigrantStatusDescription
			, d.MigrantStatusEdFactsCode
			, e.MilitaryConnectedStudentIndicatorCode
			, e.MilitaryConnectedStudentIndicatorDescription
			, e.MilitaryConnectedStudentIndicatorEdFactsCode
			, f.HomelessPrimaryNighttimeResidenceCode
			, f.HomelessPrimaryNighttimeResidenceDescription
			, f.HomelessPrimaryNighttimeResidenceEdFactsCode
			, g.HomelessUnaccompaniedYouthStatusCode
			, g.HomelessUnaccompaniedYouthStatusDescription
			, g.HomelessUnaccompaniedYouthStatusEdFactsCode
			, h.SexCode
			, h.SexDescription
			, h.SexEdFactsCode
		FROM #K12EconomicDisadvantageStatus a
		CROSS JOIN #K12HomelessnessStatus b
		CROSS JOIN #K12EnglishLearnerStatus c
		CROSS JOIN #K12MigrantStatus d
		CROSS JOIN #K12MilitaryConnectedStudentIndicator e
		CROSS JOIN #K12HomelessPrimaryNighttimeResidence f
		CROSS JOIN #K12HomelessUnaccompaniedYouthStatus g
		CROSS JOIN #K12Sex h
		LEFT JOIN rds.DimK12Demographics main
			ON a.EconomicDisadvantageStatusCode = main.EconomicDisadvantageStatusCode
			AND b.HomelessnessStatusCode = main.HomelessnessStatusCode
			AND c.EnglishLearnerStatusCode = main.EnglishLearnerStatusCode
			AND d.MigrantStatusCode = main.MigrantStatusCode
			AND e.MilitaryConnectedStudentIndicatorCode = main.MilitaryConnectedStudentIndicatorCode
			AND f.HomelessPrimaryNighttimeResidenceCode = main.HomelessPrimaryNighttimeResidenceCode
			AND g.HomelessUnaccompaniedYouthStatusCode = main.HomelessUnaccompaniedYouthStatusCode
			AND h.SexCode = main.SexCode
		WHERE main.DimK12DemographicId IS NULL

	DROP TABLE #K12EconomicDisadvantageStatus
	DROP TABLE #K12HomelessnessStatus
	DROP TABLE #K12EnglishLearnerStatus
	DROP TABLE #K12MigrantStatus
	DROP TABLE #K12MilitaryConnectedStudentIndicator
	DROP TABLE #K12HomelessPrimaryNighttimeResidence
	DROP TABLE #K12HomelessUnaccompaniedYouthStatus
	DROP TABLE #K12Sex


	------------------------------------------------
	-- Populate DimK12AcademicAwardStatuses		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12AcademicAwardStatuses d WHERE d.HighSchoolDiplomaTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimK12AcademicAwardStatuses ON

		INSERT INTO RDS.DimK12AcademicAwardStatuses (DimK12AcademicAwardStatusId, HighSchoolDiplomaTypeCode, HighSchoolDiplomaTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimK12AcademicAwardStatuses OFF
	END

	INSERT INTO RDS.DimK12AcademicAwardStatuses
		(
			  HighSchoolDiplomaTypeCode
			, HighSchoolDiplomaTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimK12AcademicAwardStatuses main
		ON ceds.CedsOptionSetCode = main.HighSchoolDiplomaTypeCode
	WHERE main.DimK12AcademicAwardStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'HighSchoolDiplomaType'

	------------------------------------------------
	-- Populate DimResponsibleSchoolTypes		 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimResponsibleSchoolTypes d WHERE d.ResponsibleSchoolTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimResponsibleSchoolTypes ON

		INSERT INTO RDS.DimResponsibleSchoolTypes (DimResponsibleSchoolTypeId, ResponsibleSchoolTypeCode, ResponsibleSchoolTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimResponsibleSchoolTypes OFF
	END

	INSERT INTO RDS.DimResponsibleSchoolTypes
		(
			  ResponsibleSchoolTypeCode
			, ResponsibleSchoolTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimResponsibleSchoolTypes main
		ON ceds.CedsOptionSetCode = main.ResponsibleSchoolTypeCode
	WHERE main.DimResponsibleSchoolTypeId IS NULL
		AND ceds.CedsElementTechnicalName = 'ResponsibleSchoolType'




	-----------------------------------------------------
	-- Populate DimIdeaStatuses		                   --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIdeaStatuses d WHERE d.DimIdeaStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimIdeaStatuses ON

		INSERT INTO [RDS].[DimIdeaStatuses]
           ([DimIdeaStatusId]
		   ,[SpecialEducationExitReasonCode]
           ,[SpecialEducationExitReasonDescription]
           ,[SpecialEducationExitReasonEdFactsCode]
           ,[PrimaryDisabilityTypeCode]
           ,[PrimaryDisabilityTypeDescription]
           ,[PrimaryDisabilityTypeEdFactsCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeDescription]
           ,[IdeaEducationalEnvironmentForSchoolAgeEdFactsCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodDescription]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode]
           ,[IdeaIndicatorCode]
           ,[IdeaIndicatorDescription]
           ,[IdeaIndicatorEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimIdeaStatuses OFF

	END

		CREATE TABLE #SpecialEducationExitReason (SpecialEducationExitReasonCode VARCHAR(50), SpecialEducationExitReasonDescription VARCHAR(200), SpecialEducationExitReasonEdFactsCode VARCHAR(200))

		INSERT INTO #SpecialEducationExitReason VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #SpecialEducationExitReason 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'SpecialEducationExitReason'

		CREATE TABLE #PrimaryDisabilityType (PrimaryDisabilityTypeCode VARCHAR(50), PrimaryDisabilityTypeDescription VARCHAR(200), PrimaryDisabilityTypeEdFactsCode VARCHAR(200))

		INSERT INTO #PrimaryDisabilityType VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #PrimaryDisabilityType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'PrimaryDisabilityType'

		CREATE TABLE #IdeaEducationalEnvironmentForSchoolAge (IdeaEducationalEnvironmentForSchoolAgeCode VARCHAR(50), IdeaEducationalEnvironmentForSchoolAgeDescription VARCHAR(200), IdeaEducationalEnvironmentForSchoolAgeEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForSchoolAge 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaEducationalEnvironmentForSchoolAge'

		CREATE TABLE #IdeaEducationalEnvironmentForEarlyChildhood (IdeaEducationalEnvironmentForEarlyChildhoodCode VARCHAR(50), IdeaEducationalEnvironmentForEarlyChildhoodDescription VARCHAR(200), IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaEducationalEnvironmentForEarlyChildhood 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaEducationalEnvironmentForEarlyChildhood'

		CREATE TABLE #IdeaIndicator (IdeaIndicatorCode VARCHAR(50), IdeaIndicatorDescription VARCHAR(200), IdeaIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #IdeaIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #IdeaIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'IdeaIndicator'



		INSERT INTO [RDS].[DimIdeaStatuses]
           ([SpecialEducationExitReasonCode]
           ,[SpecialEducationExitReasonDescription]
           ,[SpecialEducationExitReasonEdFactsCode]
           ,[PrimaryDisabilityTypeCode]
           ,[PrimaryDisabilityTypeDescription]
           ,[PrimaryDisabilityTypeEdFactsCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeCode]
           ,[IdeaEducationalEnvironmentForSchoolAgeDescription]
           ,[IdeaEducationalEnvironmentForSchoolAgeEdFactsCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodCode]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodDescription]
           ,[IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode]
           ,[IdeaIndicatorCode]
           ,[IdeaIndicatorDescription]
           ,[IdeaIndicatorEdFactsCode])
		SELECT DISTINCT
			  a.SpecialEducationExitReasonCode
			, a.SpecialEducationExitReasonDescription
			, a.SpecialEducationExitReasonEdFactsCode
			, b.PrimaryDisabilityTypeCode
			, b.PrimaryDisabilityTypeDescription
			, b.PrimaryDisabilityTypeEdFactsCode
			, c.IdeaEducationalEnvironmentForSchoolAgeCode
			, c.IdeaEducationalEnvironmentForSchoolAgeDescription
			, c.IdeaEducationalEnvironmentForSchoolAgeEdFactsCode
			, d.IdeaEducationalEnvironmentForEarlyChildhoodCode
			, d.IdeaEducationalEnvironmentForEarlyChildhoodDescription
			, d.IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode
			, e.IdeaIndicatorCode
			, e.IdeaIndicatorDescription
			, e.IdeaIndicatorEdFactsCode
		FROM #SpecialEducationExitReason a
		CROSS JOIN #PrimaryDisabilityType b
		CROSS JOIN #IdeaEducationalEnvironmentForSchoolAge c
		CROSS JOIN #IdeaEducationalEnvironmentForEarlyChildhood d
		CROSS JOIN #IdeaIndicator e
		LEFT JOIN rds.DimIdeaStatuses main
			ON a.SpecialEducationExitReasonCode = main.SpecialEducationExitReasonCode
			AND b.PrimaryDisabilityTypeCode = main.PrimaryDisabilityTypeCode
			AND c.IdeaEducationalEnvironmentForSchoolAgeCode = main.IdeaEducationalEnvironmentForSchoolAgeCode
			AND d.IdeaEducationalEnvironmentForEarlyChildhoodCode = main.IdeaEducationalEnvironmentForEarlyChildhoodCode
			AND e.IdeaIndicatorCode = main.IdeaIndicatorCode
		WHERE main.DimIdeaStatusId IS NULL

	DROP TABLE #SpecialEducationExitReason
	DROP TABLE #PrimaryDisabilityType
	DROP TABLE #IdeaEducationalEnvironmentForSchoolAge
	DROP TABLE #IdeaEducationalEnvironmentForEarlyChildhood
	DROP TABLE #IdeaIndicator


	------------------------------------------------
	-- Populate DimGradeLevels					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimGradeLevels d WHERE d.GradeLevelCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimGradeLevels ON

		INSERT INTO RDS.DimGradeLevels (DimGradeLevelId, GradeLevelCode, GradeLevelDescription, GradeLevelEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimGradeLevels OFF
	END

	INSERT INTO RDS.DimGradeLevels
		(
			  GradeLevelCode
			, GradeLevelDescription
			, GradeLevelEdFactsCode
		)
	SELECT DISTINCT
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimGradeLevels main
		ON ceds.CedsOptionSetCode = main.GradeLevelCode
	WHERE main.DimGradeLevelId IS NULL
		AND ceds.CedsElementTechnicalName IN
			('AssessmentRegistrationGradeLevelToBeAssessed'
			,'EntryGradeLevel'
			,'ExitGradeLevel'
			,'GradeLevelsApproved'
			,'GradeLevelWhenAssessed'
			,'GradeLevelWhenCourseTaken'
			,'GradesOffered'
			,'Assessment Level for Which Designed')


	-----------------------------------------------------
	-- Populate DimProgramStatuses	                   --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimProgramStatuses d WHERE d.DimProgramStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimProgramStatuses ON

		INSERT INTO [RDS].[DimProgramStatuses]
           ([DimProgramStatusId]
		   ,[EligibilityStatusForSchoolFoodServiceProgramsCode]
           ,[EligibilityStatusForSchoolFoodServiceProgramsDescription]
           ,[EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode]
           ,[FosterCareProgramCode]
           ,[FosterCareProgramDescription]
           ,[FosterCareProgramEdFactsCode]
           ,[TitleIIIImmigrantParticipationStatusCode]
           ,[TitleIIIImmigrantParticipationStatusDescription]
           ,[TitleIIIImmigrantParticipationStatusEdFactsCode]
           ,[Section504StatusCode]
           ,[Section504StatusDescription]
           ,[Section504StatusEdFactsCode]
           ,[TitleiiiProgramParticipationCode]
           ,[TitleiiiProgramParticipationDescription]
           ,[TitleiiiProgramParticipationEdFactsCode]
           ,[HomelessServicedIndicatorCode]
           ,[HomelessServicedIndicatorDescription]
           ,[HomelessServicedIndicatorEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimProgramStatuses OFF

	END

		CREATE TABLE #EligibilityStatusForSchoolFoodServicePrograms (EligibilityStatusForSchoolFoodServiceProgramsCode VARCHAR(50), EligibilityStatusForSchoolFoodServiceProgramsDescription VARCHAR(200), EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode VARCHAR(200))

		INSERT INTO #EligibilityStatusForSchoolFoodServicePrograms VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #EligibilityStatusForSchoolFoodServicePrograms 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'EligibilityStatusForSchoolFoodServicePrograms'


		CREATE TABLE #FosterCareProgram (FosterCareProgramCode VARCHAR(50), FosterCareProgramDescription VARCHAR(200), FosterCareProgramEdFactsCode VARCHAR(200))

		INSERT INTO #FosterCareProgram VALUES 
		('MISSING', 'MISSING', 'MISSING')
		,('Yes', 'Yes', NULL)
		,('No', 'No', NULL)

		CREATE TABLE #TitleIIIImmigrantParticipationStatus (TitleIIIImmigrantParticipationStatusCode VARCHAR(50), TitleIIIImmigrantParticipationStatusDescription VARCHAR(200), TitleIIIImmigrantParticipationStatusEdFactsCode VARCHAR(200))

		INSERT INTO #TitleIIIImmigrantParticipationStatus VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #TitleIIIImmigrantParticipationStatus 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'TitleIIIImmigrantParticipationStatus'

		CREATE TABLE #Section504Status (Section504StatusCode VARCHAR(50), Section504StatusDescription VARCHAR(200), Section504StatusEdFactsCode VARCHAR(200))

		INSERT INTO #Section504Status VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #Section504Status 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'Section504Status'

		CREATE TABLE #TitleiiiProgramParticipation (TitleiiiProgramParticipationCode VARCHAR(50), TitleiiiProgramParticipationDescription VARCHAR(200), TitleiiiProgramParticipationEdFactsCode VARCHAR(200))

		INSERT INTO #TitleiiiProgramParticipation VALUES 
		('MISSING', 'MISSING', 'MISSING')
		,('Yes', 'Yes', NULL)
		,('No', 'No', NULL)

		CREATE TABLE #HomelessServicedIndicator (HomelessServicedIndicatorCode VARCHAR(50), HomelessServicedIndicatorDescription VARCHAR(200), HomelessServicedIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #HomelessServicedIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #HomelessServicedIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HomelessServicedIndicator'


		INSERT INTO [RDS].[DimProgramStatuses]
           ([EligibilityStatusForSchoolFoodServiceProgramsCode]
           ,[EligibilityStatusForSchoolFoodServiceProgramsDescription]
           ,[EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode]
           ,[FosterCareProgramCode]
           ,[FosterCareProgramDescription]
           ,[FosterCareProgramEdFactsCode]
           ,[TitleIIIImmigrantParticipationStatusCode]
           ,[TitleIIIImmigrantParticipationStatusDescription]
           ,[TitleIIIImmigrantParticipationStatusEdFactsCode]
           ,[Section504StatusCode]
           ,[Section504StatusDescription]
           ,[Section504StatusEdFactsCode]
           ,[TitleiiiProgramParticipationCode]
           ,[TitleiiiProgramParticipationDescription]
           ,[TitleiiiProgramParticipationEdFactsCode]
           ,[HomelessServicedIndicatorCode]
           ,[HomelessServicedIndicatorDescription]
           ,[HomelessServicedIndicatorEdFactsCode])
		SELECT DISTINCT
			  a.EligibilityStatusForSchoolFoodServiceProgramsCode
			, a.EligibilityStatusForSchoolFoodServiceProgramsDescription
			, a.EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode
			, b.FosterCareProgramCode
			, b.FosterCareProgramDescription
			, b.FosterCareProgramEdFactsCode
			, c.TitleIIIImmigrantParticipationStatusCode
			, c.TitleIIIImmigrantParticipationStatusDescription
			, c.TitleIIIImmigrantParticipationStatusEdFactsCode
			, d.Section504StatusCode
			, d.Section504StatusDescription
			, d.Section504StatusEdFactsCode
			, e.TitleiiiProgramParticipationCode
			, e.TitleiiiProgramParticipationDescription
			, e.TitleiiiProgramParticipationEdFactsCode
			, f.HomelessServicedIndicatorCode
			, f.HomelessServicedIndicatorDescription
			, f.HomelessServicedIndicatorEdFactsCode
		FROM #EligibilityStatusForSchoolFoodServicePrograms a
		CROSS JOIN #FosterCareProgram b
		CROSS JOIN #TitleIIIImmigrantParticipationStatus c
		CROSS JOIN #Section504Status d
		CROSS JOIN #TitleiiiProgramParticipation e
		CROSS JOIN #HomelessServicedIndicator f
		LEFT JOIN rds.DimProgramStatuses main
			ON a.EligibilityStatusForSchoolFoodServiceProgramsCode = main.EligibilityStatusForSchoolFoodServiceProgramsCode
			AND b.FosterCareProgramCode = main.FosterCareProgramCode
			AND c.TitleIIIImmigrantParticipationStatusCode = main.TitleIIIImmigrantParticipationStatusCode
			AND d.Section504StatusCode = main.Section504StatusCode
			AND e.TitleiiiProgramParticipationCode = main.TitleiiiProgramParticipationCode
			AND f.HomelessServicedIndicatorCode = main.HomelessServicedIndicatorCode
		WHERE main.DimProgramStatusId IS NULL

	DROP TABLE #EligibilityStatusForSchoolFoodServicePrograms
	DROP TABLE #FosterCareProgram
	DROP TABLE #TitleIIIImmigrantParticipationStatus
	DROP TABLE #Section504Status
	DROP TABLE #TitleiiiProgramParticipation
	DROP TABLE #HomelessServicedIndicator



	------------------------------------------------
	-- Populate DimIndividualizedProgramStatuses ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimIndividualizedProgramStatuses d WHERE d.StudentSupportServiceTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimIndividualizedProgramStatuses ON

		INSERT INTO RDS.DimIndividualizedProgramStatuses (DimIndividualizedProgramStatusId, StudentSupportServiceTypeCode, StudentSupportServiceTypeDescription)
			VALUES (-1, 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimIndividualizedProgramStatuses OFF
	END

	INSERT INTO RDS.DimIndividualizedProgramStatuses
		(
			  StudentSupportServiceTypeCode
			, StudentSupportServiceTypeDescription		
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimIndividualizedProgramStatuses main
		ON ceds.CedsOptionSetCode = main.StudentSupportServiceTypeCode
	WHERE main.DimIndividualizedProgramStatusId IS NULL
		AND ceds.CedsElementTechnicalName = 'StudentSupportServiceType'

	------------------------------------------------
	-- Populate DimDisabilities					 ---
	------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimDisabilities d WHERE d.IdeaDisabilityTypeCode = 'MISSING') BEGIN
		SET IDENTITY_INSERT RDS.DimDisabilities ON

		INSERT INTO RDS.DimDisabilities (DimDisabilityId, IdeaDisabilityTypeCode, IdeaDisabilityTypeDescription, IdeaDisabilityTypeEdFactsCode)
			VALUES (-1, 'MISSING', 'MISSING', 'MISSING')

		SET IDENTITY_INSERT RDS.DimDisabilities OFF
	END

	INSERT INTO RDS.DimDisabilities
		(
			  IdeaDisabilityTypeCode
			, IdeaDisabilityTypeDescription
			, IdeaDisabilityTypeEdFactsCode
		)
	SELECT 
		  ceds.CedsOptionSetCode
		, ceds.CedsOptionSetDescription
		, ceds.EdFactsOptionSetCode
	FROM CEDS.CedsOptionSetMapping ceds
	LEFT JOIN RDS.DimDisabilities main
		ON ceds.CedsOptionSetCode = main.IdeaDisabilityTypeCode
	WHERE main.DimDisabilityId IS NULL
		AND ceds.CedsElementTechnicalName = 'IdeaDisabilityType'


	-----------------------------------------------------
	-- Populate DimK12StudentStatuses	               --
	-----------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM RDS.DimK12StudentStatuses d WHERE d.DimK12StudentStatusId = -1) BEGIN
		SET IDENTITY_INSERT RDS.DimK12StudentStatuses ON

		INSERT INTO [RDS].[DimK12StudentStatuses]
           ([DimK12StudentStatusId]
		   ,[HighSchoolDiplomaTypeCode]
           ,[HighSchoolDiplomaTypeDescription]
           ,[HighSchoolDiplomaTypeEdFactsCode]
           ,[MobilityStatus12moCode]
           ,[MobilityStatus12moDescription]
           ,[MobilityStatus12moEdFactsCode]
           ,[MobilityStatusSYCode]
           ,[MobilityStatusSYDescription]
           ,[MobilityStatusSYEdFactsCode]
           ,[ReferralStatusCode]
           ,[ReferralStatusDescription]
           ,[ReferralStatusEdFactsCode]
           ,[MobilityStatus36moCode]
           ,[MobilityStatus36moDescription]
           ,[MobilityStatus36moEdFactsCode]
           ,[PlacementStatusCode]
           ,[PlacementStatusDescription]
           ,[PlacementStatusEdFactsCode]
           ,[PlacementTypeCode]
           ,[PlacementTypeDescription]
           ,[PlacementTypeEdFactsCode]
           ,[NSLPDirectCertificationIndicatorCode]
           ,[NSLPDirectCertificationIndicatorDescription]
           ,[NSLPDirectCertificationIndicatorEdFactsCode])
			VALUES (
				  -1
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				, 'MISSING'
				)

		SET IDENTITY_INSERT RDS.DimK12StudentStatuses OFF

	END

		CREATE TABLE #HighSchoolDiplomaType (HighSchoolDiplomaTypeCode VARCHAR(50), HighSchoolDiplomaTypeDescription VARCHAR(200), HighSchoolDiplomaTypeEdFactsCode VARCHAR(200))

		INSERT INTO #HighSchoolDiplomaType VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #HighSchoolDiplomaType 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'HighSchoolDiplomaType'


		CREATE TABLE #MobilityStatus12mo (MobilityStatus12moCode VARCHAR(50), MobilityStatus12moDescription VARCHAR(200), MobilityStatus12moEdFactsCode VARCHAR(200))

		INSERT INTO #MobilityStatus12mo VALUES 
		('MISSING', 'MISSING', 'MISSING')

		CREATE TABLE #MobilityStatusSY (MobilityStatusSYCode VARCHAR(50), MobilityStatusSYDescription VARCHAR(200), MobilityStatusSYEdFactsCode VARCHAR(200))

		INSERT INTO #MobilityStatusSY VALUES 
		('MISSING', 'MISSING', 'MISSING')

		CREATE TABLE #ReferralStatus (ReferralStatusCode VARCHAR(50), ReferralStatusDescription VARCHAR(200), ReferralStatusEdFactsCode VARCHAR(200))

		INSERT INTO #ReferralStatus VALUES 
		('MISSING', 'MISSING', 'MISSING')

		CREATE TABLE #MobilityStatus36mo (MobilityStatus36moCode VARCHAR(50), MobilityStatus36moDescription VARCHAR(200), MobilityStatus36moEdFactsCode VARCHAR(200))

		INSERT INTO #MobilityStatus36mo VALUES 
		('MISSING', 'MISSING', 'MISSING')

		CREATE TABLE #PlacementStatus (PlacementStatusCode VARCHAR(50), PlacementStatusDescription VARCHAR(200), PlacementStatusEdFactsCode VARCHAR(200))

		INSERT INTO #PlacementStatus VALUES 
		('MISSING', 'MISSING', 'MISSING')

		CREATE TABLE #PlacementType (PlacementTypeCode VARCHAR(50), PlacementTypeDescription VARCHAR(200), PlacementTypeEdFactsCode VARCHAR(200))

		INSERT INTO #PlacementType VALUES 
		('MISSING', 'MISSING', 'MISSING')

		CREATE TABLE #NSLPDirectCertificationIndicator (NSLPDirectCertificationIndicatorCode VARCHAR(50), NSLPDirectCertificationIndicatorDescription VARCHAR(200), NSLPDirectCertificationIndicatorEdFactsCode VARCHAR(200))

		INSERT INTO #NSLPDirectCertificationIndicator VALUES ('MISSING', 'MISSING', 'MISSING')
		INSERT INTO #NSLPDirectCertificationIndicator 
		SELECT 
			  CedsOptionSetCode
			, CedsOptionSetDescription
			, EdFactsOptionSetCode
		FROM CEDS.CedsOptionSetMapping
		WHERE CedsElementTechnicalName = 'NationalSchoolLunchProgramDirectCertificationIndicator'


		INSERT INTO [RDS].[DimK12StudentStatuses]
           ([HighSchoolDiplomaTypeCode]
           ,[HighSchoolDiplomaTypeDescription]
           ,[HighSchoolDiplomaTypeEdFactsCode]
           ,[MobilityStatus12moCode]
           ,[MobilityStatus12moDescription]
           ,[MobilityStatus12moEdFactsCode]
           ,[MobilityStatusSYCode]
           ,[MobilityStatusSYDescription]
           ,[MobilityStatusSYEdFactsCode]
           ,[ReferralStatusCode]
           ,[ReferralStatusDescription]
           ,[ReferralStatusEdFactsCode]
           ,[MobilityStatus36moCode]
           ,[MobilityStatus36moDescription]
           ,[MobilityStatus36moEdFactsCode]
           ,[PlacementStatusCode]
           ,[PlacementStatusDescription]
           ,[PlacementStatusEdFactsCode]
           ,[PlacementTypeCode]
           ,[PlacementTypeDescription]
           ,[PlacementTypeEdFactsCode]
           ,[NSLPDirectCertificationIndicatorCode]
           ,[NSLPDirectCertificationIndicatorDescription]
           ,[NSLPDirectCertificationIndicatorEdFactsCode])
		SELECT DISTINCT
			  a.HighSchoolDiplomaTypeCode
			, a.HighSchoolDiplomaTypeDescription
			, a.HighSchoolDiplomaTypeEdFactsCode
			, b.MobilityStatus12moCode
			, b.MobilityStatus12moDescription
			, b.MobilityStatus12moEdFactsCode
			, c.MobilityStatusSYCode
			, c.MobilityStatusSYDescription
			, c.MobilityStatusSYEdFactsCode
			, d.ReferralStatusCode
			, d.ReferralStatusDescription
			, d.ReferralStatusEdFactsCode
			, e.MobilityStatus36moCode
			, e.MobilityStatus36moDescription
			, e.MobilityStatus36moEdFactsCode
			, f.PlacementStatusCode
			, f.PlacementStatusDescription
			, f.PlacementStatusEdFactsCode
			, g.PlacementTypeCode
			, g.PlacementTypeDescription
			, g.PlacementTypeEdFactsCode
			, h.NSLPDirectCertificationIndicatorCode
			, h.NSLPDirectCertificationIndicatorDescription
			, h.NSLPDirectCertificationIndicatorEdFactsCode
		FROM #HighSchoolDiplomaType a
		CROSS JOIN #MobilityStatus12mo b
		CROSS JOIN #MobilityStatusSY c
		CROSS JOIN #ReferralStatus d
		CROSS JOIN #MobilityStatus36mo e
		CROSS JOIN #PlacementStatus f
		CROSS JOIN #PlacementType g
		CROSS JOIN #NSLPDirectCertificationIndicator h
		LEFT JOIN rds.DimK12StudentStatuses main
			ON a.HighSchoolDiplomaTypeCode = main.HighSchoolDiplomaTypeCode
			AND b.MobilityStatus12moCode = main.MobilityStatus12moCode
			AND c.MobilityStatusSYCode = main.MobilityStatusSYCode
			AND d.ReferralStatusCode = main.ReferralStatusCode
			AND e.MobilityStatus36moCode = main.MobilityStatus36moCode
			AND f.PlacementStatusCode = main.PlacementStatusCode
			AND g.PlacementTypeCode = main.PlacementTypeCode
			AND h.NSLPDirectCertificationIndicatorCode = main.NSLPDirectCertificationIndicatorCode
		WHERE main.DimK12StudentStatusId IS NULL

	DROP TABLE #HighSchoolDiplomaType
	DROP TABLE #MobilityStatus12mo
	DROP TABLE #MobilityStatusSY
	DROP TABLE #ReferralStatus
	DROP TABLE #MobilityStatus36mo
	DROP TABLE #PlacementStatus
	DROP TABLE #PlacementType
	DROP TABLE #NSLPDirectCertificationIndicator
