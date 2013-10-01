package uk.ac.edina;

import org.dspace.content.DSpaceObject;
import org.dspace.core.Context;
import org.dspace.sword.DSpaceSWORDException;
import org.dspace.sword.DepositManager;
import org.dspace.sword.Depositor;
import org.dspace.sword.SWORDConfiguration;
import org.dspace.sword.SWORDService;
import org.dspace.sword.SWORDUrlManager;


public class RJBDepositManager extends DepositManager {

	public RJBDepositManager(SWORDService service){
		super(service);
	}

	@Override
	protected SWORDUrlManager initUrlManager(Context context) {
		return new RJBSWORDUrlManager(new SWORDConfiguration(), context);
	}

	@Override
	protected Depositor initCollectionDepositor(SWORDService service,
			DSpaceObject dso) throws DSpaceSWORDException {
		return new RJBCollectionDepositor(service, dso);
	}
	
	
	
}
