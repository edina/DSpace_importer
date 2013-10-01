package uk.ac.edina;

import org.dspace.content.packager.PackageIngester;
import org.dspace.sword.SWORDMETSIngester;

public class RJBSwordMETSIngester extends SWORDMETSIngester {

	@Override
	protected PackageIngester initPackageIngester(String cfg) {
		return new RJBDSpaceMETSIngester();
	}

	
	
}
