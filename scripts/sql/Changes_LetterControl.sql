--do this in production in order to Medhok.Letter to work correctly
ALTER TABLE Medhok.LetterControl ADD
	CONSTRAINT pkey_letter_control__letter_ctrl_rec_id
		PRIMARY KEY (LetterCtrlRecId);