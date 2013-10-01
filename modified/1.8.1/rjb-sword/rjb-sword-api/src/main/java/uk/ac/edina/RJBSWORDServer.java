package uk.ac.edina;

import org.dspace.sword.DSpaceSWORDServer;
import org.dspace.sword.DepositManager;
import org.dspace.sword.SWORDService;

public class RJBSWORDServer extends DSpaceSWORDServer {

	@Override
	protected DepositManager initDepositManager(SWORDService service) {
		return new RJBDepositManager(service);
	}

	
	
}
