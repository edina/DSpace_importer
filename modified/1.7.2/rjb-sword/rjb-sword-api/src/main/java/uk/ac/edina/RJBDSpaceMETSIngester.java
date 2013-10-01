package uk.ac.edina;

import org.dspace.content.packager.DSpaceMETSIngester;

public class RJBDSpaceMETSIngester extends DSpaceMETSIngester {

	private static final String RJB_PROFILE = "RJB METS SIP Profile 1.0";
	
	@Override
	protected String profilePrefix() {
		return RJB_PROFILE;
	}

	
}
