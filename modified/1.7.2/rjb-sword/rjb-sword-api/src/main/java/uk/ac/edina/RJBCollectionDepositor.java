package uk.ac.edina;

import org.dspace.content.Collection;
import org.dspace.content.DSpaceObject;
import org.dspace.core.Context;
import org.dspace.sword.CollectionDepositor;
import org.dspace.sword.DSpaceSWORDException;
import org.dspace.sword.SWORDConfiguration;
import org.dspace.sword.SWORDIngester;
import org.dspace.sword.SWORDService;
import org.purl.sword.base.Deposit;
import org.purl.sword.base.SWORDErrorException;

public class RJBCollectionDepositor extends CollectionDepositor {

	private static final String RJB_PACKAGING = "http://opendepot.org/broker/1.0";
	
	public RJBCollectionDepositor(SWORDService swordService, DSpaceObject dso) throws DSpaceSWORDException{
		super(swordService, dso);
	}

	@Override
	protected SWORDIngester initIngester(Context context, Deposit deposit,
			Collection collection) throws SWORDErrorException,
			DSpaceSWORDException {
		return new RJBSwordMETSIngester();
	}

	@Override
	protected boolean isSupportedMediaType(SWORDConfiguration swordConfig,
			Deposit deposit) throws SWORDErrorException, DSpaceSWORDException {
		return deposit.getPackaging().equalsIgnoreCase(RJB_PACKAGING);
	}
	
	
}
